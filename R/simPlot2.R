simPlot2 <- function(x, col, minVal, labels = FALSE, 
                     row.width = 6, column.height = 6, 
                     lab.both.axes = TRUE, fontsize.axis = 12,
                     title = "", fontsize.title = 16, signifBar = 2){
  stopifnot(nrow(x) == ncol(x))
  if (missing(col)) 
    col <- brewer.pal(9, "RdYlGn")
  
  if(is.character(labels)){
    colnames(x) <- labels
    rownames(x) <- labels
  }
  col.fun <- colorRamp2(breaks = seq(minVal, 1, length.out = length(col)), 
                        colors = col)
  lgd <- list(title = "similarity",
              col_fun = col.fun,
              at = signif(seq(min(min(x, na.rm = TRUE), minVal), 1, 
                              length.out = length(col)), signifBar),
              legend_height = unit(8, "cm"))
  if(!lab.both.axes) colnames(x) <- 1:ncol(x)
  ht <- Heatmap(x, cluster_rows = FALSE, 
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
