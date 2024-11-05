library(tidyverse)

gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv") #ONLY change the "data" part of this path if necessary

gapminder %>% count(year)
unique(gapminder$year)
gapminder %>% filter(country %in% c('China','Belgium')) %>% count(country)
gapminder %>% group_by(country) %>% tally()
gapminder %>% count(continent)
gapminder %>% count(year)

unique(gapminder$country)


gapminder %>% group_by(continent, year) %>% summarize(mean_lifeExp = mean(lifeExp))

#1
ggplot(data = gapminder %>% group_by(continent, year) %>% summarize(mean_lifeExp = mean(lifeExp)), mapping = aes(x = year, y = mean_lifeExp, color = continent)) + geom_point() + geom_smooth()

#2

#The scale_x_log10() seems like it transforms x to make the points spread out more evenly across their distribution... 

#geom_smooth is adding a new geom behind the points with the characteristics as defined in the in the ()

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent), size = .25) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()

#3
ggplot(data = gapminder %>% filter(country %in% c('Brazil', 'China', 'El Salvador', 'Niger', 'United States')), mapping = aes(x = country, y = lifeExp, color = country)) + 
  geom_jitter() +
  geom_boxplot(alpha = .75)
+ ggtitle("Life Expectancy of Five Countries") + xlab("Country") + ylab("Life Expectancy")


#3 didn't work
ggplot(data = gapminder %>% filter(country %in% c('Brazil', 'China', 'El Salvador', 'Niger', 'United States'))) + geom_jitter(mapping = aes(x = country, y = lifeExp, color = year)) + geom_boxplot(mapping = aes(x= country, y = lifeExp, color = scale_color_discrete(country)), alpha = .75)

