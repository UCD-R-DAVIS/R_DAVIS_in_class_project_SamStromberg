

#HOMEWORKS----
##HW2----
set.seed(15)
hw2 <- runif(50, 4, 50)
hw2 <- replace(hw2, c(4,12,22,27), NA)
hw2

hw2 <- na.omit(hw2)
# or hw2[!is.na(hw2)]

# mean(hw2, na.rm = TRUE)
# Use na.rm to use a function when dataset includes na's

prob1 <- hw2[hw2>=14&hw2<=38]
#or prob1 <- hw2[!is.na(hw2) & hw2>=14 & hw2<=38]
# probably better because it leaves hw2 unedited

prob1 * 3
times3 <- prob1 * 3
plus10 <- times3 + 10
plus10
plus10[c(TRUE,FALSE)]
final <- plus10[c(TRUE, FALSE)]
final

# TEST: cbind(hw2, plus10, hw2 + hw2)
# cbind creates a matrix thing to look at the above objects next to eachother

##HW 4----

library(tidyverse)
#1
surveys <- read_csv("data/portal_data_joined.csv")


#2
head(surveys %>% filter(weight %in% 30:60))

#their suggestion
#surveys %>% filter(weight > 30 & weight < 60) %>% head(n=5)

#3
biggest_critters <- surveys %>% filter(!is.na(weight)) %>% group_by(species_id, sex) %>% summarize(max_weight = max(weight)) %>% arrange(max_weight)

#4
#doodling

biggest_critters %>% arrange(-max_weight)

biggest_critters %>% tally(max_weight)

surveys %>% tally(weight)

surveys %>% count(sex)
surveys %>% filter(is.na(weight)) %>% count(species) %>% arrange(-n)




#5
surveys_avg_weight <- surveys %>% filter(!is.na(weight)) %>% group_by(species, sex) %>% mutate(mean_weight = mean(weight)) %>% select(species, sex, weight, mean_weight)

#6
surveys_avg_weight %>% mutate(above_average = weight > mean_weight) %>% count(above_average)


