\name{xergm-package}
\docType{package}
\alias{xergm-package}
\title{Extensions of Exponential Random Graph Models (ERGM)}
\description{Extensions of Exponential Random Graph Models (ERGM).}
\details{
The \pkg{xergm} package implements extensions of exponential random 
graph models, in particular Temporal ERGMs (\pkg{btergm}),  
Generalized ERGMs (\pkg{GERGM}), Temporal Network Autocorrelation 
Models (\pkg{tnam}), and Relational Event Models. This package acts 
as a meta-package for the packages \pkg{btergm}, \pkg{GERGM}, 
\pkg{tnam}, and \pkg{rem}. To display citation information, type 
\code{citation("xergm")}.
}
\author{
Philip Leifeld (\url{http://www.philipleifeld.com})

Skyler J. Cranmer (\url{http://www.skylercranmer.net})

Bruce A. Desmarais (\url{https://sites.psu.edu/desmaraisgroup/})
}
\examples{
# example of a temporal exponential random graph model
library("statnet")
set.seed(5)

networks <- list()
for(i in 1:10){            # create 10 random networks with 10 actors
  mat <- matrix(rbinom(100, 1, .25), nrow = 10, ncol = 10)
  diag(mat) <- 0           # loops are excluded
  nw <- network(mat)       # create network object
  networks[[i]] <- nw      # add network to the list
}

covariates <- list()
for (i in 1:10) {          # create 10 matrices as covariate
  mat <- matrix(rnorm(100), nrow = 10, ncol = 10)
  covariates[[i]] <- mat   # add matrix to the list
}

fit <- btergm(networks ~ edges + istar(2) +
    edgecov(covariates), R = 100)

summary(fit)               # show estimation results
}