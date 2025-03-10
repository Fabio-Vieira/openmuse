% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/permutation_mean.R
\name{permutation_mean}
\alias{permutation_mean}
\title{permutation_mean: this function performs the permutation test for the mean of two samples}
\usage{
permutation_mean(x1, x2, N = 10000)
}
\arguments{
\item{x1}{a vector with the first sample}

\item{x2}{a vector with the second sample}

\item{N}{number of resamples to approximate the permutation distribution under the null}
}
\value{
a list containing the permutation distribution, the observed difference in means and the p value
}
\description{
permutation_mean: this function performs the permutation test for the mean of two samples
}
\examples{

# This function performs the following test: H_0: mean(x1) = mean(x2)
# against H_1: mean(x1) different from mean(x2)

N <- 10000
x1 <- rnorm(100)
x2 <- rnorm(100)

permutation_mean(x1, x2, N)

}
