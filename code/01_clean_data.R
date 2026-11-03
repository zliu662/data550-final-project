here::i_am(
  "code/01_clean_data.R"
)

library(tidyverse)

# raw files from the UCI Heart Disease repository, one per study site
sites <- c(
  "Cleveland"     = "cleveland",
  "Hungary"       = "hungarian",
  "Switzerland"   = "switzerland",
  "Long Beach VA" = "va"
)

var_names <- c(
  "age", "sex", "cp", "trestbps", "chol", "fbs", "restecg",
  "thalach", "exang", "oldpeak", "slope", "ca", "thal", "num"
)

heart_raw <- map(sites, \(s) {
  read.csv(
    here::here("raw_data", paste0("processed.", s, ".data")),
    header = FALSE,
    na.strings = "?",
    col.names = var_names
  )
}) |>
  list_rbind(names_to = "site")

# Cholesterol and resting blood pressure values of 0 are not plausible and
# indicate missing data (e.g., all Swiss cholesterol values are 0)
heart <- heart_raw |>
  mutate(
    chol = na_if(chol, 0),
    trestbps = na_if(trestbps, 0),
    disease = if_else(num > 0, "Yes", "No")
  )

saveRDS(
  heart,
  file = here::here("output", "heart_clean.rds")
)
