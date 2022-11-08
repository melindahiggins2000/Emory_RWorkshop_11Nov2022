# updated using sf package
# see http://www.geo.hunter.cuny.edu/~ssun/R-Spatial/index.html

download.file(url = "http://www.geo.hunter.cuny.edu/~ssun/R-Spatial/data/R-spatial-data.zip",
              destfile = "R-spatial-data.zip");
unzip("R-spatial-data.zip", exdir = "data")

library(sf)

nyc_sf <- sf::st_read("data/nyc/nyc_acs_tracts.shp")

# pure geometry
plot(st_geometry(nyc_sf), 
     main='Pure geometry with st_geometry function')

plot(nyc_sf['college'], 
     main='One column with ["college"]')

#library(dplyr)
library(tidyverse)

# add lat long data - manhattan noise
# read_csv has better capabilities for data types like datetime.
read_manhattan_noise <-
  read_csv("data/nyc/manhattan_noise.csv",
           show_col_types = FALSE,
           lazy = FALSE)
  
library(lubridate)
manhattan_noise_df <- read_manhattan_noise
manhattan_noise_df$datetime <-
  lubridate::force_tz(read_manhattan_noise$datetime, 
                      tzone = "America/New_York")

# manhattan_noise_df <- read_manhattan_noise %>%
#   dplyr::mutate(
#     datetime = lubridate::force_tz(datetime, 
#                                    tz = "America/New_York"))

#manhattan_noise_df <- read.csv("data/nyc/manhattan_noise.csv")
str(manhattan_noise_df)
names(manhattan_noise_df)

# convert to sf
manhattan_noise_sf <-
  st_as_sf(manhattan_noise_df,
           coords = c("longitude", "latitude"))
names(manhattan_noise_sf)

ggplot(data = manhattan_noise_sf  %>%
         dplyr::filter(month(datetime) == 4 &
                         year(datetime) > 2019)) +
  geom_sf(aes(color = descriptor)) +
  coord_sf(xlim = c(-74.06,-73.85),
           default_crs = sf::st_crs(4326))

# look at one day
man_day_noise_sf <- manhattan_noise_sf  %>%
  dplyr::filter(day(datetime) == 19 &
                  month(datetime) == 4 & year(datetime) > 2019)

# ggplot(data = man_day_noise_sf) +
#   geom_sf(aes(color = descriptor)) +
#   coord_sf(
#     xlim =  c(-74.06,-73.85),
#     crs = sf::st_crs(2831),
#     default_crs = sf::st_crs(4326)
#   ) +
#   labs(title = "Residential Noise 311 Calls in Manhattan", subtitle = 'April 19, 2019')

# try again take out crs
ggplot(data = man_day_noise_sf) +
  geom_sf(aes(color = descriptor)) +
  coord_sf(
    xlim =  c(-74.06,-73.85),
    #crs = sf::st_crs(2831),
    default_crs = sf::st_crs(4326)
  ) +
  labs(title = "Residential Noise 311 Calls in Manhattan", subtitle = 'April 19, 2019')


library(sf)
# me test ================
fulton_sf <- 
  sf::st_read("FultonCountyZipCodes/FultonCountyZipCodes.shp")

plot(st_geometry(fulton_sf), 
     main='Fulton County Geometry')

library(readxl)
coviddat <- 
  read_excel("FALSE COVID DATA_TRAINING.xlsx")

# check zipcodes
tfz <- table(fulton_sf$ZipCode)
tfc <- table(coviddat$case_zip)
tfz.df <- data.frame(tfz)
tfc.df <- data.frame(tfc)

# number of difference zipcodes
dim(tfz.df)
dim(tfc.df)

# unique zipcodes in fulton_sf
unique(fulton_sf$ZipCode)
length(unique(fulton_sf$ZipCode))

# unique zipcodes in coviddat
unique(coviddat$case_zip)
length(unique(coviddat$case_zip))

# check counties?
# there is no FIELDS county in GA??
table(coviddat$case_county)

# zipcodes by county
table(coviddat$case_zip, coviddat$case_county)

# also using the with() option
with(
  data=coviddat,
  table(case_zip, case_county)
)

# dplyr approach
# the COVID case data for FULTON
# has 81 zipcodes
coviddat %>%
  filter(case_county == "FULTON") %>%
  with(., table(case_zip, case_county)) %>%
  dim()

# note fulton county GA should
# have 84 counties
# the fulton_sf only has 47 zipcodes
# 2 entries for zip 30331
# see https://www.zip-codes.com/county/ga-fulton.asp
# - note some are only PO boxes - no "shape" line

library(dplyr)
fj <- full_join(tfz.df, tfc.df, 
                by = "Var1")

# the fulljoin fj has 132 zipcodes
# the covid dataset has 131 different
# zipcodes in it, but fulton_sf
# only has 47 zipcodes

sum(is.na(fj$Freq.x))
132 - sum(is.na(fj$Freq.x))
sum(is.na(fj$Freq.y))
132 - sum(is.na(fj$Freq.y))

set.seed(123)
fulton_sf$randdat <-
  runif(n=48, 0, 1)

plot(fulton_sf['randdat'], 
     main='One column with ["randdat"]')

# check left join - get 47 zipcodes
lj <- left_join(tfz.df, tfc.df, 
                by = "Var1")

# check inner join - gives 46 zipcodes
# 1 NA from fulton_sf - 1 missing in coviddat
ij <- inner_join(tfz.df, tfc.df, 
                by = "Var1")
