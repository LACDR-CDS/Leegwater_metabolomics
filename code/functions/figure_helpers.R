# Functions for Figures and Figure sizes

############ Figure sizes ##############
print("Sourcing cm_to_inch")
cm_to_inch <- function(value_cm) {
  return(value_cm / 2.54)
}

page_width <- cm_to_inch(18) # 18 cm
page_height <- cm_to_inch(18) # 18 cm
figure_label_size <- 8
text_size <- 6

print(stringr::str_glue("If not specified otherwise, the following are used:
        - page_width:        {page_width}
        - page_height:       {page_height}
        - figure_label_size: {figure_label_size}
        - text_size:         {text_size}"))

########### Figure helpers #############

# Change cowplot save_plot to include SVG, PNG, and PDF
print("Sourcing an adapted version of save_plot")
save_plot <- function(filename, plot, ...) {
  cowplot::save_plot(filename, plot, ...)
  cowplot::save_plot(stringr::str_replace(filename, ".png$", ".pdf"), plot, ...)
  cowplot::save_plot(stringr::str_replace(filename, ".png$", ".svg"), plot, ...)
  print(stringr::str_glue("Figure saved to {filename}"))
}

print("Sourcing an adapted version of plot_grid")
# specify the font sizes in functions and add white background
plot_grid <- function(...) {
  cowplot::plot_grid(..., label_size = figure_label_size) +
    ggplot2::theme(plot.background = ggplot2::element_rect(fill = "white", color = "white"))
}

print("Sourcing an adapted version of ggplot")
# use the same font size for all ggplots
update_ggplot_fontsizes <- function(p) {
  p <- p +
    # White background and change all font sizes
    theme(
      plot.background = element_rect(fill = "white", color = NA),
      axis.text = element_text(size = text_size),
      axis.title = element_text(size = text_size),
      legend.text = element_text(size = text_size),
      legend.title = element_text(size = text_size)
    )
}
ggplot <- function(...) {
  p <- ggplot2::ggplot(...) +
    theme_half_open(font_size = text_size) +
    theme(legend.position = "none")
  p <- update_ggplot_fontsizes(p)
}

# The cowplot get_legend has a small bug and this is a workaround.
# Based on [get_plot_component](https://github.com/wilkelab/cowplot/issues/202).
print("Sourcing get_legend")
get_legend <- function(p, position = "bottom", n_row = 1, justification = "center") {
  the_legend <- get_plot_component(
    p +
      guides(
        color = guide_legend(),
        shape = FALSE
      ) +
      guides(color = guide_legend(nrow = n_row)) +
      theme(
        plot.background = element_rect(fill = "white", color = NA),
        legend.text = element_text(size = text_size),
        legend.title = element_text(size = text_size),
        legend.position = position,
        legend.justification = justification,
        legend.box.margin = margin(0, 0, 0, 0),
        legend.margin = margin(0, 0, 0, 0)
      ),
    pattern = str_glue("guide-box-{position}")
  )
  return(the_legend)
}

print("Sourcing an adapted version of annotate")
annotate <- function(...) {
  # see https://ggplot2-book.org/annotations#sec-custom-annotations for more details
  # on going from mm to points
  ggplot2::annotate(..., size = text_size * 25.4 / 72.27)
}

print("Sourcing an adapted version of geom_text")
geom_text <- function(...) {
  ggplot2::geom_text(..., size = text_size * 25.4 / 72.27)
}

print("Sourcing an adapted version of geom_text_repel")
geom_text_repel <- function(...) {
  ggrepel::geom_text_repel(..., size = text_size * 25.4 / 72.27)
}
