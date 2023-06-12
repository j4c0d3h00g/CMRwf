#' Imputation of outlying cells
#'
#' @param outlier index of the casewise outlier.
#' @param data the data as a data frame.
#' @param outlvars variable names in which the outlier is outlying.
#' @param az output of SPADIMO.
#' @param wr caseweights.
#' @param increment the value by which an outlying cell is incremented (default is 0)
#' @param threshold weight threshold where assigned weights lower than this threshold are classified as casewise outliers.
#'
#' @returns the row of the data matrix where some cells are imputed.
#'
#' @importFrom FNN get.knnx
#' @export
impute_outlying_cells <- function (outlier, data, outlvarz, az, wr, increment = 0, threshold) {

  ## outlier .... index
  ## data  ...... must be a data frame
  ## outlvars ... variable names in which the outlier is outlying
  ## az ......... output spadimo loadings
  ## increment .. currently not used, set to zero
  ## wr ......... caseweights
  ## threshold .. weight threshold where assigned weights lower than this threshold are classified as casewise outliers

  # require(FNN)

  outlvars <- outlvarz[[as.character(outlier)]]
  as <- az[[as.character(outlier)]]
  modifiedrow <- data[outlier, ]
  if (length(outlvars) < length(as)) {
    nn_index <- get.knnx(data = as.matrix(data[wr >= threshold, -outlvars]),
                         query = matrix(modifiedrow[-outlvars], nrow = 1),
                         k = 2)$nn.index
  } else {
    nn_index <- get.knnx(data = as.matrix(data[wr >= threshold, ]),
                         query = matrix(modifiedrow, nrow = 1),
                         k = 2)$nn.index
  }
  dataclean <- data[wr >= threshold, ][nn_index, ]
  imputeddataclean <- colMeans(as.matrix(dataclean[, sort(outlvars)]))

  modifiedrow[outlvars + increment] <- imputeddataclean
  return(modifiedrow)
}
