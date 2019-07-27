library(dplyr)

datafile = here::here("data/raw/scotland.dat")

col_names = read.table(datafile, nrows=1, sep=" ", stringsAsFactors = FALSE) %>% 
  dplyr::select(2:7) %>%
  unlist()

data = read.table(datafile, header=FALSE, skip=1) %>%
  setNames(col_names)

saveRDS(data, here::here("data/scotland.rds"))
