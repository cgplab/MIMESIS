#' Breast cancer data
#'
#' Beta-values of 59 informative sites from 737 samples from TCGA.
#' @source \url{https://portal.gdc.cancer.gov}
'bc_data'

#' PAM50 subtypes of breast cancer samples
#'
#' PAM50 subtypes of 737 BC samples from TCGA reported in \code{bc_data}.
#' @source \url{https://bioconductor.org/packages/release/bioc/vignettes/TCGAbiolinks/inst/doc/subtypes.html}
'bc_subtypes'

#' GLMNET breast cancer model
#'
#' GLMNET model generated with \code{cv.glmnet} to classify breast cancer samples into three PAM50 samples (Luminal A/B, HER2-e, Basal-like).
'glmnet_bc_model'

#' GLMNET multicancer cancer model
#'
#' GLMNET model generated with \code{cv.glmnet} to classify cancer samples into 14 possible cancer-types:
#' "BLCA"      = 'bladder"
#' "BRCA"      = 'breast"
#' "COAD"      = 'colon"
#' "ESCASC"    = 'esophagus"
#' "HNSC"      = 'oral|neck"
#' "KIRC|KIRP" = 'kidney"
#' "LIHC"      = 'liver"
#' "LUAD|LUSC" = 'lung"
#' "PAAD"      = 'pancreas"
#' "PRAD"      = 'prostate"
#' "THCA"      = 'thyroid"
#' "UCEC"      = 'uterus"
'glmnet_multicancer_model'

#' RPC breast cancer model
#'
#' RPC model generated taking median beta-values of informative sites for each PAM50 subtype (Luminal A/B, HER2-e, Basal-like).
'rpc_bc_model'

#' RPC multicancer cancer model
#'
#' RPC model generated taking median beta-values of informative sites for 14 cancer-types:
#' "BLCA"      = 'bladder"
#' "BRCA"      = 'breast"
#' "COAD"      = 'colon"
#' "ESCASC"    = 'esophagus"
#' "HNSC"      = 'oral|neck"
#' "KIRC|KIRP" = 'kidney"
#' "LIHC"      = 'liver"
#' "LUAD|LUSC" = 'lung"
#' "PAAD"      = 'pancreas"
#' "PRAD"      = 'prostate"
#' "THCA"      = 'thyroid"
#' "UCEC"      = 'uterus"
'rpc_multicancer_model'
