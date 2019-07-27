library(dplyr)

shape_dir = here::here("data/raw/shapefile")
data = readRDS(here::here("data/scotland.rds"))

lip_cancer = sf::read_sf(shape_dir) %>%
  sf::st_set_crs("+proj=longlat +datum=NAD27 +no_defs") %>%
  dplyr::rename(Name = NAME, District = ID) %>% 
  dplyr::full_join(data) %>%
  dplyr::rename(id = District, District = Name, AFF = `%AFF`)

saveRDS(lip_cancer, here::here("data/lip_cancer.rds"))