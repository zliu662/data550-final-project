here::i_am(
  "code/04_render_report.R"
)

rmarkdown::render(
  here::here("heart_disease_report.Rmd"),
  knit_root_dir = here::here()
)
