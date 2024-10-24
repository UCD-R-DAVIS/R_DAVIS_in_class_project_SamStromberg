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


# Conditional statements ---- 
## ifelse: run a test, if true do this, if false do this other thing
## case_when: basically multiple ifelse statements
# can be helpful to write "psuedo-code" first which basically is writing out what steps you want to take & then do the actual coding
# great way to classify and reclassify data

## Load library and data ----
library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")

## ifelse() ----
# from base R
# ifelse(test, what to do if yes/true, what to do if no/false)
## if yes or no are too short, their elements are recycled
## missing values in test give missing values in the result
## ifelse() strips attributes: this is important when working with Dates and factors
surveys$hindfoot_cat <- ifelse(surveys$hindfoot_length < mean(surveys$hindfoot_length, na.rm = TRUE), yes = "small", no = "big")

head(surveys$hindfoot_cat)
head(surveys$hindfoot_length)
summary(surveys$hindfoot_length)
surveys %>% summarize(mean(hindfoot_length, na.rm = TRUE))
unique(surveys$hindfoot_cat)

surveys %>%
  mutate(hindfoot_cat = case_when(
    hindfoot_length > 29.29 ~ "big", 
    TRUE ~ "small"
  )) %>%
  select(hindfoot_length, hindfoot_cat) %>%
  head()

## case_when() ----
# GREAT helpfile with examples!
# from tidyverse so have to use within mutate()
# useful if you have multiple tests
## each case evaluated sequentially & first match determines corresponding value in the output vector
## if no cases match then values go into the "else" category

# case_when() equivalent of what we wrote in the ifelse function
surveys %>%
  mutate(hindfoot_cat = case_when(
    hindfoot_length > 29.29 ~ "big", 
    TRUE ~ "small"
  )) %>%
  select(hindfoot_length, hindfoot_cat) %>%
  head()

#to use mean(), use na.rm 

surveys %>%
  mutate(hindfoot_cat = case_when(
    hindfoot_length > mean(hindfoot_length, na.rm = TRUE) ~ "big", 
    TRUE ~ "small"
  )) %>%
  select(hindfoot_length, hindfoot_cat) %>%
  head()

table(surveys$hindfoot_cat)

#You can use | as or function still

surveys %>% 
  mutate(hindfoot_cat = case_when(
    hindfoot_length > 31.5 ~ "big",
    hindfoot_length > 29 ~ "medium",
    is.na(hindfoot_length) ~ NA_character_,
    TRUE ~ "small"
  )) %>% 
  select(hindfoot_length, hindfoot_cat) %>% 
  head(10)
#NA_character_ is different than NA

# but there is one BIG difference - what is it?? (hint: NAs)



# if no "else" category specified, then the output will be NA


# lots of other ways to specify cases in case_when and ifelse
surveys %>%
  mutate(favorites = case_when(
    year < 1990 & hindfoot_length > 29.29 ~ "number1", 
    species_id %in% c("NL", "DM", "PF", "PE") ~ "number2",
    month == 4 ~ "number3",
    TRUE ~ "other"
  )) %>%
  group_by(favorites) %>%
  tally()

#Joins and pivots----

#joins tend to work row wise, merge is columns i think...
#inner_join is only if there's matches on both dataframes
#left_join and right_join use 1st or 2nd dataframe (x or y frames)
#so left join keeps everything in the first frame no matter what
#full join smashes it all, keeps everything and fills in na's with no corresponding values
#specify which columns to join on (otherwise it just joins on everything which matches i think...)
#dim() funtion is great! idk what dim does, or also nrow() calls
dim(surveys)

library(tidyverse)

tail <- read_csv("data/tail_length.csv")
surveys <- read_csv("data/portal_data_joined.csv")

dim(tail)
dim(surveys)
head(tail)

surveys_inner <- inner_join(x = surveys, y = tail)

surveys_left <- left_join(x = surveys, y = tail)

all(surveys$record_id %in% tail$record_id)

tail <- tail %>% mutate(tail_length2 = tail_length)


surveys_mz <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(genus, plot_id) %>% 
  summarize(mean_weight = mean(weight)) 

surveys_mz

surveys_mz %>% pivot_wider(id_cols = 'genus', names_from = 'plot_id', values_from = 'mean_weight')



