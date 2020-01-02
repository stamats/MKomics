# MKomics
The repository includes the development version of R package MKomics

[![License: LGPL v3](https://img.shields.io/badge/License-LGPL%20v3-blue.svg)](https://www.gnu.org/licenses/lgpl-3.0)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

## Description
The package contains several functions for analysis of omics data.

## Installation
The package requires Bioconductor package limma, which can be installed via

```{r, eval = FALSE}
## Install package BiocManager
install.package("BiocManager")
## Use BiocManager to install limma
BiocManager::install("limma")
```

For the installation of package MKomics use

```{r, eval = FALSE}
## Development version from GitHub
# install.packages("remotes")
remotes::install_github("stamats/MKomics")
```

## Getting started

```{r}
library(MKomics)
```
