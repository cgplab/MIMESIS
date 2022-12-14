% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/classify_samples.R
\name{classify_samples}
\alias{classify_samples}
\title{Determine type/subtype of a cancer sample}
\usage{
classify_samples(
  x,
  model = NULL,
  method = c("glmnet", "rpc", "lasso", "nnls", "ols"),
  sample_type = c("breast", "generic")
)
}
\arguments{
\item{x}{A matrix of beta-values (sitesXsamples).}

\item{method}{What method to use (default=glmnet).}

\item{sample_type}{Wether a breast cancer sample ("breast", the default) or a generic cancer sample}
}
\value{
A character vector reporting the predicted tumor type (same length of ncol(x))
}
\description{
Determine type/subtype of a cancer sample
}
\examples{
classify_samples(bc_data)
classify_samples(bc_data, method="rpc")
}
