# CRMwf
 
This repository contains the R package `CRMwf` 

The R package `CRMwf` contains the implementation of the Cellwise Robust M-regression (CRM) algorithm. Here, CRM is extended with additional input arguments. Namely, using this package it is possible to use other weight functions in CRM regression where also the parameters for the weight function can be adjusted. Besides the implementation of the CRM algorithm, this package contains the following weight functions: 
- The Hampel weight function 
- The Tukey's bisquare weight function
- The Huber weight function
- The Andrews-Sine weight function
- The Generalized Gauss weight function
- The linear quadratic quadratic weight function

## Installation
The package can be installed using the `devtools` package using `devtools::install_github("j4c0d3h00g/CRMwf")`

## Acknowledgements
The implementation of the R package `CRMwf` is based on the R package of Filzmoser, P., Höppner, S., Ortner, I., Serneels, S., and Verdonck, T. (https://github.com/SebastiaanHoppner/CRM)
