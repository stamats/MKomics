# MKomics
The repository includes the development version of R package MKomics

[![License: LGPL v3](https://img.shields.io/badge/License-LGPL%20v3-blue.svg)](https://www.gnu.org/licenses/lgpl-3.0)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/MKomics)](http://cran.r-project.org/package=MKomics)
[![cran checks](https://cranchecks.info/badges/summary/MKomics)](https://cran.r-project.org/web/checks/check_results_MKomics.html)

## Description
Similarity plots based on correlation and median absolute deviation (MAD); 
adjusting colors for heatmaps; aggregate technical replicates; calculate 
pairwise fold-changes and log fold-changes; computate one- and two-way ANOVA; 
simplified interface to package 'limma' (Ritchie et al. (2015), <doi:10.1093/nar/gkv007>) 
for moderated t-test and one-way ANOVA; Hamming and the Levenshtein (edit) 
distance of strings as well as optimal alignment scores for global (Needleman-Wunsch) 
and local (Smith-Waterman) alignments with constant gap penalties 
(Merkl and Waack (2009), ISBN:978-3-527-32594-8).

## Installation
The package requires Bioconductor packages limma and ComplexHeatmap, which can be 
installed via

```{r, eval = FALSE}
## Install package BiocManager
install.packages("BiocManager")
## Use BiocManager to install limma
BiocManager::install("limma")
## Use BiocManager to install ComplexHeatmap
BiocManager::install("ComplexHeatmap")
```

For the installation of package MKomics use

```{r, eval = FALSE}
## Installation of CRAN version
install.packages("MKomics")

## Development version from GitHub
# install.packages("remotes")
remotes::install_github("stamats/MKomics")
```

## Getting started

```{r}
library(MKomics)
```
