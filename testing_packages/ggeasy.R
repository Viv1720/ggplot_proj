library(ggplot2)
library(ggeasy)

# rotate x axis labels
ggplot(mtcars, aes(hp, mpg)) + 
  geom_point() + 
  easy_rotate_x_labels()

# rotate y axis labels
ggplot(mtcars, aes(hp, mpg)) + 
  geom_point() + 
  easy_rotate_y_labels()

# remove 'size' legend
ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
  geom_point() +
  easy_remove_legend(size)

# make the x axis labels larger
ggplot(mtcars, aes(mpg, hp)) +
  geom_point() +
  easy_x_axis_labels_size(22)

# make all the text red
ggplot(mtcars, aes(mpg, hp)) +
  geom_point(aes(fill = gear)) +
  easy_all_text_color("red")

# move legend to left side
ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
  geom_point() +
  easy_legend_at("left")
