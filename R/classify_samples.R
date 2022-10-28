#' Determine type/subtype of a cancer sample
#'
#' @param x A matrix of beta-values (sitesXsamples).
#' @param method What method to use (default=glmnet).
#' @param sample_type Wether a breast cancer sample ("breast", the default) or a generic cancer sample
#' @return A character vector reporting the predicted tumor type (same length of ncol(x))
#' @export
#' @examples
#' classify_samples(bc_data)
#' classify_samples(bc_data, method="rpc")
classify_samples <- function(x, method=c("glmnet", "rpc", "lasso", "nnls", "ols"), sample_type=c("breast", "generic")){
    method <- match.arg(method)
    sample_type <- match.arg(sample_type)

    if (method=="glmnet"){
        if (sample_type=="breast"){
            model <- MIMESIS::glmnet_bc_model
        } else if (sample_type=="generic"){
            model <- MIMESIS::glmnet_multicancer_model
        }
        prediction <- stats::predict(model, newx=t(x), s="lambda.min", type = "class")[,1]
    } else {
        if (sample_type=="breast"){
            model <- MIMESIS::rpc_bc_model
        } else if (sample_type=="generic"){
            model <- MIMESIS::rpc_multicancer_model
        }
        if (method=="rpc"){
            prediction <- EpiDISH::epidish(x, model, method = "RPC")$estF
        } else if (method=="lasso"){
            prediction <- lasso(x, model)
        } else if (method=="nnls"){
            prediction <- nnls(x, model)
        } else if (method=="ols"){
            prediction <- ols(x, model)
        }
        prediction <- get_prediction(prediction)
    }
    return(prediction)
}

#'
get_prediction <- function(x){
    y <- apply(x, 1, which.max)
    idx <- which(sapply(y, length) < 1)
    y[idx] <- NA
    y <- unlist(y)
    colnames(x)[y]
}
#'
ols <- function(test, ref){
    RESULTS = apply(test,2, function(x) lm(x ~ as.matrix(ref))$coefficients[-1])
    RESULTS = apply(RESULTS,2, function(x) ifelse(x < 0, 0, x)) #explicit non-negativity constraint
    RESULTS = apply(RESULTS,2,function(x) x/sum(x)) #explicit STO constraint
    RESULTS = t(RESULTS)
    colnames(RESULTS) <- colnames(ref)
    return(RESULTS)
}

#'
nnls <- function(test, ref){
    RESULTS = do.call(cbind.data.frame,lapply(apply(test, 2,  function(x) nnls::nnls(as.matrix(ref), x)),  function(y) y$x))
    RESULTS = apply(RESULTS,2,function(x) x/sum(x)) #explicit STO constraint
    RESULTS = t(RESULTS)
    colnames(RESULTS) <- colnames(ref)
    return(RESULTS)
}

#'
lasso <- function(test, ref){
    set.seed(100)
    RESULTS = apply(test, 2,  function(z) coef(glmnet::glmnet(x = as.matrix(ref), y = z, alpha = 1, standardize = T, lambda = glmnet::cv.glmnet(as.matrix(ref), z)$lambda.1se))[-1,])
    RESULTS = apply(RESULTS,2, function(x) ifelse(x < 0, 0, x)) #explicit non-negativity constraint
    RESULTS = apply(RESULTS,2,function(x) x/sum(x)) #explicit STO constraint
    RESULTS = t(RESULTS)
    return(RESULTS)
}
