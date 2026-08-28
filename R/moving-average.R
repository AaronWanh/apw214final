# The input to this function should be a data frame containing stream chemistry data
moving_average <- function(ds) {
  # filtering out only the columns we want to use and filtering the concentrations that are within
  # the year
  ds_filtered <- ds |>
    select(Sample_ID, Sample_Date, K, Mg, Ca, `NH4-N`, `NO3-N`) |>
    # 1988 to 1995
    filter(Sample_Date >= ymd("1988-01-01") & Sample_Date < ymd("1995-01-01"))
  # Initialize a tibble to contain the results
  result <- tibble(
    site = ds_filtered$Sample_ID,
    year = ds_filtered$Sample_Date,
    k_mg_l = NA,
    nitrate_ug_l = NA,
    mg_mg_l = NA,
    ca_mg_l = NA,
    amm_ug_l = NA
  )

  # Fill in the iterator and sequence
  for (x in 1:nrow(ds_filtered)) {
    # Create variables for the start and end of the current window
    w1 <- ds_filtered$Sample_Date[x]
    w2 <- w1 + weeks(9)

    # Create a logical vector, called "in_window", that says which samples are inside the window
    # Hint: you'll compare sample dates to the start and end of the window
    in_window <- ds_filtered$Sample_Date >= w1 & ds_filtered$Sample_Date < w2

    # Use indexing to pull out the ion concentrations that fall inside the window
    k_values <- ds_filtered$K[in_window]
    # print("")
    mg_values <- ds_filtered$Mg[in_window]
    ca_values <- ds_filtered$Ca[in_window]
    nh4_values <- ds_filtered$`NH4-N`[in_window]
    no3_values <- ds_filtered$`NO3-N`[in_window]
    # The line above gets potassium in the window. Get the rest of the ions too

    # Calculate the mean of each ion concentration and fill in the result
    k_mean <- mean(k_values, na.rm = TRUE)
    mg_mean <- mean(mg_values, na.rm = TRUE)
    ca_mean <- mean(ca_values, na.rm = TRUE)
    nh4_mean <- mean(nh4_values, na.rm = TRUE)
    no3_mean <- mean(no3_values, na.rm = TRUE)

    result$k_mg_l[x] <- k_mean
    result$mg_mg_l[x] <- mg_mean
    result$ca_mg_l[x] <- ca_mean
    result$amm_ug_l[x] <- nh4_mean
    result$nitrate_ug_l[x] <- no3_mean
  }

  # Return the result
  return(result)
}
