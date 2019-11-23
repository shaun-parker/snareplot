#' Add Snare Industries colours to ggplot chart
#'
#' This function allows you to add the Snare Industries colour palette to your ggplotgraphics.
#' See also theme_snare() and scale_colour_snare
#' @keywords scale_fill_snare
#' @export
#' @examples
#' df <- iris
#' g <- ggplot(data=df, aes(x=Petal.Length, y=Petal.Width))
#' g <- g + geom_point(aes(color=Species))
#' g +
#' theme_snare() +
#' scale_fill_snare()

scale_fill_snare <- function () {
  snare_palette <- c("#7B7D7A", "#96A483", "#808A71", "#3C5F3A", "#E9E5E2")
  scale_fill_manual(values=snare_palette)
}
