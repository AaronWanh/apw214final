library(tidyverse)

bq1 = read_csv("data/QuebradaCuenca1-Bisley.csv")
bq2 = read_csv("data/QuebradaCuenca2-Bisley.csv")
bq3 = read_csv("data/QuebradaCuenca3-Bisley.csv")
prm = read_csv("data/RioMameyesPuenteRoto.csv")



# Figure 1: Concentrations in Bisley, Puerto Rico streams before and after Hurricane Hugo, 
# 9-wk moving averags. (a) potassium, (b) nitrate-N, (c) magnesium, (d) calcium and (e) ammonium-N. 
# The vertical lines mark the time of hurricane disturbance. Reproduced from Schaefer et al. (2000).


q1_table = tibble(
  site = "Q1",
  year = seq(ymd("1988-01-01"), ymd("1995-01-01"), by = "9 weeks"),
  k_con = NA,
  nitrate_con = NA, 
  mg_con = NA,
  ca_con = NA,
  amm_con = NA
)

# bind_rows only makes more rows and not columns 
old <- bind_rows(bq1)                              '''CHANGED new to old FOR MERGED CONFLICT'''
  # , bq2, bq3, prm)
# view(new)

q1_filtered <- new |> 
  select("Sample_ID", "Sample_Date", "K", "Mg", "Ca", "NH4-N", "PO4-P") |> 
# 1988 to 1995
  filter(Sample_Date >= ymd("1988-01-01") & Sample_Date < ymd("1995-01-01"))

w2 = q1_filtered$Sample_Date[1]
for (x in 1:length(q1_table$year)) {
  w1 <- w2
  print(w1)
  w2 <- w1 + weeks(9)
  print(w2)
  
  k_values <- q1_filtered$K[q1_filtered$Sample_Date >= w1 & q1_filtered$Sample_Date < w2]
  mg_values <- q1_filtered$Mg[q1_filtered$Sample_Date >= w1 & q1_filtered$Sample_Date < w2]
  ca_values <- q1_filtered$Ca[q1_filtered$Sample_Date >= w1 & q1_filtered$Sample_Date < w2]
  nh4_values <- q1_filtered$`NH4-N`[q1_filtered$Sample_Date >= w1 & q1_filtered$Sample_Date < w2]
  po4_values <- q1_filtered$`PO4-P`[q1_filtered$Sample_Date >= w1 & q1_filtered$Sample_Date < w2]

  # print(k_values)
  k_mean <- mean(k_values, na.rm = TRUE)
  mg_mean <- mean(mg_values, na.rm = TRUE)
  ca_mean <- mean(ca_values, na.rm = TRUE)
  nh4_mean <- mean(nh4_values, na.rm = TRUE)
  po4_mean <- mean(po4_values, na.rm = TRUE)

  q1_table$k_con[x] <- k_mean
  q1_table$mg_con[x] <- mg_mean
  q1_table$ca_con[x] <- ca_mean
  q1_table$nitrate_con[x] <- nh4_mean
  q1_table$amm_con[x] <- po4_mean
  
}
# ===================================================================

q2_table = tibble(
  site = "Q2",
  year = seq(ymd("1988-01-01"), ymd("1995-01-01"), by = "9 weeks"),
  k_con = NA,
  nitrate_con = NA, 
  mg_con = NA,
  ca_con = NA,
  amm_con = NA
)

new <- bind_rows(bq2)
  # , bq2, bq3, prm)
# view(new)

q2_filtered <- new |> 
  select("Sample_ID", "Sample_Date", "K", "Mg", "Ca", "NH4-N", "PO4-P") |> 
# 1988 to 1995
  filter(Sample_Date >= ymd("1988-01-01") & Sample_Date < ymd("1995-01-01"))

w2 = q2_filtered$Sample_Date[1]
for (x in 1:length(q2_table$year)) {
  w1 <- w2
  print(w1)
  w2 <- w1 + weeks(9)
  print(w2)
  
  k_values <- q2_filtered$K[q2_filtered$Sample_Date >= w1 & q2_filtered$Sample_Date < w2]
  mg_values <- q2_filtered$Mg[q2_filtered$Sample_Date >= w1 & q2_filtered$Sample_Date < w2]
  ca_values <- q2_filtered$Ca[q2_filtered$Sample_Date >= w1 & q2_filtered$Sample_Date < w2]
  nh4_values <- q2_filtered$`NH4-N`[q2_filtered$Sample_Date >= w1 & q2_filtered$Sample_Date < w2]
  po4_values <- q2_filtered$`PO4-P`[q2_filtered$Sample_Date >= w1 & q2_filtered$Sample_Date < w2]

  # print(k_values)
  k_mean <- mean(k_values, na.rm = TRUE)
  mg_mean <- mean(mg_values, na.rm = TRUE)
  ca_mean <- mean(ca_values, na.rm = TRUE)
  nh4_mean <- mean(nh4_values, na.rm = TRUE)
  po4_mean <- mean(po4_values, na.rm = TRUE)

  q2_table$k_con[x] <- k_mean
  q2_table$mg_con[x] <- mg_mean
  q2_table$ca_con[x] <- ca_mean
  q2_table$nitrate_con[x] <- nh4_mean
  q2_table$amm_con[x] <- po4_mean
  
}

