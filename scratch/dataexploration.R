library(tidyverse)

bq1 = read_csv("data/QuebradaCuenca1-Bisley.csv")
bq2 = read_csv("data/QuebradaCuenca2-Bisley.csv")
bq3 = read_csv("data/QuebradaCuenca3-Bisley.csv")
prm = read_csv("data/RioMameyesPuenteRoto.csv")


# Figure 1: Concentrations in Bisley, Puerto Rico streams before and after Hurricane Hugo, 
# 9-wk moving averags. (a) potassium, (b) nitrate-N, (c) magnesium, (d) calcium and (e) ammonium-N. 
# The vertical lines mark the time of hurricane disturbance. Reproduced from Schaefer et al. (2000).

# seq(ymd("1989-01-01"), ymd("1995-01-01"), by = "9 weeks")

# bind_rows only makes more rows and not columns 
#new <- bind_rows(bq1)                              ''' CHANGED VARIABLE FOR MERGE CONFLICT. ORIGINALLY new'''
  # , bq2, bq3, prm)
# view(new)


q1_filtered <- bq1 |> 
  select("Sample_ID", "Sample_Date", "K", "Mg", "Ca", "NH4-N", "NO3-N") |> 
# 1988 to 1995
  filter(Sample_Date >= ymd("1989-01-01") & Sample_Date < ymd("1995-01-01"))

q1_table = tibble(
  site = "Q1",
  year = q1_filtered$Sample_Date,
  k_con = NA,
  nitrate_con = NA, 
  mg_con = NA,
  ca_con = NA,
  amm_con = NA
)

for (x in 1:nrow(q1_filtered)) {
  w1 <- q1_filtered$Sample_Date[x]
  print(w1)
  w2 <- w1 + weeks(9)
  print(w2)

  k_values <- q1_filtered$K[q1_filtered$Sample_Date >= w1 & q1_filtered$Sample_Date < w2]
  # print("")
  mg_values <- q1_filtered$Mg[q1_filtered$Sample_Date >= w1 & q1_filtered$Sample_Date < w2]
  ca_values <- q1_filtered$Ca[q1_filtered$Sample_Date >= w1 & q1_filtered$Sample_Date < w2]
  nh4_values <- q1_filtered$`NH4-N`[q1_filtered$Sample_Date >= w1 & q1_filtered$Sample_Date < w2]
  no3_values <- q1_filtered$`NO3-N`[q1_filtered$Sample_Date >= w1 & q1_filtered$Sample_Date < w2]

  # print(k_values)
  k_mean <- mean(k_values, na.rm = TRUE)
  mg_mean <- mean(mg_values, na.rm = TRUE)
  ca_mean <- mean(ca_values, na.rm = TRUE)
  nh4_mean <- mean(nh4_values, na.rm = TRUE)
  no3_mean <- mean(no3_values, na.rm = TRUE)

  q1_table$k_con[x] <- k_mean
  q1_table$mg_con[x] <- mg_mean
  q1_table$ca_con[x] <- ca_mean
  q1_table$amm_con[x] <- nh4_mean
  q1_table$nitrate_con[x] <- no3_mean
}

# ===================================================================

q2_filtered <- bq2 |> 
  select("Sample_ID", "Sample_Date", "K", "Mg", "Ca", "NH4-N", "NO3-N") |> 
# 1988 to 1995
  filter(Sample_Date >= ymd("1989-01-01") & Sample_Date < ymd("1995-01-01"))

q2_table = tibble(
  site = "Q2",
  year = q2_filtered$Sample_Date,
  k_con = NA,
  nitrate_con = NA, 
  mg_con = NA,
  ca_con = NA,
  amm_con = NA
)

for (x in 1:nrow(q2_filtered)) {
  w1 <- q2_filtered$Sample_Date[x]
  print(w1)
  w2 <- w1 + weeks(9)
  print(w2)

  k_values <- q2_filtered$K[q2_filtered$Sample_Date >= w1 & q2_filtered$Sample_Date < w2]
  # print("")
  mg_values <- q2_filtered$Mg[q2_filtered$Sample_Date >= w1 & q2_filtered$Sample_Date < w2]
  ca_values <- q2_filtered$Ca[q2_filtered$Sample_Date >= w1 & q2_filtered$Sample_Date < w2]
  nh4_values <- q2_filtered$`NH4-N`[q2_filtered$Sample_Date >= w1 & q2_filtered$Sample_Date < w2]
  no3_values <- q2_filtered$`PO4-P`[q2_filtered$Sample_Date >= w1 & q2_filtered$Sample_Date < w2]

  # print(k_values)
  k_mean <- mean(k_values, na.rm = TRUE)
  mg_mean <- mean(mg_values, na.rm = TRUE)
  ca_mean <- mean(ca_values, na.rm = TRUE)
  nh4_mean <- mean(nh4_values, na.rm = TRUE)
  no3_mean <- mean(no3_values, na.rm = TRUE)

  q2_table$k_con[x] <- k_mean
  q2_table$mg_con[x] <- mg_mean
  q2_table$ca_con[x] <- ca_mean
  q2_table$amm_con[x] <- nh4_mean
  q2_table$nitrate_con[x] <- no3_mean
}

