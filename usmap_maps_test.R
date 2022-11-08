library(usmap)
library(ggplot2)

plot_usmap(regions = "counties") +
  labs(title = "US Counties",
       subtitle = "This is a blank map of the counties of the United States.") +
  theme(panel.background = element_rect(color = "black", fill = "lightblue"))

usmap::plot_usmap("counties", 
                  include = c(.south_region, "IA"), 
                  exclude = c(.east_south_central, "12"))

# another approach with maps package
# https://jtr13.github.io/cc19/different-ways-of-plotting-u-s-map-in-r.html

library(ggplot2)
library(maps)
library(mapdata)
usa <- map_data('usa')
state <- map_data("state")

washington <- 
  subset(state, region == "washington")
counties <- 
  map_data("county")
washington_county <- 
  subset(counties, region == "washington")

ca_map <-
  ggplot(data = washington,
         mapping = aes(x = long, y = lat, group = group)) +
  coord_fixed(1.3) +
  geom_polygon(color = "black", fill = "gray") +
  geom_polygon(data = washington_county, fill = NA, color = "white") +
  geom_polygon(color = "black", fill = NA) +
  ggtitle('Washington Map with Counties') +
  theme(
    axis.title.x = element_blank(),
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    axis.title.y = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank()
  )
ca_map


georgia <- 
  subset(state, region == "georgia")
counties <- 
  map_data("county")
georgia_county <- 
  subset(counties, region == "georgia")

ga_map <-
  ggplot(data = georgia,
         mapping = aes(x = long, y = lat, group = group)) +
  coord_fixed(1.3) +
  geom_polygon(color = "black", fill = "white") +
  geom_polygon(data = georgia_county, fill = NA, color = "black") +
  geom_polygon(color = "black", fill = NA) +
  ggtitle('Georgia Map with Counties') +
  theme(
    axis.title.x = element_blank(),
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    axis.title.y = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank()
  )
ga_map
