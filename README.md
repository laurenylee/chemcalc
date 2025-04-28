
<!-- README.md is generated from README.Rmd. Please edit that file -->

# chemcalc

<!-- badges: start -->
<!-- badges: end -->

The goal of chemcalc is to help students who need to simple calculations

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
