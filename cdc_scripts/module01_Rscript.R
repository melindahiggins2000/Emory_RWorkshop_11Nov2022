# MODULE 01 R Script ============================
# Console Commands Line Examples ================
4 + 4
sqrt(25)
pi
seq(from=1, to=10, by=0.5)

# EXERCISE 01 ===================================
# save sequence of numbers in object x
x <- seq(from=1, to=10, by=0.5)

# view the contents of x
x

# use x to create new object y
y <- x*x

# plot x and y
plot(x,y)

# EXERCISE 02 ===================================
# create cosx
cosx <- cos(x)

# plot x, cosx
plot(x, cosx)

# use functions as needed
# plot x, sin(x)
plot(x, sin(x))

# plot both points and lines
# make the color red
plot(x, sin(x), type = "both", col = "red")

# [YOUR TURN] plot x and the tangent of x
# change color to blue
# hint: help(sin) - to see list of other trig functions


# [YOUR TURN] plot log of x with log y
# change color to green
# hint: help(log) - to see list of log functions

