# Definition of color scales in the manuscript

MOFA_color_palette <- c(
  `blue`        = "#2166AC",
  `green`       = "#5AAE61",
  `yellow`      = "#FFB954",
  `purple`      = "#9970AB",
  `red`         = "#B2182B"
)

color_legend_cell_lines <- list(
  "Epithelial-like" = "#FDE725FF", # scales::viridis_pal()(5)[5],
  "E" = "#FDE725FF",
  "Mesenchymal-like" = "#3B528BFF", # scales::viridis_pal()(5)[1],
  "M" = "#3B528BFF",
  "Round" = "#CB181D",
  "R" = "#CB181D",
  "Suspension" = "#5DC863FF",
  "S" = "#5DC863FF",
  "Unknown" = "grey40", # This is #BEBEBE
  "U" = "grey40", # This is #BEBEBE
  "TNBC" = "#3B528BFF",
  "NonTNBC" = "#FDE725FF",
  "BasalA" = "#8C9FCE",
  "BasalB" = "#3B528BFF",
  "Luminal" = "#FDE725FF",
  "Ba" = "#8C9FCE",
  "Bb" = "#3B528BFF",
  "L" = "#FDE725FF",
  "NA" = "grey"
)

color_legend_Subtype <- c(
  "BasalA" = "#8C9FCE",
  "BasalB" = "#3B528BFF",
  "Luminal" = "#FDE725FF",
  "Ba" = "#8C9FCE",
  "Bb" = "#3B528BFF",
  "L" = "#FDE725FF",
  "HER2pos" = "darkorange",
  "NA" = "grey"
)

seq <- seq(-1, 1, 0.01)
color_heatmap_cor <- circlize::colorRamp2(
  breaks = seq,
  colors = grDevices::colorRampPalette(c("darkblue", "white", "firebrick"))(length(seq))
)

add_numeric_colors <- function(color_values, min_color, max_color) {
  color_range <- circlize::colorRamp2(
    c(min(color_values, na.rm = TRUE), max(color_values, na.rm = TRUE)),
    c(min_color, max_color)
  )
  return(color_range)
}

purple_white_black <- circlize::colorRamp2(c(-1, 0, 1), c("purple", "white", "black"))

color_scale_FDR_factor <- c(
  "FDR > 0.1" = "grey70",
  "FDR < 0.1, not elevated in patients" = "grey40",
  "FDR < 0.1" = "orange",
  "selected" = "blue"
)

color_scale_FDR_subtype <- c(
  "FDR > 0.1" = "grey70",
  "FDR < 0.1, abs(log2FC) > 1, not elevated in patients" = "grey40",
  "FDR < 0.1, abs(log2FC) > 1" = "orange",
  "selected" = "blue"
)

siRNA_colors <- c(
  "siRNA control" = "black",
  "migration inhibitor positive control" = "grey20",
  "proliferation inhibitor positive control" = "red",
  "not significant" = "grey",
  "FDR < 0.1" = "darkblue"
)

human_tissue_colors <- c(
  "cancer-free breast tissue control" = "grey70",
  "patient" = "grey40"
)
