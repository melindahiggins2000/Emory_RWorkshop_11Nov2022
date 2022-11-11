# aggregation example using data.table package
library(data.table)

# look at the builtin mtcars dataset
data(mtcars)
View(mtcars)

# check class
class(mtcars)

# change to data.table class
mtcars.dt <- as.data.table(mtcars)
class(mtcars.dt)

# get the avg mpg, avg disp and avg wt by am
# am = automatic vs manual
mtcars_avg <-
  mtcars.dt[, .(
    avg_mpg = mean(mpg),
    avg_disp = mean(disp),
    avg_wt = mean(wt)
  ),
  by = "am"]

mtcars_avg

# EXERCISE 01 ============================
# use the above code
# create mtcars_median
# get medians of mpg, disp and wt
# and group by number of cylinder, cyl




