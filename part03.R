# ====================================
# PART 03 - Make some simple maps
# ====================================

# The usmaps package is really helpful
# for the 50 US States
#   = 48 contiguous States + Alaska + Hawaii
# but this does not include DC or 
# Puerto Rico or any US territories

# load usmap and ggplot2 packages
library(usmap)
library(ggplot2)

# statepop is a builtin dataset
# in the usmap package
# look at top rows of statepop
# and variable names
head(statepop)
names(statepop)

# make a plot of the usmap for states
plot_usmap(regions = "state")

# make a plot of the usmap for counties
plot_usmap(regions = "county")

# make a plot of statepop
# for the states' population values in 2015
plot_usmap(data = statepop,
           values = "pop_2015")

# set state border color to red
plot_usmap(data = statepop,
           values = "pop_2015",
           color = "red")

# add a better title for the legend
# change comma format for large numbers
# mode the legend to the right side
plot_usmap(data = statepop,
           values = "pop_2015",
           color = "red") + 
  scale_fill_continuous(name = "Population (2015)", 
                        label = scales::comma) + 
  theme(legend.position = "right")

# add a title, subtitle and caption
plot_usmap(data = statepop,
           values = "pop_2015",
           color = "red") + 
  scale_fill_continuous(name = "Population (2015)", 
                        label = scales::comma) + 
  theme(legend.position = "right") +
  labs(title = "State Population Levels",
       subtitle = "Based on 2015 Census",
       caption = "Data from usmap package")

# change the coloring
# set border color to yellow
# and change color theme to viridis
plot_usmap(data = statepop,
           values = "pop_2015",
           color = "yellow") + 
  scale_fill_continuous(name = "Population (2015)", 
                        label = scales::comma,
                        type = "viridis") + 
  theme(legend.position = "right") +
  labs(title = "State Population Levels",
       subtitle = "Based on 2015 Census",
       caption = "Data from usmap package")

# look at distribution
hist(statepop$pop_2015)

# make new transformed variable
# log10_pop_2015
# and look at histogram again
statepop$log10_pop_2015 <- log10(statepop$pop_2015)
hist(statepop$log10_pop_2015)

# ====================================
# EXERCISE
# use this transformed variable and redo the map


# ====================================

# to make a map all you need is
# state and value to be plotted
# make a plot of Hospitals_Covid_Cases
# by State for Jan 2022

# Note: for plot_usmap() to work
# the 2 letter state abbreviation has to be called
# state, all lowercase
# use rename to fix this issue

library(dplyr)
hosp1 <- hospital_ops %>%
  select(State, Hospitals_Covid_Cases, Month) %>%
  rename(state = State) %>%
  filter(Month == 1)

plot_usmap(data = hosp1,
           values = "Hospitals_Covid_Cases",
           color = "yellow") + 
  scale_fill_continuous(
    name = "Hospitals Reporting COVID Cases", 
    type = "viridis") + 
  theme(legend.position = "right") +
  labs(title = "Hospitals Reporting COVID Cases",
       subtitle = "Reported in Jan 2022",
       caption = "Data from hospital_ops dataset")

# ====================================
# EXERCISE
# use the code above
# pick another measure and plot it by
# state - choose either Jan or Feb 2022 to plot
# add interesting titles and a caption


# ====================================

