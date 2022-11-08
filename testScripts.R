ggplot(Orange) +
  aes(x = age, y = circumference, colour = Tree) +
  geom_point() +
  geom_line() +
  guides(colour = FALSE) +
  theme_bw()