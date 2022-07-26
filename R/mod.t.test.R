mod.t.test <- function(x, group = NULL, paired = FALSE, subject, 
                       adjust.method = "BH", sort.by = "none", na.rm = TRUE){
  if(missing(x)) stop("'x' is missing")
  if(!is.matrix(x)) stop("'x' must be a matrix")
  if(is.null(group)) group <- factor(rep("A", ncol(x)))
  if(!is.factor(group)) group <- factor(group)
  if(ncol(x) != length(group))
    stop("length of group must be equal to ncol(x)")

  nlev <- nlevels(group)
  if(nlev > 2)
    stop("'group' has more than two levels, use 'mod.oneway.test' instead")
  group.tmp <- factor(group, labels = LETTERS[1:nlev])
  if(paired){
    if(missing(subject))
      stop("Please provide subject ID!")
    if(nlev != 2)
      stop("'group' needs to have two levels (repeated measures)")
    if(!is.factor(subject))  subject <- factor(subject)
    design <- model.matrix(~ group.tmp + subject)
#    colnames(design) <- levels(group.tmp)
    fit1 <- lmFit(x, design)
    fit2 <- eBayes(fit1)
    res <- topTable(fit2, coef = "group.tmpB", adjust.method = adjust.method, 
                    number = Inf, confint = TRUE, sort.by = sort.by)[,-4]
    names(res) <- c("mean of differences", "2.5%", "97.5%", "t", "p.value",
                    "adj.p.value", "B")
    meanA <- rowMeans(x[,group.tmp == "A"], na.rm = na.rm)
    meanB <- rowMeans(x[,group.tmp == "B"], na.rm = na.rm)
    res <- data.frame(res, meanA, meanB, check.names = FALSE)
    levs <- levels(group)
    names(res)[8:9] <- paste("mean of", levs)
  }else{
    if(nlev == 1){
      design <- matrix(1, nrow = ncol(x), ncol = 1)
      colnames(design) <- "A"
      fit1 <- lmFit(x, design)
      fit2 <- eBayes(fit1)
      res <- topTable(fit2, coef = 1, adjust.method = adjust.method, number = Inf,
                      confint = TRUE, sort.by = sort.by)[,-4]
      names(res) <- c("mean", "2.5%", "97.5%", "t", "p.value", "adj.p.value", "B")
    } else {
      design <- model.matrix(~ 0 + group.tmp)
      colnames(design) <- levels(group.tmp)
      fit1 <- lmFit(x, design)
      cont.matrix <- makeContrasts(AvsB="B-A", levels=design)
      fit2 <- contrasts.fit(fit1, cont.matrix)
      fit3 <- eBayes(fit2)
      res <- topTable(fit3, coef = 1, adjust.method = adjust.method, number = Inf,
                      confint = TRUE, sort.by = sort.by)[,-4]
      meanA <- rowMeans(x[,group.tmp == "A"], na.rm = na.rm)
      meanB <- rowMeans(x[,group.tmp == "B"], na.rm = na.rm)
      names(res) <- c("difference in means", "2.5%", "97.5%", "t", "p.value",
                      "adj.p.value", "B")
      res <- data.frame(res, meanA, meanB, check.names = FALSE)
      levs <- levels(group)
      names(res)[8:9] <- paste("mean of", levs)
    }
  }
  res
}
