% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chemcalc.R
\name{calculate_molar_mass}
\alias{calculate_molar_mass}
\title{Molar Mass Calculator}
\usage{
calculate_molar_mass(formula)
}
\arguments{
\item{formula}{A string representing the chemical formula (e.g., "H2O").}
}
\value{
A numeric value representing the total molar mass of the compound.
}
\description{
This function takes a chemical formula (e.g., "H2O") and calculates the molar mass
by summing the atomic weights of the elements in the compound.
}
\examples{
calculate_molar_mass("H2O")
}