# ===================================================================

q3_filtered <- bq3 |> 
  select("Sample_ID", "Sample_Date", "K", "Mg", "Ca", "NH4-N", "NO3-N") |> 
# 1988 to 1995
  filter(Sample_Date >= ymd("1989-01-01") & Sample_Date < ymd("1995-01-01"))

q3_table = tibble(
  site = "Q3",
  year = q3_filtered$Sample_Date,
  k_con = NA,
  nitrate_con = NA, 
  mg_con = NA,
  ca_con = NA,
  amm_con = NA
)

for (x in 1:nrow(q3_filtered)) {
  w1 <- q3_filtered$Sample_Date[x]
  print(w1)
  w2 <- w1 + weeks(9)
  print(w2)

  k_values <- q3_filtered$K[q3_filtered$Sample_Date >= w1 & q3_filtered$Sample_Date < w2]
  # print("")
  mg_values <- q3_filtered$Mg[q3_filtered$Sample_Date >= w1 & q3_filtered$Sample_Date < w2]
  ca_values <- q3_filtered$Ca[q3_filtered$Sample_Date >= w1 & q3_filtered$Sample_Date < w2]
  nh4_values <- q3_filtered$`NH4-N`[q3_filtered$Sample_Date >= w1 & q3_filtered$Sample_Date < w2]
  no3_values <- q3_filtered$`PO4-P`[q3_filtered$Sample_Date >= w1 & q3_filtered$Sample_Date < w2]

  # print(k_values)
  k_mean <- mean(k_values, na.rm = TRUE)
  mg_mean <- mean(mg_values, na.rm = TRUE)
  ca_mean <- mean(ca_values, na.rm = TRUE)
  nh4_mean <- mean(nh4_values, na.rm = TRUE)
  no3_mean <- mean(no3_values, na.rm = TRUE)

  q3_table$k_con[x] <- k_mean
  q3_table$mg_con[x] <- mg_mean
  q3_table$ca_con[x] <- ca_mean
  q3_table$amm_con[x] <- nh4_mean
  q3_table$nitrate_con[x] <- no3_mean
}

# ===================================================================

prm_filtered <- prm |> 
  select("Sample_ID", "Sample_Date", "K", "Mg", "Ca", "NH4-N", "") |> 
# 1988 to 1995
  filter(Sample_Date >= ymd("1989-01-01") & Sample_Date < ymd("1995-01-01"))

prm_table = tibble(
  site = "prm",
  year = prm_filtered$Sample_Date,
  k_con = NA,
  nitrate_con = NA, 
  mg_con = NA,
  ca_con = NA,
  amm_con = NA
)

for (x in 1:nrow(prm_filtered)) {
  w1 <- prm_filtered$Sample_Date[x]
  print(w1)
  w2 <- w1 + weeks(9)
  print(w2)

  k_values <- prm_filtered$K[prm_filtered$Sample_Date >= w1 & prm_filtered$Sample_Date < w2]
  # print("")
  mg_values <- prm_filtered$Mg[prm_filtered$Sample_Date >= w1 & prm_filtered$Sample_Date < w2]
  ca_values <- prm_filtered$Ca[prm_filtered$Sample_Date >= w1 & prm_filtered$Sample_Date < w2]
  nh4_values <- prm_filtered$`NH4-N`[prm_filtered$Sample_Date >= w1 & prm_filtered$Sample_Date < w2]
  no3_values <- prm_filtered$`PO4-P`[prm_filtered$Sample_Date >= w1 & prm_filtered$Sample_Date < w2]

  # print(k_values)
  k_mean <- mean(k_values, na.rm = TRUE)
  mg_mean <- mean(mg_values, na.rm = TRUE)
  ca_mean <- mean(ca_values, na.rm = TRUE)
  nh4_mean <- mean(nh4_values, na.rm = TRUE)
  no3_mean <- mean(no3_values, na.rm = TRUE)

  prm_table$k_con[x] <- k_mean
  prm_table$mg_con[x] <- mg_mean
  prm_table$ca_con[x] <- ca_mean
  prm_table$amm_con[x] <- nh4_mean
  prm_table$nitrate_con[x] <- no3_mean
}

ion_site_table <- bind_rows(q1_table, q2_table, q3_table, prm_table)

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

