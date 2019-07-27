shape_dir = here::here("data/raw/shapefile")
dir.create(shape_dir, showWarnings = FALSE, recursive = TRUE)


base_url = "http://web1.sph.emory.edu/users/lwaller/book/ch9/"
shapefiles = c("scot.shp", "scot.dbf", "scot.shx")
for(file in shapefiles) {
  download.file(
    file.path(base_url, file), 
    destfile = file.path(shape_dir, file), 
    quiet = TRUE
  )
}
