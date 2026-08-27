library(tidyverse)
source("R/moving-average.R")

bq1 <- read_csv("data/QuebradaCuenca1-Bisley.csv")
bq2 <- read_csv("data/QuebradaCuenca2-Bisley.csv")
bq3 <- read_csv("data/QuebradaCuenca3-Bisley.csv")
prm <- read_csv("data/RioMameyesPuenteRoto.csv")


# Figure 1: Concentrations in Bisley, Puerto Rico streams before and after Hurricane Hugo,
# 9-wk moving averags. (a) potassium, (b) nitrate-N, (c) magnesium, (d) calcium and (e) ammonium-N.
# The vertical lines mark the time of hurricane disturbance. Reproduced from Schaefer et al. (2000).

# seq(ymd("1989-01-01"), ymd("1995-01-01"), by = "9 weeks")

# bind_rows only makes more rows and not columns
#new <- bind_rows(bq1)                              ''' CHANGED VARIABLE FOR MERGE CONFLICT. ORIGINALLY new'''
# , bq2, bq3, prm)
# view(new)
new_bq1 <- moving_average(bq1)
new_bq2 <- moving_average(bq2)
new_bq3 <- moving_average(bq3)
new_prm <- moving_average(prm)

ion_site_table <- bind_rows(new_bq1, new_bq2, new_bq3, new_prm)

new_table <- ion_site_table |>
  pivot_longer(
    col = k_con:amm_con,
    names_to = "ions",
    values_to = "avg_ion_conc"
  )
# #   pivot_wider(
# #     names_from = site,
# #     values_from = site,
# #   )

# Potassium Graph
ggplot(
  data = new_table,
  mapping = aes(
    x = year,
    y = avg_ion_conc,
    color = site
  )
) +
  geom_point() +
  geom_line() +
  scale_x_date(
    limits = as.Date(c("1989-01-01", "1995-01-01")),
    date_breaks = "1 year",
    date_labels = "%Y"
  ) +
  facet_wrap(~ions, ncol = 1, scales = "free")

# # Phosphate Graph
# ggplot(
#   data = ion_site_table,
#   mapping = aes(
#     x = year,
#     y = nitrate_con,
#     color = site
#   )
# ) +
#   geom_point() +
#   geom_line()
