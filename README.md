# CRMwf
 
This repository contains the R package `CRMwf`. 

The R package `CRMwf` contains the implementation of the Cellwise Robust M-regression (CRM) algorithm. Here, CRM is extended with additional input arguments. Namely, using this package it is possible to use other weight functions in CRM regression where also the parameters for the weight function can be adjusted. Besides the implementation of the CRM algorithm (`crm_functional.R`), this package contains the following weight functions: 
- The Hampel weight function (`HampelWeightFunction.R`)
- The Tukey's bisquare weight function (`TukeyWeightFunction.R`)
- The Huber weight function (`HuberWeightFunction.R`)
- The Andrews-Sine weight function (`AndrewsWeightFunction.R`)
- The Generalized Gauss weight function (`GaussWeightFunction.R`)
- The linear quadratic quadratic weight function (`QuadraticWeightFunction.R`)

## Installation
The package can be installed using the `devtools` package by calling `devtools::install_github("j4c0d3h00g/CRMwf")`.

## Acknowledgements
The implementation of the R package `CRMwf` is based on the R package `crmReg` of Filzmoser, P., Höppner, S., Ortner, I., Serneels, S., and Verdonck, T. (https://github.com/SebastiaanHoppner/CRM)
