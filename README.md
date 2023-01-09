
# MIMESIS

<!-- badges: start -->
<!-- badges: end -->

MIMESIS is a computational workflow to quantify and classify tumor signals in tissue and cfDNA samples.

## Citation
(accepted, waiting publication) Romagnoli, D. et al, 2023, 
MIMESIS: minimal DNA-methylation signatures to quantify and classify tumor signals in tissue and cell-free DNA samples.
Briefings in Bioinformatics.

## Installation

You can install the development version of MIMESIS from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("cgplab/MIMESIS")
devtools::install_github("cgplab/PAMES")
```

## Example

``` r
library(MIMESIS)
library(PAMES)

## basic example code
samples_subtype <- classify_samples(bc_data)
samples_purity <- get_purity(bc_data, bc_sites)
```
