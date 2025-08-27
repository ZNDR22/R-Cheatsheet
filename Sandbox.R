library(tidyverse)
library(gapminder)


plot(pressure)

ggplot(data = starwars,
       mapping = aes(x = gender))+
  geom_bar()

starwars %>% 
  drop_na(height) %>% 
  ggplot(aes(height))+
  geom_histogram()

starwars %>% 
  drop_na(height) %>% 
  ggplot(aes(height))+
  geom_boxplot(fill = "steelblue")+
  theme_bw()+
  labs(title = "Boxplot of height",
       x = "Height of characters")

starwars %>% 
  drop_na(height) %>% 
  filter(sex %in% )