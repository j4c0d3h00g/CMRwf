#' Generalized-Gauss weight function
#'
#' Applies weights to the observations based on the Generalized-Gauss weight function
#' @export
GaussWeightFunction <- function (x, q, a, b) {
  i1 <- which(abs(x) <= pi*q)
  i2 <- which(abs(x) > pi*q)

  gauss_weights <- x
  gauss_weights[i1] <- 1
  gauss_weights[i2] <- exp(-0.5 * (((abs(x[i2]) - q)^b) / a))
  return(as.numeric(gauss_weights))
}
