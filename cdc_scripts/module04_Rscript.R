# MODULE 04 R Script ============================
# EXERCISE 01: See What is in the dataset =======
# load palmerpenguins package
# and look at penguins dataset
library(palmerpenguins)
str(penguins)

# peek at top 6 rows of dataset
head(penguins)

# what kind of object is penguins?
class(penguins)

# look at bottom 10 rows
tail(penguins, 10)

# sometimes this is helpful
# convert penguins to a plain data.frame
penguins.df <- data.frame(penguins)
class(penguins.df)
head(penguins.df)

# Get list of variables (column names) in dataset
names(penguins)

# EXERCISE 02 ========================================
# Get simple summary stats
summary(penguins)

# Simple tables of frequencies
table(penguins$species)
table(penguins$island)
table(penguins$species,
      penguins$island)

# Using `dplyr` - functions are verbs
penguins %>%
  pull(bill_length_mm) %>%
  mean()

penguins %>%
  pull(bill_length_mm) %>%
  mean(na.rm = TRUE)

# The Base R way to do the same thing
mean(penguins$bill_length_mm, na.rm = TRUE)

# Choose more than 1 variable with `select()`
penguins %>%
  select(body_mass_g, flipper_length_mm) %>%
  summary()

# Other packages with good summary stats ================
library(Hmisc)

penguins %>%
  select(body_mass_g, flipper_length_mm) %>%
  Hmisc::describe()

library(psych)

penguins %>%
  select(body_mass_g, flipper_length_mm) %>%
  psych::describe()

# EXERCISE 03 ======================================
# Create custom statistics output
penguins %>%
  select(body_mass_g, flipper_length_mm) %>%
  summarise(
    body_mean = mean(body_mass_g, na.rm=TRUE),
    body_sd = sd(body_mass_g, na.rm=TRUE),
    flip_mean = mean(flipper_length_mm, na.rm=TRUE),
    flip_sd = sd(flipper_length_mm, na.rm=TRUE)
  )

# Get "grouped" output
# Use `group_by()` to further improve your output
penguins %>%
  select(body_mass_g, flipper_length_mm, species) %>%
  group_by(species) %>% #<<
  summarise(
    body_mean = mean(body_mass_g, na.rm=TRUE),
    body_sd = sd(body_mass_g, na.rm=TRUE),
    flip_mean = mean(flipper_length_mm, na.rm=TRUE),
    flip_sd = sd(flipper_length_mm, na.rm=TRUE)
  )

# `dplyr::across()`
penguins %>%
  dplyr::group_by(species) %>%
  dplyr::summarize(across(ends_with("mm"), mean, na.rm = TRUE))

# EXERCISE 04 YOUR TURN ===============================
# get min and max of flipper_length_mm
# by island
# use summarise()



# EXERCISE 05 YOUR TURN ===============================
# get median of variables beginning with "b"
# by island
# use summarise(across(), function, na.rm=TRUE)
# and starts_with()
# hint: help(starts_with, package = "tidyselect")



# Using `dplyr::filter()` to select cases (rows)
# notice the double =='s
penguins %>%
  filter(species == "Chinstrap") %>%
  summary()

# `dplyr::mutate()` to make new variables
penguins.mod <- penguins %>%
  mutate(body_mass_kg = body_mass_g / 1000)

penguins.mod %>%
  select(body_mass_g, body_mass_kg) %>%
  head()

# Making categories or recoding - dplyr::case_when()
# Use case_when() to create
# three size categories
penguins_mod <- penguins %>%
  mutate(size_bin = case_when(
    body_mass_g > 4500 ~ "large",
    body_mass_g > 3000 & 
      body_mass_g <= 4500 ~ "medium",
    body_mass_g <= 3000 ~ "small"
  )
  )

# Create summary table 
# of size categories
penguins_mod %>% 
  pull(size_bin) %>% 
  table(useNA = "ifany")

# Make a 2-way table
# use with() to "attach"
# dataset to then use only variable
# names in table() function
penguins_mod %>%
  with(table(species, island))


# EXERCISE 06 YOUR TURN ===========================
# use any code example above
# find out how many males and females
# there were by year



# EXERCISE 07 YOUR TURN ===========================
# Make your table again
# by filter out the rows to only
# keep penguins from Dream island




