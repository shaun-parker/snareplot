left_align <- function(plot_variable, pieces){
  grob <- ggplot2::ggplotGrob(plot_variable)
  n <- length(pieces)
  grob$layout$l[grob$layout$name %in% pieces] <- 2
  return(grob)
}

create_footer <- function (caption, logo_image) {
  #Make the footer
  footer <- grid::grobTree(grid::linesGrob(x = grid::unit(c(0, 1), "npc"), y = grid::unit(1.1, "npc"), gp = grid::gpar(col = "#9CA299", lwd=0.5)),
                           grid::textGrob(caption,
                                          x = 0.004, hjust = 0, vjust = -0.6, gp = grid::gpar(fontsize=8)),
                           grid::rasterGrob(png::readPNG(logo_image, native=TRUE, info=TRUE), x = 0.92))
  return(footer)
}


finalise_plot <- function(plot_variable,
                          title,
                          subtitle,
                          caption,
                          width_pixels=640,
                          height_pixels=450,
                          logo_image_path = "./data/DCC_final_Logo_RGB.png") {
  
  footer <- create_footer(caption, logo_image_path)
  
  #Draw your left-aligned grid
  plot_left_aligned <- left_align(plot_variable + 
                                    ggtitle(title,
                                            subtitle), c("subtitle", "title", "caption"))
  plot_grid <- ggpubr::ggarrange(plot_left_aligned, footer,
                                 ncol = 1, nrow = 2,
                                 heights = c(1, 0.045/(height_pixels/450)))
  plot_grid 
}