# shapefiles
# see https://r-graph-gallery.com/168-load-a-shape-file-into-r.html

# Download the shapefile. (note that I store it in a folder called DATA. You have to change that if needed.)
download.file(url = "http://thematicmapping.org/downloads/TM_WORLD_BORDERS_SIMPL-0.3.zip", 
              destfile = "DATA/world_shape_file.zip")
# You now have it in your current working directory, have a look!

# Unzip this file. You can do it with R (as below), or clicking on the object you downloaded.
system("unzip DATA/world_shape_file.zip")

#  -- > You now have 4 files. One of these files is a .shp file! (TM_WORLD_BORDERS_SIMPL-0.3.shp)

# Read this shape file with the rgdal library. 
library(rgdal)
my_spdf <- readOGR( 
  dsn= paste0(getwd(),"/DATA/world_shape_file/") , 
  layer="TM_WORLD_BORDERS_SIMPL-0.3",
  verbose=FALSE
)

# Basic plot of this shape file:
par(mar=c(0,0,0,0))
plot(my_spdf, col="#f2f2f2", bg="skyblue", lwd=0.25, border=0 )

# 'fortify' the data to get a dataframe format required by ggplot2
library(broom)
spdf_fortified <- tidy(my_spdf, region = "NAME")

# Plot it
library(ggplot2)
ggplot() +
  geom_polygon(data = spdf_fortified, aes( x = long, y = lat, group = group), fill="#69b3a2", color="white") +
  theme_void() 



