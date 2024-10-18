#10.3----
##Messy early notes----
get(wd)
getwd()
dir.create("./scripts")
dir.create("./Notes")
weight_g <- c(50, 60, 65, 82)
weight_g
animals <- c("mouse", "rat", "dog")
animals
length(weight_g)
length(animals)
str(weight_g)

#Challenge
num_char <- c(1, 2, 3, "a") # least common denominator
num_char
num_logical <- c(1, 2, 3, TRUE) # booleans usually function as binary anyway,
# so defaults
num_logical
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")
class(num_char)
num_char <- c(1 ,2, 3, a)
##Change vectors----
weight_g <- (weight_g, 90)
weight_g <- c(weight_g, 90)
weight_g

##Subsetting ----

animals <- c(animals, "cat")
animals[2]
animals [2,3]
animals[c(2,3)]

# indexing: takes items from a vector and create a new combination of values

##Conditional subsetting----

weight_g <- c(21, 34, 39, 54, 55)
weight_g > 50
weight_g[weight_g >50]

## Symbols
#%in% searches within, but doesn't care exactly where in the object it is.
# rummages in the bucket

animals
animals %in% c("rat", "cat", "dog", "duck", "goat")
animals
animals == c("rat", "cat", "dog", "duck", "goat")

test <- 5
test <- 5, 2, 4

#10.10---- 
##Other Data types----

###Lists----

c(4, 6, "dog")
list(4, 6 , "dog")
a <- list(4, 6, "dog")
class(a)
str(a)

###Data.frames----
letters
data.frame(letters)
df <- data.frame(letters)
length(df)
dim(df) #displays rows, then columns
nrow(df) #just how many rows
ncol(df) #just how many columns


##Factors----
animals <- factor(c("pigs", "duck", "duck", "goose", "goose"))
animals
#factor is a class which creates levels, and will alphabetize them i think...

class(animals)
levels(animals) #what are the levels
nlevels(animals) #how many levels

animals <- factor(x = animals, levels = c("goose", "pigs", "duck"))
#you can set the levels to any order
animals

year <- factor(c(1978, 1980, 1934, 1979))
year
class(year)
as.numeric(year)
levels(year)

as.numeric(animals) #forces the object into numeric class
as.character(animals) #same for character

class(as.character(animals))

##Matrix----

#two dimensional as opposed to 1 dimensional vectors

file_loc <- read.csv('data/portal_data_joined.csv') #didn't work
test <- read.csv(file_loc) #didn't work

surveys <- read.csv("data/portal_data_joined.csv")
nrow(surveys)
ncol(surveys)
str(surveys)
summary(surveys)
summary(object = surveys)

surveys[1, 5]

#first five rows
surveys[1:5,]
surveys[c(1,5,24,3001),]


dim(surveys[,1:5])
surveys[,1]
surveys[,1:5]

surveys[,1]

colnames(surveys)

surveys[c('record_id', 'year', 'day')]
dim(surveys[c('record_id', 'year', 'day')])

head(surveys, n =1)
head(surveys)
surveys[1:6,]

tail(surveys)

head(surveys[1:6,])
head(surveys[,c("genus", "species")]) #meta deta
head(surveys[["genus"]]) #metadata lost

head(surveys["genus"])
head(surveys[c("genus","species")])

surveys$genus # $ how you call columns. only columns!
surveys["genus"] #keeps it as a dataframe, not an integer

class(surveys["genus"])

surveys$hindfoot_length

class(surveys$hindfoot_length)

surveys$genus

head(surveys)

##tidyverse----

install.packages('Rtools')
install.packages('tidyverse')
library(tidyverse)

t_surveys <- read.csv('data/portal_data_joined.csv')
class(t_surveys)
t_surveys

