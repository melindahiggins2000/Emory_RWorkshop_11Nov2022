# MODULE 07 R Script ============================
library(dplyr)
library(readr)

# READ IN 3 DATASETS TO MERGE ===================
data1 <- read_csv("data1.csv")
data2 <- read_csv("data2.csv")
data3 <- read_csv("data3.csv")

data1
data2
data3

# MERGE BY ROWS (JOINS) - MATCH IDs =====================
# Keep only rows (people) in both datasets - inner join
both <- dplyr::inner_join(x = data1,
                          y = data2,
                          by = "id")
both

# Keep rows (people) in dataset 1 - left join
left <- dplyr::left_join(x = data1,
                         y = data2,
                         by = "id")
left

# Keep rows (people) in dataset 2 - right join - or just reverse left join
right <- dplyr::right_join(x = data1,
                           y = data2,
                           by = "id")
right

# Keep ALL rows (people) in either dataset - full join
full <- dplyr::full_join(x = data1,
                         y = data2,
                         by = "id")
full

# look at full and data3 datasets
# these have different IDs but some
# same variables in common
full
data3

# let's "bind" rows - stack the datasets
# this will merge all columns that have matching names
# any columns that do not match are retained
# and NAs used to fill in spots that do not match
bind_rows(list(full, data3))


