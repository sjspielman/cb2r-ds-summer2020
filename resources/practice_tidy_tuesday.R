# Load the tidyverse suite of libraries ------------------------------------
library(tidyverse)

# Read the tidy tuesday data -------------------------------------------------

# The data explained: https://github.com/rfordatascience/tidytuesday/blob/master/data/2020/2020-08-18/readme.md
plants <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-08-18/plants.csv')
actions <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-08-18/actions.csv')
threats <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-08-18/threats.csv')

# Explore the data -------------------------------------------------------------

View(plants)
View(actions)
#View(threats)




# Visualize the following and wrangle as needed to get there -------------------

# How many plant species are on each continent? --------------------------------
#geom_bar()

ggplot(plants) +
  # map columns onto plot features. some might calls these aesthetics
  aes(x = continent) + 
  geom_bar()

# How many plants of each group are on each continent? -------------------------

ggplot(plants) +
  # map columns onto plot features. some might calls these aesthetics
  aes(x = continent, fill = group) + 
  geom_bar() +
  facet_wrap(~group, scales = "free_y")


plants %>%
  filter(group != "Flowering Plant") %>%
  ggplot() + 
  aes(x = continent,fill = group) + 
  geom_bar() 
















