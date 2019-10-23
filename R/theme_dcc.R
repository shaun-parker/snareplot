
#' Add DCC theme to ggplot chart
#'
#' This function allows you to add the DCC theme to your ggplotgraphics.
#' @keywords theme_dcc
#' @export
#' @examples
#' df <- iris
#' g <- ggplot(data=df, aes(x=Petal.Length, y=Petal.Width))
#' g <- g + geom_point(aes(color=Species))
#' g + theme_dcc()


theme_dcc <- function(
  base_size = 11,
  base_line_size = base_size / 22,
  base_rect_size = base_size / 22) {
  extrafont::loadfonts(device = "win", quiet = TRUE)
  base_family = "Calibri"

  # Starts with theme_bw and remove most parts
  theme_bw(
    base_size = base_size,
    base_family = base_family,
    base_line_size = base_line_size,
    base_rect_size = base_rect_size
  ) %+replace%
    theme(
      axis.ticks      = element_blank(),
      legend.background = element_blank(),
      legend.key        = element_blank(),
      panel.background  = element_blank(),
      panel.border      = element_blank(),
      panel.grid.minor  = element_blank(),
      strip.background  = element_blank(),
      plot.background   = element_blank(),

      complete = TRUE
    )
}
