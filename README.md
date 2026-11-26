# Heart Disease Across Four Study Sites

This is my DATA 550 final project. It uses the
[UCI Heart Disease dataset](https://doi.org/10.24432/C52P4X) (Janosi et al., 1989),
which has 920 patients who were checked for coronary heart disease at four
sites: Cleveland, Hungary, Switzerland, and Long Beach VA.

The report does two things:

1. **Table 1** describes the patients, overall and by heart disease status.
2. **Figure 1** compares how common heart disease is at the four sites.

## Step 1: Install the packages

This project uses [renv](https://rstudio.github.io/renv/) to keep track of the
R packages and their versions. The list of packages is saved in `renv.lock`.
When you open R in this folder, `.Rprofile` turns on renv automatically, so R
uses the project's own package library instead of your usual one.

After you clone the repo, open a terminal in the project folder and run:

```bash
make install
```

This runs `renv::restore()`, which installs the same package versions I used
(the lockfile was made with R 4.4.1). If you don't have renv yet, it gets
installed automatically first. You only need to run this once, or again if
`renv.lock` changes.

## Step 2: Build the report

After the packages are installed, run:

```bash
make
```

This creates `heart_disease_report.html`. If you want to delete all the
generated files and start over, run `make clean` and then `make` again.

You also need make and pandoc. Pandoc comes with RStudio.

## What's in this repo

`raw_data/`

- the raw data from UCI, one file per site (`processed.cleveland.data`,
  `processed.hungarian.data`, `processed.switzerland.data`, `processed.va.data`)

`code/01_clean_data.R`

- combines the four raw files into one dataset
- treats 0 values of cholesterol and resting blood pressure as missing, since
  they are not realistic
- creates a yes/no heart disease outcome
- saves `output/heart_clean.rds`

`code/02_make_table1.R`

- **makes Table 1** with `gtsummary`
- saves `output/table1.rds`

`code/03_make_figure1.R`

- **makes Figure 1**, a bar chart of heart disease prevalence by site
- saves `output/figure1.png` and `output/prev_by_site.rds` (the prevalence
  numbers used in the report text)

`code/04_render_report.R`

- renders `heart_disease_report.Rmd`

`heart_disease_report.Rmd`

- reads the table and figure from `output/` and writes the final report

`Makefile`

- `make` builds the report, `make install` installs the packages, and
  `make clean` deletes the generated files

`renv.lock`, `renv/`, `.Rprofile`

- the renv files that save and restore the package environment

`output/`

- files created by the code (not tracked by git)
