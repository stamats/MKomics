\name{pairwise.mod.t.test}
\alias{pairwise.mod.t.test}
\title{Pairwise Moderated t-Tests}
\description{
  Performs pairwise moderated t-tests (unpaired) based on Bioconductor package 
  limma.
}
\usage{
pairwise.mod.t.test(x, group, adjust.method = "BH", sort.by = "none")
}
\arguments{
  \item{x}{a (non-empty) numeric matrix of data values.}
  \item{group}{an optional factor representing the groups.}
  \item{adjust.method}{see \code{\link{p.adjust}}}
  \item{sort.by}{see \code{\link[limma]{toptable}}}, where \code{"logFC"}
  corresponds to difference in means.
}
\details{
  The function uses Bioconductor package limma to compute pairwise moderated
  t-tests. For more details we refer to \code{\link[limma]{ebayes}}.
}
\value{
  A data.frame with the results.
}
\references{
  Ritchie, M.E., Phipson, B., Wu, D., Hu, Y., Law, C.W., Shi, W., and Smyth, G.K.
  (2015). limma powers differential expression analyses for RNA-sequencing and
  microarray studies. \emph{Nucleic Acids Research} 43(7), e47.
}
\seealso{\code{\link{oneway.test}}, \code{mod.t.test}}
\examples{
set.seed(123)
X <- rbind(matrix(rnorm(5*20), nrow = 5, ncol = 20),
           matrix(rnorm(5*20, mean = 1), nrow = 5, ncol = 20))
gr <- factor(c(rep("A1", 5), rep("B2", 5), rep("C3", 5), rep("D4", 5)))
mod.oneway.test(X, gr)
pairwise.mod.t.test(X, gr)
}
\keyword{htest}
