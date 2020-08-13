## First load the libraries (they have been installed for you) ----------------
library(ggplot2)
library(tidyr) # Since we used tidyr at one point to drop nas!
library(palmerpenguins) # This package contains the dataset (called penguins) we want to plot


## We next want to look at our data. 
# Think: Is this something we need to do for ourselves to write our code, or something we 
##  need to preserve indefinitely that will always happen when we run this script? 

head(penguins)
#View(penguins)

## Visualizing numeric distributions ------------------------------------------
# Specifically, flipper_length_mm

## Histogram


# What you COULD do to remove NAs from sex before plotting, then plot with the variable penguins_nona_sex
#penguins %>% 
#  tidyr::drop_na(sex) -> penguins_nona_sex

# use the penguins dataset
ggplot(penguins) +
  # puts flipper_length_mm on the x axis
  aes(x = flipper_length_mm) +
  # draw and style a histogram
  geom_histogram(bins = 35, color = "mediumorchid4", fill = "goldenrod", alpha = 0.3) + 
  # Add some labels
  labs(x = "Flipper length (mm)", 
       y = "Count",
       title = "Penguin flippers yay!", 
       subtitle = "some more text!!!!") +
  # Make separate panels ("facets") for each combination of sex and species 
  # sex/species are other columns in the data, but faceting uniquely does NOT REQUIRE USING aes()
  facet_grid(sex~species)


## Density
ggplot(penguins) +
  aes(x = flipper_length_mm, fill = species) +
  geom_density(alpha = 0.5) +
  # set three custom FILLs for the 3 species (in alphabetical order)
  scale_fill_manual(values = c("olivedrab3", "orangered1", "plum1")   )
  


## Boxplot and/or violin plot
ggplot(penguins) + 
  aes(x = species, y = flipper_length_mm) + 
  geom_boxplot(color = "green", aes(fill = species))


## Strip plot
ggplot(penguins) + 
  aes(x = species, y = flipper_length_mm) + 
  #geom_point(color = "black") +
  geom_jitter(aes(color = species), width = 0.1)


ggplot(penguins) + 
  aes(y = species, x = flipper_length_mm) + 
  #geom_point(color = "black") +
  geom_jitter(aes(color = species), width = 0.1)

################# ENDED HERE ON TUESDAY 8/11/20 #########################

penguins %>%
  group_by(island) %>%
  tally()

penguins %>% count(island)

## Visualizing categorical distributions ------------------------------------------


## Barplot 

#### Should we use geom_bar() or geom_col() ? 
#### bar COUNTS for you like a histogram. col straight up plots the height of the data.


ggplot(penguins) + 
  aes(x = island) + 
  geom_bar(aes(fill = island)) +
  # when you work with an aesthetic fill but you want to OVERRIDE the default colors, use this!!!
  scale_fill_manual(values = c("red", "orange", "yellow")   )
  
# Make a barplot showing the distribution of sex in the dataset
# make the FILLS MAPPED TO SEX as: blue, red

# specify the dataset to plot from
ggplot(penguins) + 
  # map variables to plot
  aes(x = sex, fill = sex) +
  # make a barplot
  geom_bar() +
  # when you work with an aesthetic fill but you want to OVERRIDE the default colors, use this!!!
  scale_fill_manual(values = c("blue", "red")  )



## Demonstrate use of geom_col() as distinct from geom_bar()

# Literally count number of penguins per island, and save to new data frame variable
penguins %>% count(island) -> penguin_island_count

# Plot, with col FIRST then point
ggplot(penguin_island_count) +
  aes(x = island, y = n) + 
  geom_col(fill = "purple") + 
  geom_point(color = "hotpink", size = 10) + 
  labs(title = "col then point")

# Plot, with point FIRST then col
ggplot(penguin_island_count) +
  aes(x = island, y = n) + 
  geom_point(color = "hotpink", size = 10) +
  geom_col(fill = "purple", alpha =0.5) +
  labs(title = "point then col")

  # red orange yellow




## Visualizing relationships between numeric variables ------------------------------------------


## Scatterplot

# relationship between bill length and depth

ggplot(penguins) + 
  aes(x = bill_length_mm, y = bill_depth_mm, color = species) + 
  geom_point() +
  labs(x = "Bill length (mm)", y ="Bill depth (mm)") +
  scale_color_manual(values = c("red", "orange", "turquoise")   )


















