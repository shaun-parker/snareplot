#' Finalise Snare Industries standards plot for export
#'
#' Add Snare Industries Botanical background and Snare Industries Data Science watermark ready for image export
#'
#' @keywords finalise_plot
#' @export
#' @examples
#' df <- iris
#' g <- ggplot(data=df, aes(x=Petal.Length, y=Petal.Width))
#' g <- g + geom_point(aes(color=Species))
#' g <- g + theme_snare() + scale_colour_snare()
#' finalise_plot(g)


finalise_plot <- function(plot_variable,
                          bg_image_path = file.path(system.file("data", package = 'snareplot'),
                                                    "5k-botanical-minimal-potted-wallpaper.jpg"),
                          draw_background)
{
  library(ggplot2, quietly=TRUE)
  library(cowplot, quietly=TRUE)
  library(jpeg, quietly=TRUE)

  
    if(draw_background == TRUE){
      ggdraw() +
      draw_image(bg_image_path, scale=1.2, height=1, width=1, clip="off") +
      draw_plot(plot_variable) +
      draw_label("Snare Industries Data Science", x=0, y=0, hjust=-0.025, vjust=-0.8,
                 size=9, fontfamily="Century Gothic", color="#747678")
    } else {
        ggdraw() + 
        draw_plot(plot_variable) +
        draw_label("Snare Industries Data Science", x=0, y=0, hjust=-0.025, vjust=-0.8,
                   size=9, fontfamily="Century Gothic", color="#747678")
      }
}