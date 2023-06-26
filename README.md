# xergm

The **xergm** package implements eXtensions for Exponential Random Graph Models (ERGM), in particular temporal ERGMs via bootstrapped pseudolikelihood ([**btergm**](http://github.com/leifeld/btergm) package) and the relational event model ([**rem**](http://github.com/brandenberger/rem) package). It used to include generalized ERGMs for value-edged networks ([**GERGM**](http://github.com/matthewjdenny/GERGM) package) and calculation of marginal effects for ERGMs ([**ergMargins**](http://github.com/sduxbury/ergMargins) package), but these packages were archived on CRAN. It also loads helper functions and datasets in the [**xergm.common**](http://github.com/leifeld/xergm.common) package.

[![R-CMD-check](https://github.com/leifeld/xergm/workflows/R-CMD-check/badge.svg)](https://github.com/leifeld/xergm/actions)
[![cran version](http://www.r-pkg.org/badges/version/xergm)](https://cran.r-project.org/package=xergm)
[![downloads](http://cranlogs.r-pkg.org/badges/xergm)](http://cranlogs.r-pkg.org/badges/xergm)
[![total downloads](http://cranlogs.r-pkg.org/badges/grand-total/xergm)](http://cranlogs.r-pkg.org/badges/grand-total/xergm)
[![Research software impact](http://depsy.org/api/package/cran/xergm/badge.svg)](http://depsy.org/package/r/xergm)

## Archival note
This package used to contain common infrastructure and datasets for several packages. But the constituent packages sometimes failed to be updated, which made it difficult to keep this package on CRAN. Hence, the respective functionality and data were moved into the `btergm` package. The `xergm` package is therefore archived because it is now devoid of content. If you read the 2018 article in the Journal of Statistical Software about `xergm` and are wondering how to estimate TERGMs, please just replace any `library("xergm")` calls by `library("btergm")`. So long.
