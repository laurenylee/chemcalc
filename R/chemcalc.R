#' @param compound_formula A string representing the chemical formula (e.g., "H2O").
#' @return A numeric value representing the total molar mass of the compound.
#' @title Molar Mass Calculator
#' @description This function takes a chemical formula (e.g., "H2O") and calculates the molar mass
#' by summing the atomic weights of the elements in the compound.
#' @importFrom dplyr filter
#' @importFrom readr read_csv
#' @export

calculate_molar_mass <- function(compound_formula) {
  data("elements")
  elements_in_compound <- strsplit(compound_formula, "")[[1]]

  molar_masses <- sapply(elements_in_compound, function(element) {
    element_data <- elements[elements$Symbol == element, ]
    return(element_data$AtomicWeight)
  })
  total_molar_mass <- sum(molar_masses)

  return(total_molar_mass)
}
