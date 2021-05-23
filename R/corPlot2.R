corPlot2 <- function(x, new = FALSE, col, minCor = 0.5, labels = FALSE, 
                     row.width = 6, column.height = 6, 
                     lab.both.axes = TRUE, fontsize.axis = 12,
                     title = "", fontsize.title = 16, signifBar = 2){
  corr <- x
  if (new) 
    corr <- cor(x, use = "pairwise.complete.obs")
  if (minCor < -1 | minCor > 1) 
    stop("'minCor' has to be in [-1, 1]")
  if (missing(col)) 
    col <- brewer.pal(9, "RdYlGn")

  if(is.character(labels)){
    colnames(corr) <- labels
    rownames(corr) <- labels
  }
  col.fun <- colorRamp2(breaks = seq(minCor, 1, length.out = length(col)), 
                        colors = col)
  lgd <- list(title = "correlation",
              col_fun = col.fun,
              at = signif(seq(min(min(corr, na.rm = TRUE), minCor), 1, 
                              length.out = length(col)), signifBar),
              legend_height = unit(8, "cm"))
  if(!lab.both.axes) colnames(corr) <- 1:ncol(corr)
  ht <- Heatmap(corr, cluster_rows = FALSE, 
                cluster_columns = FALSE, col = col.fun,
                name = "cor", row_names_side = "left",
                heatmap_legend_param = lgd,
                row_names_max_width = unit(row.width, "cm"),
                row_names_gp = gpar(fontsize = fontsize.axis),
                column_names_max_height = unit(column.height, "cm"),
                column_names_gp = gpar(fontsize = fontsize.axis))
  draw(ht, column_title = title, 
       column_title_gp = gpar(fontsize = fontsize.title))
  invisible(ht)
}
