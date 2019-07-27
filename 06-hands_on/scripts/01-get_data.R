datafile = "http://web1.sph.emory.edu/users/lwaller/book/ch2/scotland.dat"

dir.create(here::here("data/raw/"), showWarnings = FALSE, recursive = TRUE)
download.file(datafile, destfile = here::here("data/raw/scotland.dat"))
