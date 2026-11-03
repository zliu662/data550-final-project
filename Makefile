heart_disease_report.html: heart_disease_report.Rmd code/04_render_report.R \
  output/heart_clean.rds output/table1.rds output/figure1.png
	Rscript code/04_render_report.R

output/heart_clean.rds: code/01_clean_data.R raw_data/processed.*.data
	Rscript code/01_clean_data.R

output/table1.rds: code/02_make_table1.R output/heart_clean.rds
	Rscript code/02_make_table1.R

# also creates output/prev_by_site.rds (used for inline text in the report)
output/figure1.png: code/03_make_figure1.R output/heart_clean.rds
	Rscript code/03_make_figure1.R

.PHONY: clean
clean:
	rm -f output/*.rds output/*.png heart_disease_report.html
