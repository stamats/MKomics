\name{mod.t.test}
\alias{mod.t.test}
\title{Moderated t-Test}
\description{
  Performs moderated t-tests based on Bioconductor package limma.
}
\usage{
mod.t.test(x, group = NULL, paired = FALSE, subject, adjust.method = "BH",
           sort.by = "none", na.rm = TRUE)
}
\arguments{
  \item{x}{a (non-empty) numeric matrix of data values.}
  \item{group}{an optional factor representing the groups.}
  \item{paired}{a logical indicating whether you want a paired test.}
  \item{subject}{factor with subject IDs; required if \code{paired = TRUE}.}
  \item{adjust.method}{see \code{\link{p.adjust}}}
  \item{sort.by}{see \code{\link[limma]{toptable}}}, where \code{"logFC"}
  corresponds to difference in means.
  \item{na.rm}{logical. Should missing values (including NaN) be omitted from 
  the calculations of group means?}
}
\details{
  The function uses Bioconductor package limma to compute moderated t-tests.
  For more details we refer to \code{\link[limma]{ebayes}}.
}
\value{
  A data.frame with the results.
}
\references{
  Ritchie, M.E., Phipson, B., Wu, D., Hu, Y., Law, C.W., Shi, W., and Smyth, G.K.
  (2015). limma powers differential expression analyses for RNA-sequencing and
  microarray studies. \emph{Nucleic Acids Research} 43(7), e47.
}
\seealso{\code{\link{t.test}}}
\examples{
## One-sample test
X <- matrix(rnorm(10*20, mean = 1), nrow = 10, ncol = 20)

mod.t.test(X)
## corresponds to
library(limma)
design <- matrix(1, nrow = ncol(X), ncol = 1)
colnames(design) <- "A"
fit1 <- lmFit(X, design)
fit2 <- eBayes(fit1)
topTable(fit2, coef = 1, number = Inf, confint = TRUE, sort.by = "none")[,-4]

## Two-sample test
set.seed(123)
X <- rbind(matrix(rnorm(5*20), nrow = 5, ncol = 20),
           matrix(rnorm(5*20, mean = 1), nrow = 5, ncol = 20))
g2 <- factor(c(rep("group 1", 10), rep("group 2", 10)))

mod.t.test(X, group = g2)
## corresponds to
design <- model.matrix(~ 0 + g2)
colnames(design) <- c("group1", "group2")
fit1 <- lmFit(X, design)
cont.matrix <- makeContrasts(group1vsgroup2="group1-group2", levels=design)
fit2 <- contrasts.fit(fit1, cont.matrix)
fit3 <- eBayes(fit2)
topTable(fit3, coef = 1, number = Inf, confint = TRUE, sort.by = "none")[,-4]

## Paired two-sample test
subjID <- factor(rep(1:10, 2))
mod.t.test(X, group = g2, paired = TRUE, subject = subjID)
}
\keyword{htest}
