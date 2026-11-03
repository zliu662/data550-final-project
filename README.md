# Heart Disease Across Four Study Sites

DATA 550 final project. The report uses the
[UCI Heart Disease dataset](https://doi.org/10.24432/C52P4X) (Janosi et al., 1989):
920 patients evaluated for coronary heart disease at four sites (Cleveland,
Hungary, Switzerland, and Long Beach VA). It

1. describes patient characteristics overall and by heart disease status (Table 1), and
2. compares the prevalence of heart disease across the four sites (Figure 1).

## Generating the final report

From the project root, run

```bash
make
```

This builds `heart_disease_report.html`. Run `make clean` to remove all generated
files and rebuild from scratch.

Requirements: R with the `tidyverse`, `gtsummary`, `scales`, `here`, and
`rmarkdown` packages, and pandoc (included with RStudio).

## Repository contents

`raw_data/`

- `processed.cleveland.data`, `processed.hungarian.data`,
  `processed.switzerland.data`, `processed.va.data`: raw data from the UCI
  repository, one file per site

`code/01_clean_data.R`

- combines the four raw files, recodes implausible 0 values of cholesterol and
  resting blood pressure as missing, and creates a binary heart disease outcome
- saves `output/heart_clean.rds`

`code/02_make_table1.R`

- **creates the required table (Table 1)**: patient characteristics overall and
  by heart disease status, made with `gtsummary`
- saves `output/table1.rds`

`code/03_make_figure1.R`

- **creates the required figure (Figure 1)**: bar chart of heart disease
  prevalence by study site
- saves `output/figure1.png` and `output/prev_by_site.rds` (prevalence values
  used in the report text)

`code/04_render_report.R`

- renders `heart_disease_report.Rmd`

`heart_disease_report.Rmd`

- reads the cleaned data, table, and figure from `output/` and writes the final report

`Makefile`

- rules for building each output and the final report

`output/`

- holds the generated outputs (not tracked by git)
