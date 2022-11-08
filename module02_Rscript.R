# MODULE 02 R Script ============================
# R SESSION =====================================
# Take a look at your current R Session
# Scroll to top of your Console
# Version of R
# Platform (operating system)
# current workspace loaded

# anytime you can also type
sessionInfo()

# in addition to R version and OS
# see locale
# attached base packages
# this is what R has "out of the box"
# how many base packages are there?

# others "loaded by namespace" (not attached)

# ALL other functionality has to be
# 1. Installed
# 2. loaded as needed FOR EACH R SESSION

# load tidyverse
library(tidyverse)

# run sessionInfo() again
# now how many packages are "attached"
# under "other attached packages"
sessionInfo()

# PACKAGES ========================================
# WHERE can you get packages:
# 1. CRAN (reasonably vetted and checked)
# Comprehensive R Archive Network
# https://cran.r-project.org/
#
# 2. BioConductor (more rigorous error checking 
# and vetting)
# https://www.bioconductor.org/
# 
# 3. Github/Zipfiles/Internet... (wild west)
# https://github.com/search?l=R&q=packages&type=Repositories
# and anywhere else you can think of
# BUYER BEWARE
#
# Always research your packages - like any other "tool"
# has it be validated, has it been published,
# is it used/accepted in your research field or application
#
# download stats, https://hadley.shinyapps.io/cran-downloads/
# check date last updated
# how many versions
# how long has it existed
#
# check Github repo if exists, check issues

# EXERCISE 01
# 1. Go to https://hadley.shinyapps.io/cran-downloads/
# how many downloads have there been (on average) recently
# for the ggplot2 and palmerpenguins packages?
# remove ggplot2 and make plot again
# compare arsenal and gtsummary packages
#
# 2. Go to https://cran.r-project.org/
# click on packages - how many are on CRAN?
# list by name and find ggplot2 package
# when was it last updated?
# go to github repo, check issues

# DATASETS =======================================
# Let's look at what datasets are available to you
# for packages loaded in your current R Session
data()

# Datasets and other objects in your current R Environment
# look at upper right Environment window, or type ls()
# for a simple list of all objects in your "temporary" memory
ls()

# or also try ls.str() to get more detailed listing like
# what you see in your upper window
ls.str()

# Load the penguins dataset from the 
# palmerpenguins package
library(palmerpenguins)

# load into memory
data(penguins)

# view the dataset - either click on object or
View(penguins)

# SHUTTING DOWN SAVING WORKSPACE ==================
# Take a look at the files in your Project folder
# Now Click on File/Quit Session
# R will ask Do you want to save your
# Workspace Image?
#
# If YES, it will save everything in your
# Environment to .RData which is reloaded by default
# when you reopen your project.
# There are Pros and Cons
# PROS - pick up where you left off
# CONS - takes up more memory longer to start and shutdown

# Shut down RStudio and then reopen it.
sessionInfo()

# What do you see?
# R objects come back but the packages are no longer loaded
# R packages have to be reloaded everytime.
# well without customizing .Rprofile... and other options
#
# good practice to provide specific details

# [OPTIONAL] SAVING and LOADING DATA =========================
# Get data - abalone dataset
# learn more at https://archive.ics.uci.edu/ml/datasets/abalone

# import abalone.csv from local hard drive
# file import dataset using base R
abalone_csv_base <- 
  read.csv("abalone.csv", stringsAsFactors=TRUE)

# file import dataset using readr
library(readr)
abalone_csv_readr <- 
  read_csv("abalone.csv")

# read abalone CSV file from the website
# Load the abalone dataset using read_csv() function
# from readr package
library(readr)
abalone_web <-
  readr::read_csv(file = "https://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data", 
                  col_names = FALSE)

# put in the variables names
# see details at https://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.names
names(abalone_web) <- c(
  "sex",
  "length",
  "diameter",
  "height",
  "wholeWeight",
  "shuckedWeight",
  "visceraWeight",
  "shellWeight",
  "rings"
)

# read in an EXCEL formatted file
# this uses the readxl package
library(readxl)
abalone_xlsx <- read_excel("abalone.xlsx")

# read in an SPSS file
library(haven)
abalone_spss <- read_sav("abalone.sav")

# alternative, use foreign package
library(foreign)
abalone_spss_foreign <-
  read.spss(file = "abalone.sav",
            use.value.labels = TRUE,
            to.data.frame = TRUE)

# read in SAS7BDAT data - less well supported...
library(haven)
abalone_sas <- 
  abalone <- read_sas("abalone.sas7bdat", NULL)

# read in R formatted data "abalone.RData"
load("abalone.RData")

# write one of these out as a CSV file
# let's use readr package
readr::write_csv(abalone_web,
                 file = "abalone_web.csv")

# save one as a .Rdata file
save(abalone_sas, 
     file = "abalone_sas.RData")

# clear your workspace and read this back in
load(file = "abalone_sas.RData")


