# MODULE 03 R Script ============================
# EXERCISE 01: MAKE A SCATTERPLOT================
library(palmerpenguins)
library(ggplot2)

# Make a scatterplot
ggplot(penguins) + 
  aes(x=bill_length_mm, 
      y=bill_depth_mm, 
      color = species) + 
  geom_point() +
  xlab("Bill Length (mm)") +
  ylab("Bill Depth (mm)") +
  ggtitle("Penguins Bill Dimensions")

# add a theme
# Add axis labels and a title
ggplot(penguins) + 
  aes(x=bill_length_mm, 
      y=bill_depth_mm,
      color = species) + 
  geom_point() +
  xlab("Bill Length(mm)") + 
  ylab("Bill Depth (mm)") + 
  ggtitle("Penguins Bill Dimensions") +
  theme_dark()

# ggthemes OPTIONAL =========================
library(ggthemes)

ggplot(penguins) + 
  aes(x=bill_length_mm, 
      y=bill_depth_mm,
      color = species) + 
  geom_point() +
  xlab("Bill Length(mm)") + 
  ylab("Bill Depth (mm)") + 
  ggtitle("WSJ Theme") +
  theme_wsj()

# ggthemr OPTIONAL =========================
library(ggthemr)

ggthemr('pale')
ggplot(penguins,
       aes(x=bill_length_mm, 
           y=bill_depth_mm,
           colour = species)) + 
  geom_point() +
  xlab("Bill Length(mm)") + 
  ylab("Bill Depth (mm)") + 
  ggtitle("ggthemr - pale theme") +
  scale_colour_ggthemr_d()
ggthemr_reset()

# R Graphics Cookbook ===========================
# http://www.cookbook-r.com/Graphs/

# Make a histogram with overlaid density curve
# Look at flipper_length_mm
# for Palmer Penguins
# Histogram with density curve
# Use y=..density..
# Overlay with transparent density plot
ggplot(penguins, 
       aes(x=flipper_length_mm)) + 
  geom_histogram(aes(y=..density..),      
                 binwidth=2,
                 colour="black", 
                 fill="white") +
  geom_density(alpha=.2, 
               fill="#FF6666") 

# EXERCISE 02 YOUR TURN ======================
# Fill in ___ Blanks below
# Make a scatterplot of 
# flipper_length_mm on Y-axis
# with body_mass_g on X-axis
# update axis labels and title
ggplot(penguins) + 
  aes(x=___, 
      y=___, 
      color = species) + 
  geom_point() +
  xlab(___) +
  ylab(___) +
  ggtitle(___)

# EXERCISE 03 YOUR TURN ======================
# go to http://www.cookbook-r.com/Graphs/Scatterplots_(ggplot2)/
# redo the scatterplot above
# and use different shapes for the 3 species
# in addition to the colors
# PUT YOUR CODE HERE




# Break out by Facet/Panels ===================
# Look at flipper_length_mm
# for Palmer Penguins
# Histogram with density curve
# Use y=..density..
# Overlay with transparent density plot
ggplot(penguins, 
       aes(x=flipper_length_mm)) + 
  geom_histogram(aes(y=..density..),      
                 binwidth=2,
                 colour="black", 
                 fill="white") +
  geom_density(alpha=.2, 
               fill="#FF6666") +
  facet_wrap(vars(species))

# add best fit line using lm, linear model method
# take out color=species
ggplot(penguins,
       aes(x=bill_length_mm, 
           y=bill_depth_mm)) +
  geom_point() +
  # add best fit line
  # using lm, linear model
  geom_smooth(method=lm) + 
  xlab("Bill Length(mm)") + 
  ylab("Bill Depth (mm)") + 
  ggtitle("Penguins Bill Depth by Length")

# add color back - what changed?
ggplot(penguins,
       aes(x=bill_length_mm, 
           y=bill_depth_mm,
           color = species)) + 
  geom_point() +
  geom_smooth(method=lm) + 
  # add best fit line
  # using lm, linear model
  xlab("Bill Length(mm)") + 
  ylab("Bill Depth (mm)") + 
  ggtitle("Penguins Bill Depth by Length")

# EXERCISE 04 YOUR TURN ======================
# Use code above, add facet_wrap
# for species



# EXERCISE 05 YOUR TURN ======================
# Use code above, 
# change coloring by island instead of species
# add facet_wrap for island


# SIDE-BY-SIDE BOXPLOTS ======================
# Do boxplots of body_mass_g
# by year as a factor
ggplot(penguins, 
       aes(x=as.factor(year), 
           y=body_mass_g)) + 
  geom_boxplot() + 
  xlab("Year") +   
  ylab("Body Mass (g)") + 
  ggtitle("Body Mass by Year")

# Do boxplots of body_mass_g
# by year as a factor
# add jitter'ed points
ggplot(penguins, 
       aes(x=as.factor(year), 
           y=body_mass_g)) + 
  geom_boxplot() + 
  geom_jitter(color="black") +
  xlab("Year") +   
  ylab("Body Mass (g)") + 
  ggtitle("Body Mass by Year")

# EXERCISE 06 YOUR TURN ======================
# Use code above, 
# add color for year



# EXERCISE 07 YOUR TURN ======================
# Use code above, 
# add color for year
# change geom_boxplot 
# to geom_violin
# which do you like better?


# PATCHWORK ==================================
library(ggplot2)
library(patchwork)

# save each plot as an object
p1 <- ggplot(penguins, 
             aes(x=bill_length_mm, 
                 y=bill_depth_mm, 
                 color = species)) +
  geom_point()  

p2 <- ggplot(penguins, 
             aes(x=species, 
                 y=bill_length_mm)) + 
  geom_boxplot() + 
  xlab("Species") +   
  ylab("Bill Depth (mm)")

p3 <- 
  ggplot(penguins, 
         aes(x=flipper_length_mm)) + 
  geom_histogram(aes(y=..density..),      
                 binwidth=2, colour="black", 
                 fill="white") +
  geom_density(alpha=.2, fill="#FF6666") +
  facet_wrap(vars(species))

# arrange plots as you like
(p1 | p2) / p3

# EXERCISE 08 YOUR TURN ======================
# Using patchwork example above
# pick 2 to 3 of the plots we've made so far
# save them as p4, p5, p6
# then try your own arrangement









