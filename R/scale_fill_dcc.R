#' Add DCC colours to ggplot chart
#'
#' This function allows you to add the DCC colour palette to your ggplotgraphics.
#' See also theme_dcc() and scale_colour_dcc
#' @keywords scale_fill_dcc
#' @export
#' @examples
#' df <- iris
#' g <- ggplot(data=df, aes(x=Petal.Length, y=Petal.Width))
#' g <- g + geom_point(aes(color=Species))
#' g +
#' theme_dcc() +
#' scale_fill_dcc()

scale_fill_dcc <- function () {
  dcc_palette <- c("#1f144a", "#9B1889", "#747678", "#CA005D", "#6E2585", "#9CA299", "#776792", "#B9B1CA", "#3C306A")
  scale_fill_manual(values=dcc_palette)
}
