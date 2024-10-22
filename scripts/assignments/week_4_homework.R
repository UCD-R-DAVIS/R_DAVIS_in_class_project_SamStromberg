library(tidyverse)
#1
surveys <- read_csv("data/portal_data_joined.csv")


#2
head(surveys %>% filter(weight %in% 30:60))

#3
biggest_critters <- surveys %>% filter(!is.na(weight)) %>% group_by(species_id, sex) %>% summarize(max_weight = max(weight)) %>% arrange(max_weight)

#4
#doodling

biggest_critters %>% arrange(-max_weight)

biggest_critters %>% tally(max_weight)

surveys %>% tally(weight)

surveys %>% count(sex)
surveys %>% filter(is.na(weight)) %>% count(species) %>% arrange(species)




#5
surveys_avg_weight <- surveys %>% filter(!is.na(weight)) %>% group_by(species, sex) %>% mutate(mean_weight = mean(weight)) %>% select(species, sex, weight, mean_weight)

#6
surveys_avg_weight %>% mutate(above_average = weight > mean_weight) %>% count(above_average)


