library(openmuse)
data("example")

testthat::test_that("Testing transition matrix",{
                    A <- A_compute(example, struct = "registrant")
                    Q <- Q_compute(A, d = 0.5)
                    QMH <- Q_compute_MH(A, Q, d = 0.5)
                    expect_no_error( #The transition matrix should be square
                      nrow(QMH) == ncol(QMH)
                    )}
                    )