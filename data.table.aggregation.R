# data.table - doing aggregations
# see https://statisticsglobe.com/aggregate-data-table-group-r

library(data.table)

data <- data.table(value = 1:6,
                   group = factor(letters[1:2]))
data

data_sum <- data[ , .(group_sum = sum(value)), by = group]
data_sum

names(coviddat)

# see cough symptoms - how codes
# what is missing or unknown
table(coviddat$sym_cough, useNA = "ifany")

#      No   Unk   Yes  <NA> 
#   27474  1054 21943 31630 

# recode with case_when
coviddat <-
  coviddat %>%
  mutate(
    sym_cough.c = case_when(
      sym_cough == "No" ~ "No, unk, na",
      sym_cough == "Unk" ~ "No, unk, na",
      sym_cough == "Yes" ~ "Yes",
      is.na(sym_cough) ~ "No, unk, na",
      TRUE ~ "No, unk, na"
    )
  )

table(coviddat$sym_cough.c, useNA = "ifany")

# do crosstabs
table(coviddat$sym_cough, 
      coviddat$sym_cough.c,
      useNA = "ifany")

# try data.table aggregation
# do simple counts for now
cough_zip <-
  coviddat %>%
  select(PID, case_zip, sym_cough, sym_cough.c)

cough_zip <- as.data.table(cough_zip)
class(cough_zip)

cough_zip$sym_cough.cnum <-
  as.numeric(cough_zip$sym_cough.c == "Yes")

cough_sum <- 
  cough_zip[ , .(cough_sum = sum(sym_cough.c == "Yes")), 
             by = "case_zip"]

cough_sum

# do left join, fulton_sf listed first
# then add these counts

# fulton_sf <- 
#   sf::st_read("FultonCountyZipCodes/FultonCountyZipCodes.shp")
# 
# plot(st_geometry(fulton_sf), 
#      main='Fulton County Geometry')

class(fulton_sf)
fulton_sf_orig <- fulton_sf

# rname case_zip to ZipCode
# and change to character
cough_sum$ZipCode <- as.character(cough_sum$case_zip)

fulton_sf_cough <- left_join(
  fulton_sf, cough_sum, by="ZipCode"
)

plot(fulton_sf_cough['cough_sum'], 
     main='Number of People with Cough Reported')

# see colors and options
# at https://r-spatial.github.io/sf/articles/sf5.html

library(ggplot2)
ggplot() + 
  geom_sf(data = fulton_sf_cough, 
          aes(fill = cough_sum)) + 
  scale_y_continuous(n.breaks=20)

