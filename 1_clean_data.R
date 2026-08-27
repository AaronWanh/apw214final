library(tidyverse)
source("R/moving-average.R")


bq1 <- read_csv("data/QuebradaCuenca1-Bisley.csv")
bq2 <- read_csv("data/QuebradaCuenca2-Bisley.csv")
bq3 <- read_csv("data/QuebradaCuenca3-Bisley.csv")
mpr <- read_csv("data/RioMameyesPuenteRoto.csv")

new_bq1 <- moving_average(bq1)
new_bq2 <- moving_average(bq2)
new_bq3 <- moving_average(bq3)
new_mpr <- moving_average(mpr)

ion_site_table <- bind_rows(new_bq1, new_bq2, new_bq3, new_mpr)
new_table <- ion_site_table |>
  pivot_longer(
    col = k_con:amm_con,
    names_to = "ions",
    values_to = "avg_ion_conc"
  )
write_csv(new_table, "output/cleaned_ion_site.csv")
