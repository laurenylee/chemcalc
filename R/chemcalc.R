#' @title Molar Mass Calculator
#' @description This function takes a chemical formula (e.g., "H2O") and calculates the molar mass
#' by summing the atomic weights of the elements in the compound.
#' @param formula A string representing the chemical formula (e.g., "H2O").
#' @return A numeric value representing the total molar mass of the compound.
#' @importFrom dplyr filter .data
#' @importFrom readr read_csv
#' @importFrom stringr str_match_all
#' @examples
#' calculate_molar_mass("H2O")
#' @export

calculate_molar_mass <- function(formula) {
  elements_in_formula <- stringr::str_match_all(formula, "([A-Z][a-z]*)([0-9]*)")

  element_symbols <- elements_in_formula[[1]][, 2]
  quantities <- as.numeric(elements_in_formula[[1]][, 3])
  quantities[is.na(quantities)] <- 1

  atomic_masses <- sapply(element_symbols, function(symbol) {
    element_data <- dplyr::filter(chemcalc::elements, .data[["Symbol"]] == symbol)
    element_data$AtomicMass
  })

  molar_masses <- atomic_masses * quantities
  sum(molar_masses)
}


#' @title Dilution Calculator (C1V1 = C2V2)
#' @description This function calculates the missing variable (C1, V1, C2, or V2) from the dilution equation C1 * V1 = C2 * V2.
#' @param C1 Concentration of the stock solution (optional).
#' @param V1 Volume of the stock solution (optional).
#' @param C2 Concentration of the diluted solution (optional).
#' @param V2 Volume of the diluted solution (optional).
#' @return The value of the missing variable.
#' @examples
#' dilution_c1v1(C1 = 2, V1 = 100, V2 = 200)
#' @export
dilution_c1v1 <- function(C1 = NULL, V1 = NULL, C2 = NULL, V2 = NULL) {

  missing_values <- sum(is.null(C1), is.null(V1), is.null(C2), is.null(V2))

  if (missing_values != 1) {
    stop("Exactly one of C1, V1, C2, or V2 must be NULL (unknown).")
  }

  if (is.null(C1)) {
    C1 <- (C2 * V2) / V1
    return(C1)
  }
  if (is.null(V1)) {
    V1 <- (C2 * V2) / C1
    return(V1)
  }
  if (is.null(C2)) {
    C2 <- (C1 * V1) / V2
    return(C2)
  }
  if (is.null(V2)) {
    V2 <- (C1 * V1) / C2
    return(V2)
  }
}

#' @title Percent Yield Calculator
#' @description This function calculates the percent yield of a chemical reaction.
#' @param actual The actual yield obtained from the experiment.
#' @param theoretical The theoretical yield based on stoichiometric calculations.
#' @return The percent yield as a numeric value.
#' @examples
#' percent_yield(actual = 3.5, theoretical = 5)
#' @export
percent_yield <- function(actual, theoretical) {
  if (is.null(actual) || is.null(theoretical)) {
    stop("Both 'actual' and 'theoretical' yields must be provided.")
  }
  if (theoretical == 0) {
    stop("Theoretical yield cannot be zero.")
  }

  yield <- (actual / theoretical) * 100
  return(yield)
}


#' @title Molarity Calculator
#' @description This function calculates the molarity (M) of a solution, given the number of moles of solute and the volume of the solution in liters.
#' @param moles The amount of solute in moles.
#' @param volume_L The volume of the solution in liters.
#' @return The molarity of the solution as a numeric value.
#' @examples
#' calc_molarity(moles = 0.5, volume_L = 1)
#' @export
calc_molarity <- function(moles, volume_L) {
  if (is.null(moles) || is.null(volume_L)) {
    stop("Both 'moles' and 'volume_L' must be provided.")
  }
  if (volume_L <= 0) {
    stop("Volume must be greater than zero.")
  }

  M <- moles / volume_L
  return(M)
}

