library(ggplot2)
library(sf)

lip_cancer = readRDS(here::here("data/lip_cancer.rds"))

d = readRDS(here::here("data/dist.rds"))
class(d) = NULL

W = (d == 0.0) * 1L
diag(W) = 0

m = rowSums(W)
lip_cancer$n_neighbors = m

lc_sp = as(lip_cancer, 'Spatial')
lc_n_sf = lc_sp %>% 
  spdep::poly2nb() %>%
  spdep::nb2lines(coords = sp::coordinates(lc_sp)) %>%
  as("sf") %>%
  st_set_crs(st_crs(lip_cancer)) %>%
  st_geometry()

png(here::here("Figs/Fig01-Neighborhood_connection_plot/fig.png"), width = 400, height = 800)

ggplot(lip_cancer) + 
  geom_sf(aes(fill=n_neighbors), color="white", size=0.5) +
  geom_sf(data = lc_n_sf, color = "orange")

dev.off()

