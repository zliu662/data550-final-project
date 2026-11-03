here::i_am(
  "code/03_make_figure1.R"
)

library(tidyverse)
library(scales)

heart <- readRDS(
  here::here("output", "heart_clean.rds")
)

prev_by_site <- heart |>
  group_by(site) |>
  summarise(prevalence = mean(disease == "Yes"))

figure1 <- ggplot(prev_by_site, aes(x = site, y = prevalence)) +
  geom_col() +
  geom_text(aes(label = percent(prevalence, accuracy = 1)), vjust = -0.5) +
  ylim(0, 1) +
  labs(x = "Study site", y = "Prevalence of heart disease")

# prevalence values are also used for the inline text in the report
saveRDS(
  prev_by_site,
  file = here::here("output", "prev_by_site.rds")
)

ggsave(
  here::here("output", "figure1.png"),
  plot = figure1,
  device = "png",
  width = 7,
  height = 5,
  dpi = 300
)
