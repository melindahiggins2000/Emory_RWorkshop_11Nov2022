# MODULE 06 R Script ============================
# LOAD abalone dataset ==========================
load("abalone.RData")

# get summary statistics - look at max and min
summary(abalone)

# what do you see?
# should we have any 0's?
# what do you see for height?
# look at top rows sorted by height
library(dplyr)

# HINT: Before running - make Console window wider to see all columns
abalone %>%
  arrange(height) %>%
  head()

# there are 2 abalones that have a height of 0
# let's filter these out
# set filter for height NOT EQUAL TO 0
# use filter(height != 0)
# != is the operator for NOT EQUAL TO
abalone_mod1 <- abalone %>%
  filter(height != 0)

# How many rows are in abalone?
# How many rows are in abalone_mod1?

# Check the maximum values
# there is also a large height
# the max height was 1.13 and the 3rd quartile is 0.1695
# this might be possible, but let's look at the
# rows sorted by height again
# look at bottom rows with tail()
abalone_mod1 %>%
  arrange(height) %>%
  tail()

# there are 2 abalones with large height values
# let's just make a note of these for a moment

# The website, https://archive.ics.uci.edu/ml/datasets/abalone
# tells us that length is the longest of the 2 shell measurements
# Length / continuous / mm / Longest shell measurement
# Diameter / continuous / mm / perpendicular to length
# Height / continuous / mm / with meat in shell
#
# CLEANING YOUR DATA =================================
# Plot diameter by length to spot
# any abalones with diameter > length which is incorrect
# add a y=x reference line
library(ggplot2)
ggplot(abalone_mod1,
       aes(x=diameter, y=length)) +
  geom_point() +
  geom_abline(slope = 1,
              intercept = 0,
              color = "red")

# EXERCISE 01 YOUR TURN ============================
# make a similar plot to spot any
# abalones with height > length


# EXERCISE 02 YOUR TURN =============================
# How can we find out how many abalones have
# either diameter or heights that are incorrectly
# recorded as larger than length?


# EXERCISE 03 YOUR TURN =============================
# Create abalone_mod2 that starts with abalone_mod1
# and filters out any abalones with
# either diameter or height > length


# The website also tells us that there are 4
# weight measurements:
# Whole weight / continuous / grams / whole abalone
# Shucked weight / continuous / grams / weight of meat
# Viscera weight / continuous / grams / gut weight (after bleeding)
# Shell weight / continuous / grams / after being dried
# So shucked, viscera and shell weights should all be
# lower that the whole weight.

# EXERCISE 04 YOUR TURN =============================
# Find out if any of the abalones
# have shucked, viscera or shell weights
# that are incorrectly recorded as > whole weight


# EXERCISE 05 YOUR TURN =============================
# Create abalone_mod3 that filters out any abalones
# where either shucked, viscera or shell weights
# are > whole weight


# CREATE NEW VARIABLES ==============================
# Let's call the new dataset abalone_clean
abalone_clean <- abalone_mod3

# Let's compute the relative percentage
# that shucked weight is of the whole weight
abalone_clean <- abalone_clean %>%
  mutate(shucked_pct = shuckedWeight * 100 / wholeWeight)
  
# EXERCISE 06 YOUR TURN ==============================
# Also compute the relative percentage
# that viscera weight is of the whole weight
# AND compute the relative percentage
# that shell weight is of the whole weight


# CREATE NEW CATEGORICAL variable =========================
# Let's put the M and F into "Adult" category
# separate from I, infants/immature category
abalone_clean <- abalone_clean %>%
  mutate(adult = ifelse(
    test = (sex == "I"), 
    yes = "immature", 
    no = "adult"
  ))

# T-TEST ============================================
t.test(shuckedWeight ~ adult, 
       var.equal = TRUE,
       data = abalone_clean)

tt <- t.test(shuckedWeight ~ adult, 
             var.equal = TRUE,
             data = abalone_clean)
tt
tt$p.value
tt$conf.int

library(broom)
broom::tidy(tt)

# WILCOXON TEST (MANN-WHITNEY) TEST ================
wt <- wilcox.test(shuckedWeight ~ adult,
                  data = abalone_clean)
wt
wt$p.value

# LINEAR MODEL =======================================
lm1 <- lm(rings ~ shuckedWeight,
          data = abalone)
lm1
lm1$coefficients

summary(lm1)
slm1 <- summary(lm1)
slm1$coefficients
slm1$r.squared
slm1$adj.r.squared
slm1$fstatistic

library(broom)
tidy(lm1)
augment(lm1)
glance(lm1)
glance(lm1)$p.value

# PLOT OF FITTED REGRESSION MODEL ===============
library(ggplot2)
ggplot(abalone_clean,
       aes(x=rings,
           y=shuckedWeight)) +
  geom_point() + 
  geom_smooth(method = lm)

# EXERCISE 07 YOUR TURN =========================
# Choose another variable and see how well
# it is associated with the number of rings
# run the linear model
# and make a plot of the fitted line





