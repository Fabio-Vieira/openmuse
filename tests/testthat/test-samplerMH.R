library(openmuse)
data("example")

testthat::test_that("Testing the sampler",{
  A <- A_compute(example, struct = "registrant")
  Q <- Q_compute(A, d = 0.5)
  QMH <- Q_compute_MH(A, Q, d = 0.5)
  samp <- samplerMH(A, QMH)
  expect_no_error(
    is.list(samp)
  )
  expect_no_error(
    length(samp$sample) == 100  
  )}
)