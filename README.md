
<!-- README.md is generated from README.Rmd. Please edit that file -->

# chemcalc

<!-- badges: start -->

[![R-CMD-check](https://github.com/laurenylee/chemcalc/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/laurenylee/chemcalc/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/laurenylee/chemcalc/graph/badge.svg)](https://app.codecov.io/gh/laurenylee/chemcalc)
<!-- badges: end -->

The purpose of chemcalc is to make it easier and faster for students to
perform basic chemistry calculations without having to manually set up
equations or look up atomic masses. It acts as a helpful study and lab
companion for students learning introductory chemistry concepts.

## Installation

You can install the development version of chemcalc from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
devtools::install_github("laurenylee/chemcalc")
```

## Usage

Given a chemical formula, the calculate_molar_mass() function returns a
numeric value representing the total molar mass of the compound.

``` r
library(chemcalc)
molar_mass_h2o <- calculate_molar_mass("H2O")
print(molar_mass_h2o)
#> [1] 18.015
```

Given three known values of the dilution equation (C1 \* V1 = C2 \* V2),
the dilution_c1v1() function calculates the missing fourth value.

``` r
calculated_C2 <- dilution_c1v1(C1 = 2, V1 = 50, V2 = 100)
print(calculated_C2)
#> [1] 1
```
