here::i_am(
  "code/02_make_table1.R"
)

library(tidyverse)
library(gtsummary)

heart <- readRDS(
  here::here("output", "heart_clean.rds")
)

table1 <- heart |>
  select(disease, age, sex, cp, trestbps, chol, fbs, thalach, exang, oldpeak,
         site) |>
  tbl_summary(
    by = disease,
    label = list(
      age ~ "Age (years)",
      sex ~ "Male sex",
      cp ~ "Chest pain type",
      trestbps ~ "Resting blood pressure (mm Hg)",
      chol ~ "Serum cholesterol (mg/dL)",
      fbs ~ "Fasting blood sugar > 120 mg/dL",
      thalach ~ "Maximum heart rate achieved (bpm)",
      exang ~ "Exercise-induced angina",
      oldpeak ~ "ST depression induced by exercise",
      site ~ "Study site"
    ),
    missing_text = "Missing"
  ) |>
  add_overall() |>
  add_p() |>
  modify_spanning_header(c("stat_1", "stat_2") ~ "**Heart disease**") |>
  bold_labels() |>
  modify_caption("**Table 1. Patient characteristics by heart disease status**")

saveRDS(
  table1,
  file = here::here("output", "table1.rds")
)
