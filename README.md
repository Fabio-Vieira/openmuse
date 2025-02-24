# **openmuse** 

<br />

<img align="right" width="185" src='man/figures/openmuse_logo.png'>

This package contains functions to generate random samples of music recordings. The algorithm developed is a targeted Metropolis-Hastings random walk with jumps, where the target distribution is uniform. This algorithm is described in Thompson (2006).

The main idea consists in structuring the music recordings as a network. The function that constructs this network is called **A_compute** (for adjacency matrix) and it contains the user-defined **"struct"** parameter, which will use one of the variable (e.g. registrant, genre, market, country, etc.) present in the data set to define and build the network structure (see vignette).

## Installation

```{R instal}
install.packages("devtools")
devtools::install_github("Fabio-Vieira/openmuse", build_vignettes = TRUE)
```

## Workflow

In this example a network is constructed based on the registrant code extracted from the **International Standard Recording Code** (ISO 3901, 2019). This code has the following structure

<p align="center">AA-6Q7-20-00047,</p>


where 6Q7 is the registrant code. Every registrant possesses a unique code. The network is constructed by connecting tracks with the same registrant code. Therefore, tracks with different registrants are not connected and that is why the jumps in the algorithm are necessary to properly explore the full network structure and obtain a representative sample. In the functions below, the parameter $d$ represents the probability of jumping. Hence, since $d = 0.5$, about half the random walk steps will be jumps. For more information see Thompson (2006).

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

For more information check the vignette:

```{r vignette}
vignette("sampling", package = "openmuse")
```

## References

Thompson, S. (2006). **Targeted random walk designs**. Survey Methodology, 32(1), 11.

ISO 3901. (2019). **Information and documentation — International Standard Recording Code (ISRC)**. International Organization for Standardization; British Standards Institution

## Acknowledgements

This package was developed in the scope of the Project Open Music Europe (OpenMusE). Funded by the European Union under Horizon Europe Grant No. 101095295.
