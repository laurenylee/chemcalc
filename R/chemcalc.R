#' @param compound_formula A string representing the chemical formula (e.g., "H2O").
#' @return A numeric value representing the total molar mass of the compound.
#' @title Molar Mass Calculator
#' @description This function takes a chemical formula (e.g., "H2O") and calculates the molar mass
#' by summing the atomic weights of the elements in the compound.
#' @importFrom dplyr filter
#' @importFrom readr read_csv
#' @importFrom stringr str_match_all
#' @export

calculate_molar_mass <- function(formula) {
  elements_in_formula <- stringr::str_match_all(formula, "([A-Z][a-z]*)([0-9]*)")

  element_symbols <- elements_in_formula[[1]][, 2]
  quantities <- as.numeric(elements_in_formula[[1]][, 3])
  quantities[is.na(quantities)] <- 1

  atomic_masses <- sapply(element_symbols, function(symbol) {
    element_data <- dplyr::filter(elements, Symbol == symbol)
    element_data$AtomicMass
  })

  molar_masses <- atomic_masses * quantities
  sum(molar_masses)
}

#' @title Dilution Calculator (C1V1 = C2V2)
#' @description This function calculates the missing variable from the dilution equation
#' C1 * V1 = C2 * V2, where you provide the known values and the function
#' solves for the unknown.
#' @param C1 Concentration of the stock solution.
#' @param V1 Volume of the stock solution.
#' @param C2 Concentration of the diluted solution (optional).
#' @param V2 Volume of the diluted solution (optional).
#' @return The value of the missing variable (either C2 or V2).
#' @export

dilution_c1v1 <- function(C1, V1, C2 = NULL, V2 = NULL) {

  if (is.null(C2)) {
    if (is.null(V2)) {
      stop("Either C2 or V2 must be provided!")
    }
    C2 <- (C1 * V1) / V2
    return(C2)
  }

  if (is.null(V2)) {
    if (is.null(C2)) {
      stop("Either C2 or V2 must be provided!")
    }
    V2 <- (C1 * V1) / C2
    return(V2)
  }

  tolerance <- 1e-6
  if (abs((C1 * V1) - (C2 * V2)) > tolerance) {
    stop("The provided values do not satisfy the dilution equation!")
  }

  return("The dilution equation is valid.")
}

