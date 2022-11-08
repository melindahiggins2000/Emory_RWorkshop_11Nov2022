# read in gapminder data downloads
library(readr)
life_expectancy_years <- 
  readr::read_csv("gapminder/life_expectancy_years.csv")

# tidy this up - move years from columns into rows
library(dplyr)
library(tidyr)
lifexp <-
  life_expectancy_years %>%
  pivot_longer(!country, 
               names_to = "year", 
               values_to = "lifexp")

# keep years 2000 to 2020
lifexp20 <- lifexp %>%
  filter((year >= 2000) & (year <= 2020))

govhealth <- 
  readr::read_csv("gapminder/government_health_spending_of_total_gov_spending_percent.csv")

incomeppp <- 
  readr::read_csv("gapminder/income_per_person_gdppercapita_ppp_inflation_adjusted.csv")

suicide <- 
  readr::read_csv("gapminder/suicide_per_100000_people.csv")

govhealth20 <-
  govhealth %>%
  pivot_longer(!country, 
               names_to = "year", 
               values_to = "govhealth") %>%
  filter((year >= 2000) & (year <= 2020))

incomeppp1 <- lapply(incomeppp[, 2:dim(incomeppp)[2]], 
                     as.numeric)
incomeppp2 <- data.frame(incomeppp$country,
                         incomeppp1)
names(incomeppp2) <- names(incomeppp)

incomeppp20 <-
  incomeppp2 %>%
  pivot_longer(!country, 
               names_to = "year", 
               values_to = "incomeppp") %>%
  filter((year >= 2000) & (year <= 2020))

suicide20 <-
  suicide %>%
  pivot_longer(!country, 
               names_to = "year", 
               values_to = "suicide") %>%
  filter((year >= 2000) & (year <= 2020))

# merge
gapmexdata <- 
  dplyr::full_join(lifexp20,
                   govhealth20,
                   by = c("country", "year")) %>%
  dplyr::full_join(.,
                   incomeppp20,
                   by = c("country", "year")) %>%
  dplyr::full_join(.,
                   suicide20,
                   by = c("country", "year"))
