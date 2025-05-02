test_that("Molar mass of water is correct", {
  expect_equal(calculate_molar_mass("H2O"), 18.015, tolerance = 1e-3)
})

test_that("Molar mass of carbon dioxide is correct", {
  expect_equal(calculate_molar_mass("CO2"), 44.009, tolerance = 1e-3)
})

test_that("Calculates C2 correctly, where C2 is the concentration of the diluted solution", {
  expect_equal(dilution_c1v1(C1 = 2, V1 = 100, V2 = 200), 1)
})

test_that("Calculates V2 correctly, where V2 is the volume of the diluted solution", {
  expect_equal(dilution_c1v1(C1 = 3, V1 = 50, C2 = 1.5), 100)
})

test_that("Percent yield is 100 when actual equals theoretical", {
  expect_equal(percent_yield(actual = 10, theoretical = 10), 100)
})

test_that("Percent yield is 0 when actual yield is 0", {
  expect_equal(percent_yield(actual = 0, theoretical = 10), 0)
})

test_that("Function errors if theoretical is NULL", {
  expect_error(percent_yield(actual = 5, theoretical = NULL),
               "Both 'actual' and 'theoretical' yields must be provided.")
})

test_that("Calculates molarity correctly for fraction input", {
  expect_equal(calc_molarity(moles = 0.5, volume_L = 2), 0.25)
})

test_that("Returns error if volume is zero", {
  expect_error(calc_molarity(moles = 1, volume_L = 0),
               "Volume must be greater than zero.")
})


