#' @name dr_kliep
#' @title Density-ratio SDM estimation with KLIEP
#' @description dr_kliep is an internal function for density-ratio estimation with KLIEP.
#' @param presence_data dataframe of covariates
#' @param background_data dataframe of covariates
#' @param projection_data dataframe of covariates
#' @param sigma Sigma parameter for KLIEP. Default is the KLIEP default.
#' @param kernel_num kernel_number for KLIEP. Default is the KLIEP default.
#' @param fold Number of folds for KLIEP cross-validation. Default is the KLIEP default.
#' @param method one of either "fit" or "predict"
#' @param object fitted object returned by a dr_... function. Only needed when method = "predict"
#' @importFrom densratio KLIEP
#' @keywords internal
dr_kliep <- function(presence_data = NULL,
                     background_data = NULL,
                     projection_data = NULL,
                     sigma = "auto",
                     kernel_num = 100,
                     fold = 5,
                     verbose = FALSE,
                     method,
                     object = NULL){

  #Code to check inputs
  if(method=="fit" & (is.null(presence_data) | is.null(background_data) )){
    stop("When fitting a kliep, supply both presence and abscence data")

  }

  if(method=="predict" & (is.null(projection_data) )){
    stop("When predicting with kliep, supply projection data")

  }


  #Code for fitting
  if(method == "fit"){

    ratio <- densratio::KLIEP(x1 = presence_data,
                              x2 = background_data,
                              sigma = sigma,
                              kernel_num = kernel_num,
                              fold = fold,
                              verbose = verbose)

    model <- list(ratio = ratio,
                  method = "kliep")

    class(model) <- "dr_estimate"
    return(model)

  }

  #Code for predicting

  if(method == "predict"){

    prediction <- object$ratio$compute_density_ratio(x = projection_data)

    return(prediction)
  }

}