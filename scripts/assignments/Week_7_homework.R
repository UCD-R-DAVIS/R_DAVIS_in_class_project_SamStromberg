library(tidyverse)

gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")

gapminder %>% pivot_wider(id_cols = country, names_from = year, values_from = pop) %>% select(country, "2002", "2007") #creates 142x2 tibble with country, 2002 pop, and 2004 pop

ggplot(data = gapminder %>% pivot_wider(id_cols = country, names_from = year, values_from = pop) %>% select(country, "2002", "2007"), 



