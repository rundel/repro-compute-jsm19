all: lip_cancer.html

lip_cancer.html: lip_cancer.Rmd data/lip_cancer.rds data/dist.rds Figs/Fig01-Neighborhood_connection_plot/fig.png
	Rscript -e "rmarkdown::render('lip_cancer.Rmd')"

Figs/Fig01-Neighborhood_connection_plot/fig.png: data/lip_cancer.rds data/dist.rds
	Rscript Figs/Fig01-Neighborhood_connection_plot/fig.R

data/dist.rds: data/lip_cancer.rds
	Rscript scripts/05-calc_dist.R

data/raw/scotland.dat:
	Rscript scripts/01-get_data.R
	
data/scotland.rds: data/raw/scotland.dat
	Rscript scripts/02-read_data.R

data/raw/shapefile/scot.shp data/raw/shapefile/scot.shx data/raw/shapefile/scot.dbf:
	Rscript scripts/03-get_shapefile.R
	
data/lip_cancer.rds: data/scotland.rds data/raw/shapefile/scot.shp data/raw/shapefile/scot.shx data/raw/shapefile/scot.dbf
	Rscript scripts/04-join_data.R

clean:
	rm -f data/*.rds
	rm -f lip_cancer.html
	
clean-raw: clean
	rm -rf data/
	mkdir -p data/raw
	
.PHONY: clean clean-raw all
