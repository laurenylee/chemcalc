## code to prepare `elements` dataset goes here
library(readr)
library(dplyr)

elements <- read_csv("data-raw/PubChemElements.csv")
usethis::use_data(elements, overwrite = TRUE)

