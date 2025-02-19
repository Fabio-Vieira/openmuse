# **openmuse** 

<br />

<img align="right" width="185" src='man/figures/openmuse_logo.png'>

This package contains function to generate random samples of music tracks. The algorithm developed is a targeted Metropolis-Hastings random walk with jumps, where the target distribution is uniform. This algorithm is described in Thompson (2006).

The main idea consists in structuring the music recordings as a network. The function that constructs this network is called **A_compute** (for adjacency matrix) and it contains the user-defined **"struct"** parameter, which will use one of the variable (e.g. registrant, genre, market, country, etc.) present in the data set to define and build the network structure.

## Installation

```{R instal}
install.packages("devtools")
devtools::install_github("Fabio-Vieira/openmuse")
```

## Basic workflow

```{R workflow}
library(openmuse)
#Load the data
data("example")
#Generate the network structure
A <- A_compute(example, struct = "registrant")
#Compute the transition probabilities
Q <- Q_compute(A, d = 0.5)
#Adjust the transition probabilities for the MH step
QMH <- Q_compute_MH(A, Q, d = 0.5)
#Generate the random sample
samp <- samplerMH(A, QMH, d = 0.5, size = 100)

#Check the generated sample
hist(example$popularity[samp$sample],
     main = "Sample example",
     xlab = "popularity")
box()
```

## Reference

Thompson, S. (2006). Targeted random walk designs. Survey Methodology, 32(1), 11.

## Acknowledgements


