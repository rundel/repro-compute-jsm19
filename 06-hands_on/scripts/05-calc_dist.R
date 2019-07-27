lip_cancer = readRDS(here::here("data/lip_cancer.rds"))

d = sf::st_distance(lip_cancer)

saveRDS(d, here::here("data/dist.rds"))
