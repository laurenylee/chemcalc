library(readr)
library(dplyr)


elements <- readr::read_csv("data-raw/PubChemElements.csv")
usethis::use_data(elements, overwrite = TRUE)


