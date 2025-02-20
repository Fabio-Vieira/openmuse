library(openmuse)
data("example")

testthat::test_that("Testing adjacency matrix",{
                    A <- A_compute(example, struct = "registrant")
                    expect_no_error( #The adjacency matrix should be square
                      nrow(A) == ncol(A)
                    )})
