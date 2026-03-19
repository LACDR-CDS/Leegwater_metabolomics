########### Heatmap helpers #############
print("Sourcing heatmap_in_grid")
heatmap_in_grid <- function(p) {
  p <- grid::grid.grabExpr(ComplexHeatmap::draw(p))
  return(p)
}

print("Sourcing an adapted version of columnAnnotation")
columnAnnotation <- function(..., annotation_legend_param = list()) {
  ComplexHeatmap::columnAnnotation(...,
    annotation_name_gp = grid::gpar(fontsize = text_size, fontface = 2),
    annotation_legend_param = c(annotation_legend_param, list(
      title_gp = grid::gpar(fontsize = text_size, fontface = 2),
      labels_gp = grid::gpar(fontsize = text_size)
    )),
    simple_anno_size = unit(3, "mm")
  )
}

print("Sourcing an adapted version of rowAnnotation")
rowAnnotation <- function(..., annotation_legend_param = list()) {
  ComplexHeatmap::rowAnnotation(...,
    annotation_name_gp = grid::gpar(fontsize = text_size, fontface = 2),
    annotation_legend_param = c(annotation_legend_param, list(
      title_gp = grid::gpar(fontsize = text_size, fontface = 2),
      labels_gp = grid::gpar(fontsize = text_size)
    ))
  )
}
print("Sourcing an adapted version of Heatmap")
Heatmap <- function(..., heatmap_legend_param = list()) {
  ComplexHeatmap::Heatmap(...,
    row_names_gp = grid::gpar(fontsize = text_size),
    column_names_gp = grid::gpar(fontsize = round(text_size * 0.6)),
    heatmap_legend_param = c(
      heatmap_legend_param,
      list(
        title_gp = grid::gpar(fontsize = text_size, fontface = 2),
        labels_gp = grid::gpar(fontsize = text_size)
      )
    )
  )
}
