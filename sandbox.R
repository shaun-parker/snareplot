library(ggplot2)
library(snareplot)
library(ggExtra)

#---- Iris scatter

scatter_data <- iris
scatter_plot <- ggplot(data=scatter_data, aes(x=Petal.Length, y=Petal.Width)) +
  geom_point(aes(color=Species)) +
  labs(x="Petal Length",
       y="Petal Width",
       title="Correlation Plot on the Iris Dataset") +
  theme_snare() +
  scale_colour_snare() +
  theme(legend.title = element_blank(),
        panel.grid.major = element_blank(),
        legend.position = c(0.05, 0.95),
        legend.justification = c("left", "top"))

scatter_plot <- finalise_plot(scatter_plot, draw_background = TRUE)

saveRDS(scatter_data, "./samples/scatter.RDS")
ggsave("./samples/scatter.jpg", plot=scatter_plot)

#---- Hexbin density
# Library
library(tidyverse)

# Data
a <- data.frame( x=rnorm(20000, 10, 1.9), y=rnorm(20000, 10, 1.2) )
b <- data.frame( x=rnorm(20000, 14.5, 1.9), y=rnorm(20000, 14.5, 1.9) )
c <- data.frame( x=rnorm(20000, 9.5, 1.9), y=rnorm(20000, 15.5, 1.9) )
density_data <- rbind(a,b,c)
rm(list = c('a', 'b', 'c'))

density_plot <-
  ggplot(density_data, aes(x=x, y=y) ) +
  geom_bin2d(bins = 70, alpha=0.9) +
  scale_fill_gradient(low="darkgrey", high="#3C5F3A") +
  theme_snare() +
  theme(
    panel.grid.major = element_blank(),
    legend.position = "none"
  ) +
  labs(title="Density hexbin")

density_plot <- finalise_plot(density_plot, draw_background = TRUE)

saveRDS(density_data, "./samples/density.RDS")
ggsave("./samples/density.jpg", plot=density_plot)


#---- stacked area chart

time <- as.numeric(rep(seq(1,5),each=5))  # x Axis
value <- runif(25, 10, 100)               # y Axis
group <- rep(LETTERS[1:5],times=5)        # group, one shape per group
area_data <- data.frame(time, value, group)
rm(list = c('time', 'value', 'group'))


area_plot <-
  ggplot(area_data, aes(x=time, y=value, fill=group)) +
  geom_area() +
  theme_snare() +
  scale_fill_snare() +
  labs(title="Area plot")

area_plot <- finalise_plot(area_plot, draw_background = FALSE)

saveRDS(area_data, "./samples/area.RDS")
ggsave("./samples/area.jpg", plot=area_plot)

#---- Bars and errorbars plot
bar_data <- data.frame(
  name=letters[1:5],
  value=sample(seq(4,15),5),
  sd=c(1,0.2,3,2,4)
)

#---- Most basic error bar
bar_plot <-
  ggplot(bar_data) +
  geom_bar( aes(x=name, y=value), stat="identity", fill="#3C5F3A", alpha=0.9) +
  geom_errorbar( aes(x=name, ymin=value-sd, ymax=value+sd), width=0.4, colour="darkgrey", alpha=0.9, size=1.3) +
  theme_snare() +
  labs(title="Bars with errorbars")

bar_plot <- finalise_plot(bar_plot, draw_background = TRUE)

saveRDS(bar_data, "./samples/bar.RDS")
ggsave("./samples/bar.jpg", plot=bar_plot)
