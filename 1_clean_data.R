library(tidyverse)
source("R/moving-average.R")

# read each raw data file
bq1 <- read_csv("data/QuebradaCuenca1-Bisley.csv")
bq2 <- read_csv("data/QuebradaCuenca2-Bisley.csv")
bq3 <- read_csv("data/QuebradaCuenca3-Bisley.csv")
mpr <- read_csv("data/RioMameyesPuenteRoto.csv")

# calls the function
new_bq1 <- moving_average(bq1)
new_bq2 <- moving_average(bq2)
new_bq3 <- moving_average(bq3)
new_mpr <- moving_average(mpr)

# combines all the new dataset with the calculated averages
ion_site_table <- bind_rows(new_bq1, new_bq2, new_bq3, new_mpr)

# moves the ion columns to values under ions
new_table <- ion_site_table |>
  pivot_longer(
    col = k_mg_l:amm_ug_l,
    names_to = "ions",
    values_to = "avg_ion_conc"
  )

# write the dataset as a csv file
write_csv(new_table, "output/cleaned_ion_site.csv")