# ===================================================================

q3_table = tibble(
  site = "Q3",
  year = seq(ymd("1988-01-01"), ymd("1995-01-01"), by = "9 weeks"),
  k_con = NA,
  nitrate_con = NA, 
  mg_con = NA,
  ca_con = NA,
  amm_con = NA
)

new <- bind_rows(bq3)
  # , bq2, bq3, prm)
# view(new)

q3_filtered <- new |> 
  select("Sample_ID", "Sample_Date", "K", "Mg", "Ca", "NH4-N", "PO4-P") |> 
# 1988 to 1995
  filter(Sample_Date >= ymd("1988-01-01") & Sample_Date < ymd("1995-01-01"))

w2 = q3_filtered$Sample_Date[1]
for (x in 1:length(q3_table$year)) {
  w1 <- w2
  print(w1)
  w2 <- w1 + weeks(9)
  print(w2)
  
  k_values <- q3_filtered$K[q3_filtered$Sample_Date >= w1 & q3_filtered$Sample_Date < w2]
  mg_values <- q3_filtered$Mg[q3_filtered$Sample_Date >= w1 & q3_filtered$Sample_Date < w2]
  ca_values <- q3_filtered$Ca[q3_filtered$Sample_Date >= w1 & q3_filtered$Sample_Date < w2]
  nh4_values <- q3_filtered$`NH4-N`[q3_filtered$Sample_Date >= w1 & q3_filtered$Sample_Date < w2]
  po4_values <- q3_filtered$`PO4-P`[q3_filtered$Sample_Date >= w1 & q3_filtered$Sample_Date < w2]

  # print(k_values)
  k_mean <- mean(k_values, na.rm = TRUE)
  mg_mean <- mean(mg_values, na.rm = TRUE)
  ca_mean <- mean(ca_values, na.rm = TRUE)
  nh4_mean <- mean(nh4_values, na.rm = TRUE)
  po4_mean <- mean(po4_values, na.rm = TRUE)

  q3_table$k_con[x] <- k_mean
  q3_table$mg_con[x] <- mg_mean
  q3_table$ca_con[x] <- ca_mean
  q3_table$nitrate_con[x] <- nh4_mean
  q3_table$amm_con[x] <- po4_mean
  
}

# ===================================================================


prm_table = tibble(
  site = "prm",
  year = seq(ymd("1988-01-01"), ymd("1995-01-01"), by = "9 weeks"),
  k_con = NA,
  nitrate_con = NA, 
  mg_con = NA,
  ca_con = NA,
  amm_con = NA
)

new <- bind_rows(prm)
  # , bq2, bq3, prm)
# view(new)

prm_filtered <- new |> 
  select("Sample_ID", "Sample_Date", "K", "Mg", "Ca", "NH4-N", "PO4-P") |> 
# 1988 to 1995
  filter(Sample_Date >= ymd("1988-01-01") & Sample_Date < ymd("1995-01-01"))

w2 = prm_filtered$Sample_Date[1]
for (x in 1:length(prm_table$year)) {
  w1 <- w2
  print(w1)
  w2 <- w1 + weeks(9)
  print(w2)
  
  k_values <- prm_filtered$K[prm_filtered$Sample_Date >= w1 & prm_filtered$Sample_Date < w2]
  mg_values <- prm_filtered$Mg[prm_filtered$Sample_Date >= w1 & prm_filtered$Sample_Date < w2]
  ca_values <- prm_filtered$Ca[prm_filtered$Sample_Date >= w1 & prm_filtered$Sample_Date < w2]
  nh4_values <- prm_filtered$`NH4-N`[prm_filtered$Sample_Date >= w1 & prm_filtered$Sample_Date < w2]
  po4_values <- prm_filtered$`PO4-P`[prm_filtered$Sample_Date >= w1 & prm_filtered$Sample_Date < w2]

  # print(k_values)
  k_mean <- mean(k_values, na.rm = TRUE)
  mg_mean <- mean(mg_values, na.rm = TRUE)
  ca_mean <- mean(ca_values, na.rm = TRUE)
  nh4_mean <- mean(nh4_values, na.rm = TRUE)
  po4_mean <- mean(po4_values, na.rm = TRUE)

  prm_table$k_con[x] <- k_mean
  prm_table$mg_con[x] <- mg_mean
  prm_table$ca_con[x] <- ca_mean
  prm_table$nitrate_con[x] <- nh4_mean
  prm_table$amm_con[x] <- po4_mean
  
}

ion_site_table <- bind_rows(q1_table, q2_table, q3_table, prm_table)