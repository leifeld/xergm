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
# example 1: temporal exponential random graph model (see ?btergm)
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

# example 2: temporal network autocorrelation model (see ?tnam)
data("knecht")
delinquency <- as.data.frame(delinquency)
rownames(delinquency) <- letters
friendship[[3]][friendship[[3]] == 10] <- NA
friendship[[4]][friendship[[4]] == 10] <- NA
for (i in 1:length(friendship)) {
  rownames(friendship[[i]]) <- letters
}
sex <- demographics$sex
names(sex) <- letters
sex <- list(t1 = sex, t2 = sex, t3 = sex, t4 = sex)
religion <- demographics$religion
names(religion) <- letters
religion <- list(t1 = religion, t2 = religion, t3 = religion, 
    t4 = religion)

model1 <- tnam(
    delinquency ~ 
    covariate(sex, coefname = "sex") + 
    covariate(religion, coefname = "religion") + 
    covariate(delinquency, lag = 1, exponent = 1) + 
    netlag(delinquency, friendship) + 
    netlag(delinquency, friendship, pathdist = 2, decay = 1) + 
    netlag(delinquency, friendship, lag = 1) + 
    degreedummy(friendship, deg = 0, reverse = TRUE) + 
    centrality(friendship, type = "betweenness"), 
    re.node = TRUE, time.linear = TRUE
)
summary(model1)
}