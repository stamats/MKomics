## Modifikation of function corPlot of package MKmisc
simPlot <- function (x, col, minVal = 0.5, labels = FALSE, 
                     lab.both.axes = FALSE, labcols = "black", 
                     title = "", cex.title = 1.2, protocol = FALSE, 
                     cex.axis = 0.8, cex.axis.bar = 1, signifBar = 2, ...){
    n <- ncol(x)
    if(nrow(x) != n) stop("nrow(x) != nrcol(x)!")

    if(missing(col))
      col <- colorRampPalette(brewer.pal(8, "RdYlGn"))(128)

    oldpar <- par(no.readonly = TRUE)
    on.exit(par(oldpar))
    layout(matrix(c(1, 2), 1, 2), widths = c(10, 3))
    if(min(x) >= minVal){
      col.nr <- trunc((round(min(x), 2) - minVal)/(1-minVal)*length(col))
      minValInd <- FALSE
    }else{ 
      col.nr <- 1
      x[x < minVal] <- minVal
      minValInd <- TRUE
    }
    if(lab.both.axes)
        image(1:n, 1:n, x[, n:1], col = col[col.nr:length(col)], 
            axes = FALSE, xlab = "", ylab = "", ...)
     else
        image(1:n, 1:n, x[, n:1], col = col[col.nr:length(col)], 
            axes = FALSE, xlab = "sample index", ylab = "", ...)
    
    if (length(labcols) == 1) {
        axis(2, at = n:1, labels = labels, las = 2, cex.axis = cex.axis,
            col.axis = labcols)
        axis(1, at = 1:n, labels = 1:n, las = 1, cex.axis = cex.axis,
            col.axis = labcols)
    }

    if (length(labcols) == n) {
        cols <- unique(labcols)
        for (i in 1:length(cols)) {
            which <- (1:n)[labcols == cols[i]]
            axis(2, at = (n:1)[which], labels = labels[which],
                las = 2, cex.axis = cex.axis, col.axis = cols[i])
            if(lab.both.axes)
                axis(1, at = which, labels = labels[which], las = 2, 
                    cex.axis = cex.axis, col.axis = cols[i])
            else
                axis(1, at = which, labels = (1:n)[which], las = 2, 
                    cex.axis = cex.axis, col.axis = cols[i])
        }
    }
    title(title, cex.main = cex.title)
    box()

    x.bar <- seq(min(minVal, min(x, na.rm = TRUE)), max(x, na.rm = TRUE), length = length(col))
    x.small <- seq(x.bar[1], x.bar[length(x.bar)], length = 10)
    par(mar = c(5.1, 1, 4.1, 5))
    if(protocol){
      image(1, x.bar, matrix(x.bar, 1, length(x.bar)), axes = FALSE, xlab = "", ylab = "", col = col, ...)
      box()
      axis(4, at = c(x.small[3], x.small[8]), labels = c("<-- dissimilar", "similar -->"), las = 0, cex.axis = cex.axis.bar)
    }else{
      image(1, x.bar, matrix(x.bar, 1, length(x.bar)), axes = FALSE, xlab = "", ylab = "", col = col, ...)
      box()
      x.small <- seq(x.bar[1], x.bar[length(x.bar)], length = 10)
      if(minValInd)
        Labels <- c(signif(rev(x.small[2:10]), signifBar), paste("<=", signif(x.small[1], signifBar), sep = ""))
      else
        Labels <- signif(rev(x.small), signifBar)
      axis(4, at = rev(x.small), labels = Labels, las = 1, cex.axis = cex.axis.bar)
    }

    layout(1)
    invisible()
}
