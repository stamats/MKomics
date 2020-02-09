\name{MKomics-package}
\alias{MKomics-package}
\alias{MKomics}
\docType{package}
\title{
Omics Data Analysis.
}
\description{
Similarity plots based on correlation and median absolute deviation (MAD); 
adjusting colors for heatmaps; aggregate technical replicates; calculate 
pairwise fold-changes and log fold-changes; computate one- and two-way ANOVA; 
simplified interface to package 'limma' (Ritchie et al. (2015), <doi:10.1093/nar/gkv007>) 
for moderated t-test and one-way ANOVA; Hamming and Levenshtein (edit) 
distance of strings as well as optimal alignment scores for global (Needleman-Wunsch) 
and local (Smith-Waterman) alignments with constant gap penalties 
(Merkl and Waack (2009), ISBN:978-3-527-32594-8).
}
\details{
\tabular{ll}{
Package: \tab MKomics\cr
Type: \tab Package\cr
Version: \tab 0.5\cr
Date: \tab 2020-02-09\cr
Depends: \tab R(>= 3.5.0)\cr
Imports: \tab stats, utils, graphics, grDevices, RColorBrewer, robustbase, limma\cr
Suggests: \tab knitr, rmarkdown\cr
License: \tab LGPL-3\cr
URL: \tab http://www.stamats.de/\cr
}
library(MKomics)
}
\author{ Matthias Kohl \url{http://www.stamats.de}

Maintainer: Matthias Kohl  \email{matthias.kohl@stamats.de}}
%\references{
%~~ Literature or other references for background information ~~
%}
%~~ Optionally other keywords from doc/KEYWORDS, one per line
%\seealso{
%~~ Optional links to other man pages, e.g. ~~
%~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
%}
%\examples{
%~~ simple examples of the most important functions ~~
%}
\keyword{package}
