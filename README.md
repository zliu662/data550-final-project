# Heart Disease Across Four Study Sites

DATA 550 final project. The report uses the
[UCI Heart Disease dataset](https://doi.org/10.24432/C52P4X) (Janosi et al., 1989):
920 patients evaluated for coronary heart disease at four sites (Cleveland,
Hungary, Switzerland, and Long Beach VA). It

1. describes patient characteristics overall and by heart disease status (Table 1), and
2. compares the prevalence of heart disease across the four sites (Figure 1).

## Synchronizing the package environment

This project uses [renv](https://rstudio.github.io/renv/) to record the exact
versions of the R packages used to build the report. The versions are listed in
`renv.lock` (created with R 4.4.1). When R starts in this directory,
`.Rprofile` runs `renv/activate.R`, which switches R to the project's own
package library.

After cloning the repository, run this from the project root:

```bash
make install
```

This runs `renv::restore(prompt = FALSE)`, which installs the package versions
listed in `renv.lock` into a project-specific library (`renv/library/`, not
tracked by git). If renv itself is not installed yet, `renv/activate.R`
installs it first. Run `make install` once before building the report, and
again whenever `renv.lock` changes.

## Generating the final report

After synchronizing the package environment, run this from the project root:

```bash
make
```

This builds `heart_disease_report.html`. Run `make clean` to remove all generated
files and rebuild from scratch.

Requirements: R (the lockfile was created with R 4.4.1), make, and pandoc
(included with RStudio). `make install` installs all required R packages.

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
- `make install` restores the package environment from `renv.lock`

`renv.lock`, `renv/`, `.Rprofile`

- renv lockfile recording package versions, plus the files that activate the
  project library (`renv/activate.R`, `renv/settings.json`)

`output/`

- holds the generated outputs (not tracked by git)
