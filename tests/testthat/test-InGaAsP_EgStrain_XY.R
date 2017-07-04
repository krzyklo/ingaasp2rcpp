library(myfirstpackage)
context("InGaAsP bandgap without strain")

test_that("Eg InP", {
  expect_equal(PQ_Eg_unstrained(0,0), 1.35) #InP 1.35eV
})

test_that("Eg InAs", {
  expect_equal(PQ_Eg_unstrained(0,1), 0.35) #InAs ~0.35eV
})

test_that("Eg GaP", {
  expect_equal(PQ_Eg_unstrained(1,0), 2.75) #GaP 2.75eV
})

test_that("Eg GaAs", {
  expect_equal(PQ_Eg_unstrained(1,1), 1.42) #GaAs 1.42eV
})
