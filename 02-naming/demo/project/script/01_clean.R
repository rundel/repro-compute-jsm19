library(here)

raw_data = here("data", "raw", "data.csv")
d = read.csv(raw_data)

print(d)

