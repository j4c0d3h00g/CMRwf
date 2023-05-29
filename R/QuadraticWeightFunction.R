#' Linear quadratic quadratic weight function
#'
#' Applies weights to the observations based on the linear quadratic quadratic weight function
#' @export
QuadraticWeightFunction <- function (x, q1, q2, s) {
  q3 <- (2*q1 + 2*q2 - q2*s) / (s - 1)

  i1 <- which(abs(x) <= q1)
  i2 <- which(abs(x) > q1 & abs(x) <= q1 + q2)
  i3 <- which(abs(x) > q1 + q2 & abs(x) <= q1 + q2 + q3)
  i4 <- which(abs(x) > q1 + q2 + q3)

  xtilde <- abs(x[i3]) - q1 - q2

  quadratic_weights <- x
  quadratic_weights[i1] <- 1
  quadratic_weights[i2] <- 1 - (s / (2*q2)) * (((abs(x[i2]) - q1)^2) / abs(x[i2]))
  quadratic_weights[i3] <- (1 / abs(x[i3])) * (q1 + q2 - ((q2 * s) / 2) + (((s - 1) / q3) * (0.5*(xtilde^2) - q3*xtilde)))
  quadratic_weights[i4] <- 0
  return(as.numeric(quadratic_weights))
}
