# ggplots with gapminder
library(gapminder)
library(ggplot2)
library(gganimate)
theme_set(theme_bw())

p <- ggplot(gapminder,
            aes(
              x = gdpPercap,
              y = lifeExp,
              size = pop,
              colour = country
            )) +
  geom_point(show.legend = FALSE, alpha = 0.7) +
  scale_color_viridis_d() +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  labs(x = "GDP per capita", y = "Life expectancy")
p

p + transition_time(year) +
  labs(title = "Year: {frame_time}")

gganimate::anim_save("animation1.gif")

p + facet_wrap(~continent) +
  transition_time(year) +
  labs(title = "Year: {frame_time}")

p + transition_time(year) +
  labs(title = "Year: {frame_time}") +
  shadow_wake(wake_length = 0.1, alpha = FALSE)


library(NHANES)
data(NHANES)

p <- ggplot(data = NHANES,
            aes(x=BPSysAve, y=BPDiaAve, 
                colour = Gender,
                size = as.numeric(BMI_WHO))) +
  geom_point() +
  labs(x = "BP Systolic Avg", y = "BP Diastolic Avg")
p

p + transition_time(as.numeric(AgeDecade)) +
  labs(title = "Age Decade: {frame_time}")

library(dplyr)
# get random sample of NHANES n=100 of adults
nhanes1 <- NHANES %>%
  filter(Age > 17) %>%
  slice_sample(n=100)

p <- ggplot(data = nhanes1,
            aes(x=BPSysAve, y=BPDiaAve, 
                colour = Gender,
                size = as.numeric(BMI_WHO))) +
  geom_point() +
  labs(x = "BP Systolic Avg", y = "BP Diastolic Avg")
p

