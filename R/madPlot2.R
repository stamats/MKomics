madPlot2 <- function(x, new = FALSE, col, maxMAD = 3, labels = FALSE, 
                     row.width = 6, column.height = 6, 
                     lab.both.axes = TRUE, fontsize.axis = 12,
                     title = "", fontsize.title = 16, signifBar = 2){
  MAD <- x
  if(new) MAD <- madMatrix(x)
  
  if (missing(col)) 
    col <- rev(brewer.pal(9, "RdYlGn"))
  
  if(is.character(labels)){
    colnames(MAD) <- labels
    rownames(MAD) <- labels
  }
  col.fun <- colorRamp2(breaks = seq(0, maxMAD, length.out = length(col)), 
                        colors = col)
  lgd <- list(title = "MAD",
              col_fun = col.fun,
              at = signif(seq(0, max(max(MAD, na.rm = TRUE), maxMAD), 
                              length.out = length(col)), signifBar),
              legend_height = unit(8, "cm"))
  if(!lab.both.axes) colnames(MAD) <- 1:ncol(MAD)
  ht <- Heatmap(MAD, cluster_rows = FALSE, 
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
