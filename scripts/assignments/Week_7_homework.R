library(tidyverse)

gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")

gapminder %>%filter(continent != "Oceania") %>%  group_by(country, continent) %>%  pivot_wider(id_cols = c(country, continent), names_from = year, values_from = pop) %>% select(continent, country, "2002", "2007") #creates tibble w continent, country, 2002 pop, and 2007 pop

ggplot(data = gapminder %>% 
         filter(continent != "Oceania") %>% 
         group_by(country, continent) %>%  
         pivot_wider(id_cols = c(country, continent), names_from = year, values_from = pop) %>% 
         select(continent, country, "2002", "2007"),
       mapping = aes(x = reorder(country, `2007` - `2002`), y = `2007`-`2002`, fill = continent)) + 
  geom_col(show.legend = FALSE) + 
  facet_wrap(~continent, scales = "free", axes = "all") + 
  theme_light() + theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  labs(x = "Country", y = "Change in Population Between 2002 and 2007") + 
  scale_fill_viridis_d(option = "D")



