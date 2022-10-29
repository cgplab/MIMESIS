#' Make a classification model using GLMNET
#'
#' @param x A matrix of beta-values (sitesXsamples)to train the model.
#' @param y A vector reporting the classes (tumor type/subtype) of the samples.
#' @param k An integer. Number of folds for cross-validation (default=5).
#' @param cores An integer. Number of parallel processes (default=1).
#' @param seed A number. Set the seed for the pseudorandom number generator
#' (default to random) for reproducible analyses.
#' @examples
#' glmnet_model <- make_glmnet_model(bc_data, bc_subtypes, cores=20){
#'
make_glmnet_model <- function(x, y, k=5, cores=1, seed=NULL){

    assertthat::assert_that(is.matrix(x))
    assertthat::assert_that(!any(is.na(x)))
    assertthat::assert_that(is.vector(y))
    assertthat::assert_that(ncol(x) == length(y))
    assertthat::assert_that(is.numeric(k))

    if (!is.null(seed)) set.seed(seed)
    k_folds <- caret::createFolds(y, k = round(k), list=FALSE)
    # It is recommended to generate custom lambdas
    # load_all()
    lambdas <- tsutils::lambdaseq(t(bc_data), as.integer(as.factor(bc_subtypes)))$lambda

    # if (cores > 1) do_parallel <- TRUE
    doParallel::registerDoParallel(cores)
    glmnet_model <- glmnet::cv.glmnet(
        x=t(x), y=y, lambda=lambdas,
        foldid = k_folds,
        family="multinomial",
        type.multinomial="grouped",
        parallel=TRUE
    )
    return(glmnet_model)
}
