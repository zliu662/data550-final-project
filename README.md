# Heart Disease Across Four Study Sites

This is my DATA 550 final project. It uses the
[UCI Heart Disease dataset](https://doi.org/10.24432/C52P4X), which has 920
patients from four sites: Cleveland, Hungary, Switzerland, and Long Beach VA.

The report has:

- **Table 1**: patient characteristics, overall and by heart disease status
- **Figure 1**: how common heart disease is at each site

## Step 1: Install the packages

This project uses `renv` to keep track of R package versions. The versions are
saved in `renv.lock`.

After you clone the repo, open a terminal in the project folder and run:

```bash
make install
```

This installs the same package versions I used. You only need to run it once.

## Step 2: Build the report

```bash
make
```

This creates `heart_disease_report.html`. To delete the outputs and start over,
run `make clean` and then `make`.

You need R, make, and pandoc. Pandoc comes with RStudio.

## What's in this repo

| File | What it does |
| --- | --- |
| `raw_data/` | Raw data from UCI, one file per site |
| `code/01_clean_data.R` | Combines and cleans the data, saves `output/heart_clean.rds` |
| `code/02_make_table1.R` | **Makes Table 1**, saves `output/table1.rds` |
| `code/03_make_figure1.R` | **Makes Figure 1**, saves `output/figure1.png` |
| `code/04_render_report.R` | Renders the report |
| `heart_disease_report.Rmd` | The report |
| `Makefile` | Rules for `make`, `make install`, and `make clean` |
| `renv.lock`, `renv/`, `.Rprofile` | renv files for the package environment |
| `output/` | Files made by the code (not tracked by git) |
