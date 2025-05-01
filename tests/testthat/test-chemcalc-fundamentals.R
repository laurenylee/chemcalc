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

