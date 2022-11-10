# leaflet
library(leaflet)
library(dplyr)

m <- leaflet() %>% 
  setView(lng = -71.0589, lat = 42.3601, zoom = 12)
m %>% addTiles()

# learn more
# https://learn.r-journalism.com/en/mapping/leaflet_maps/leaflet/
# 
# 
# m <-
#   leaflet(dd_state) %>% addProviderTiles(providers$CartoDB.DarkMatter) %>%
#   setView(-71.931180, 42.385453, zoom = 7) %>%
#   addCircles(
#     ~ lon,
#     ~ lat,
#     popup = dunkin$type,
#     weight = 3,
#     radius = 40,
#     color = "#ffa500",
#     stroke = TRUE,
#     fillOpacity = 0.8
#   )
# m

library(leaflet)

m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=174.768, lat=-36.852, popup="The birthplace of R")
m  # Print the map





# 33.8034° N, 84.3963° W
m <- leaflet() %>% 
  setView(lng = -84.3963, lat = 33.8034, zoom = 12)
# add default open street map
m %>% addTiles()

df1 <- coviddat %>%
  filter(coviddat$died_covid == "Under Review") %>%
  select(PID, case_gender,
         latitude_JITT, longitude_JITT)

df1$colorgender <- 
  ifelse(
    df1$case_gender == "Female", "darkorange", 
    "blue"
  )

m2 <- leaflet(df1) %>% 
  setView(lng = -84.3963, lat = 33.8034, zoom = 12) 

m2 %>%
  addTiles() %>%
  addCircles(lng = ~longitude_JITT, 
             lat = ~latitude_JITT,
             color = ~colorgender)


# learn more with basemaps
# at https://rstudio.github.io/leaflet/basemaps.html
m2 %>% addProviderTiles(providers$MtbMap) %>%
  addProviderTiles(
    providers$Stamen.TonerLines,
    options = providerTileOptions(opacity = 0.35)) %>%
  addProviderTiles(providers$Stamen.TonerLabels) %>%
  addCircles(lng = ~longitude_JITT, 
             lat = ~latitude_JITT,
             color = ~colorgender)


m2 %>% addProviderTiles(providers$MtbMap) %>%
  addProviderTiles(
    providers$Stamen.TonerLines,
    options = providerTileOptions(opacity = 0.35)) %>%
  addProviderTiles(providers$Stamen.TonerLabels)