surveys
#learning dplyr and tidyr: select, filter, and pipes
#only do this once ever:
install.packages(
#We've learned bracket subsetting
#It can be hard to read and prone to error
#dplyr is great for data table manipulation!
#tidyr helps you switch between data formats

#Packages in R are collections of additional functions
#tidyverse is an "umbrella package" that
#includes several packages we'll use this quarter:
#tidyr, dplyr, ggplot2, tibble, etc.

#benefits of tidyverse
#1. Predictable results (base R functionality can vary by data type) 
#2. Good for new learners, because syntax is consistent. 
#3. Avoids hidden arguments and default settings of base R functions

#To load the package type:
library(tidyverse)
#now let's work with a survey dataset
surveys <- read_csv('data/portal_data_joined.csv')


str(surveys)









#select columns
month_day_year <- select(surveys, month, day, year)

#filtering by equals
year_1981 <- filter(surveys, year == 1981)
sum(year_1981$year !=1981, na.rm = T)

year_1981_baser <- surveys[surveys$year == 1981,]

unique(year_1981$year)

#filtering by range
the80s <- surveys[surveys$year %in% 1981:1983,]
the80stidy <- filter(surveys, year %in% 1981:1983) #whenever you want a range (a bucket) use %in% to avoid recycling
#5033 results


#review: why should you NEVER do:
the80srecycle <- filter(surveys, year == c(1981:1983))
#1685 results

#This recycles the vector 
#(index-matching, not bucket-matching)
#If you ever really need to do that for some reason,
#comment it ~very~ clearly and explain why you're 
#recycling!

#filtering by multiple conditions
bigfoot_with_weight <- filter(surveys, hindfoot_length > 40 & !is.na(weight))

#multi-step process
small_animals <- filter(surveys, weight < 5)
#this is slightly dangerous because you have to remember 
#to select from small_animals, not surveys in the next step
small_animal_ids <- select(small_animals, record_id, plot_id, species_id)
                           
#same process, using nested functions
small_animal_ids <- select(filter(surveys, weight < 5), record_id, plot_id, species_id)
  
#same process, using a pipe
#Cmd Shift M
#or |>
#note our select function no longer explicitly calls the tibble
#as its first element
small_animals_ids <- surveys %>% filter(., weight<5) %>% select(., record_id, plot_id, species_id)


small_animal_ids <- filter(surveys, weight < 5) %>% 
  select(

#same as
small_animal_ids <- surveys %>% filter(
  
  

#how to do line breaks with pipes
surveys %>% filter(
  month == 1)

#good:
surveys %>% 
  filter(month==1)

#not good:
surveys 
%>% filter(month==1)
#what happened here?

#line break rules: after open parenthesis, pipe,
#commas, 
#or anything that shows the line is not complete yet




#check out cute_rodent_photos!
#will be updated throughout the quarter
#as a bonus for checking out these videos
#and visiting the code demos on my repository


#one final review of an important concept we learned last week
#applied to the tidyverse

mini <- surveys[190:209,]
table(mini$species_id)
#how many rows have a species ID that's either DM or NL?
nrow(mini)


test <- mini %>% filter(species_id == c("DM", "NL")) #bad cuz it recycles!
nrow(test)
nro

test <- mini %>% filter(species_id %in% c("DM", "NL")) #good cuz within







surveys %>%
  group_by(sex) %>%
  mutate(mean_weight = mean(weight, na.rm = TRUE)) 


# multiple groups
surveys %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE))


# remove na's


# sort/arrange order a certain way


# Challenge
#What was the weight of the heaviest animal measured in each year? Return a table with three columns: year, weight of the heaviest animal in grams, and weight in kilograms, arranged (arrange()) in descending order, from heaviest to lightest. (This table should have 26 rows, one for each year)


#Try out a new function, count(). Group the data by sex and pipe the grouped data into the count() function. How could you get the same result using group_by() and summarize()? Hint: see ?n.

#
#block

# Data Manipulation Part 1b ----
# Goals: learn about mutate, group_by, and summarize
library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")
str(surveys)


# Adding a new column
# mutate: adds a new column
surveys <- surveys %>%
  mutate(., weight_kg = weight/1000)

str(surveys)

# Add other columns

surveys <- surveys %>%
  mutate(.,
         weight_kg = weight/1000,
         weight_kg2 = weight_kg*2)
str(surveys)

surveys$weight_kg2 = as.character(surveys$weight_kg2)

# Filter out the NA's
avg_weight <- surveys %>% 
  filter(!is.na(weight)) %>% 
  mutate(mean_weight = mean(weight))

str(avg_weight)
nrow(avg_weight) #32283



# Group_by and summarize ----
# A lot of data manipulation requires us to split the data into groups, apply some analysis to each group, and then combine the results
# group_by and summarize functions are often used together to do this
# group_by works for columns with categorical variables 
# we can calculate mean by certain groups
surveys %>%
  group_by(sex) %>%
  mutate(mean_weight = mean(weight, na.rm = TRUE)) 

#this actually maps the mean weight to each obs


# multiple groups
df <- surveys %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE))

summary(df)

#this just prints a summary

# remove na's


# sort/arrange order a certain way

surveys %>%
  group_by(sex, species_id) %>%
  filter(sex != "") %>% 
  summarize(mean_weight = mean(weight, na.rm = TRUE)) %>% 
  arrange(mean_weight)

surveys %>%
  group_by(sex, species_id) %>%
  filter(sex != "") %>% 
  summarize(mean_weight = mean(weight, na.rm = TRUE)) %>% 
  arrange(-mean_weight) #descending


# Challenge
#What was the weight of the heaviest animal measured in each year? Return a table with three columns: year, weight of the heaviest animal in grams, and weight in kilograms, arranged (arrange()) in descending order, from heaviest to lightest. (This table should have 26 rows, one for each year)

str(surveys)

surveys %>% 
  group_by(year) %>% 
  filter(!is.na(weight)) %>% 
  summarize(max_weight = max(weight)) %>% 
  mutate(max_weightkg = max_weight/1000)

surveys %>% 
  select(year, record_id, weight) %>% 
  group_by(year) %>% 
  filter(!is.na(weight)) %>% 
  mutate(weight_kg = weight/1000) %>% 
  summarize(max_weight_g = max(weight),
            max_weight_kg = max(weight)) %>% 
  arrange()



surveys %>% 
  group_by(year,weight,weight_kg) %>% 
  filter(y


#Try out a new function, count(). Group the data by sex and pipe the grouped data into the count() function. How could you get the same result using group_by() and summarize()? Hint: see ?n.

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



