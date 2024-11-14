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

# ggplot2 ----
## Grammar of Graphics plotting package (included in tidyverse package - you can see this when you call library(tidyverse)!)
## easy to use functions to produce pretty plots
## ?ggplot2 will take you to the package helpfile where there is a link to the website: https://ggplot2.tidyverse.org - this is where you'll find the cheatsheet with visuals of what the package can do!

## ggplot basics
## every plot can be made from these three components: data, the coordinate system (ie what gets mapped), and the geoms (how to graphical represent the data)
## Syntax: ggplot(data = <DATA>) + <GEOM_FUNCTION>(mapping = aes(<MAPPING>))

## tips and tricks
## think about the type of data and how many data  variables you are working with -- is it continuous, categorical, a combo of both? is it just one variable or three? this will help you settle on what type of geom you want to plot
## order matters! ggplot works by layering each geom on top of the other
## also aesthetics like color & size of text matters! make your plots accessible 


## example ----
library(tidyverse)
## load in data
surveys <- read_csv("data/portal_data_joined.csv") %>%
  filter(complete.cases(.)) # remove all NA's

#. refers to the data that pipes into the function

## Let's look at two continuous variables: weight & hindfoot length
## Specific geom settings

ggplot(data = surveys, mapping = aes(x = weight, y = hindfoot_length)) + geom_point(aes(color = genus)) +
  geom_smooth(aes(color = genus))

#always has to be within aes when pulling data from a data frame


## Universal geom settings

ggplot(data = surveys, mapping = aes(x = weight, y = hindfoot_length, color = genus)) + geom_point() +
  geom_smooth()






## Visualize weight categories and the range of hindfoot lengths in each group
## Bonus from hw: 
sum_weight <- summary(surveys$weight)
surveys_wt_cat <- surveys %>% 
  mutate(weight_cat = case_when(
    weight <= sum_weight[[2]] ~ "small",  # bracket is indexing for quantile
    weight > sum_weight[[2]] & weight < sum_weight[[5]] ~ "medium",
    weight >= sum_weight[[5]] ~ "large"
  )) 

table(surveys_wt_cat$weight_cat)


## We have one categorical variable and one continuous variable - what type of plot is best?

ggplot(data = surveys_wt_cat, aes(x = weight_cat, y = hindfoot_length)) +
  geom_point(aes(color = weight_cat))

ggplot(data = surveys_wt_cat, aes(x = weight_cat, y = hindfoot_length)) +
  geom_boxplot(aes(color = weight_cat), alpha = .05) + 
  geom_point(alpha = 0.1) #color and alpha can be placed outside or inside aes. Inside of aes maps it to data or something...


## What if I want to switch order of weight_cat? factor! (can use reorder)

surveys_wt_cat$weight_cat <- factor(surveys_wt_cat$weight_cat, c("small", "medium", "large"))

#geom_jitter is really cool too when combined with boxplot

ggplot(data = surveys_wt_cat, aes(x = weight_cat, y = hindfoot_length)) + geom_jitter(alpha = .1) + geom_boxplot(aes(color = weight_cat), alpha =.8)

class(surveys_wt_cat$weight_cat)

library(tidyverse)

surveys_complete <- read_csv('data/portal_data_joined.csv') %>%
  filter(complete.cases(.))

# these are two different ways of doing the same thing
head(surveys_complete %>% count(year,species_id))
head(surveys_complete %>% group_by(year,species_id) %>% tally())

yearly_counts <- surveys_complete %>% count(year,species_id)

head(yearly_counts)

ggplot(data = yearly_counts, mapping = aes(x = year, y = n, group = species_id)) + geom_line(aes(colour = species_id)) 

ggplot(data = yearly_counts[yearly_counts$species_id%in%c("BA", "DM", "DS"),], mapping = aes(x = year, y = n, group = species_id)) + 
  geom_line() +
  facet_wrap(~species_id,scales = 'free_y', ncol = 1) #the ~ is for calling a function or something...

#the bracketing above is how you would index for just specific species_id's

#not sure what scales does

#nrow or ncol stacks or puts them in rows 

ggplot(data = yearly_counts, mapping = aes(x = year, y = n, group = species_id)) + 
  geom_line() +
  facet_wrap(~species_id) +
  scale_y_continuous(name = 'obs', breaks = seq(0,600,100)) +
  theme_bw()

ggplot(data = yearly_counts,mapping = aes(x = year, y = n)) +
  geom_point()

ggplot(data = yearly_counts,mapping = aes(x = year, y= n)) +
  geom_line()

ggplot(data = yearly_counts,mapping = aes(x = year, y= n,group = species_id)) +
  geom_line()


ggplot(data = yearly_counts,mapping = aes(x = year, y= n, colour = species_id)) +
  geom_line()


ggplot(data = yearly_counts, mapping = aes(x = year, y = n)) +
  geom_line() +
  facet_wrap(~ species_id)


ggplot(data = yearly_counts, mapping = aes(x = year, y = n)) +
  geom_line() +
  facet_wrap(~ species_id,scales = 'free')



library(tidyverse)
library(ggplot2)

#Section 1: Plot Best Practices and GGPlot Review####
#ggplot has four parts:
#data / materials   ggplot(data=yourdata)
#plot type / design   geom_...
#aesthetics / decor   aes()
#stats / wiring   stat_...

#Let's see what this looks like:

#Here we practice creating a dot plot of price on carat
ggplot(diamonds, aes(x= carat, y= price)) +
  geom_point()


#Remember from Part 1 how we iterate? 
#I've added transparency and color

#all-over color
ggplot(diamonds, aes(x= carat, y= price)) +
  geom_point(color="blue")
#color by variable
ggplot(diamonds, aes(x= carat, y= price, color=clarity)) +
  geom_point(alpha = 0.2)

#plot best practices:
#remove backgrounds, redundant labels, borders, 
#reduce colors and special effects, 
#remove bolding, lighten labels, remove lines, direct label

#Now I've removed the background to clean up the plot
#As we learned last week, there are other themes besides classic. Play around!
ggplot(diamonds, aes(x= carat, y= price, color=clarity)) +
  geom_point(alpha = 0.2) + theme_classic()

#keep your visualization simple with a clear message
#label axes
#start axes at zero

#Now I've added a title and edited the y label to be more specific
ggplot(diamonds, aes(x= carat, y= price, color=clarity)) +
  geom_point(alpha = 0.2) + theme_classic() + 
  ggtitle("Price by Diamond Quality") + ylab("price in $")

#Now I've added linear regression trendlines for each color
ggplot(diamonds, aes(x= carat, y= price, color=clarity)) +
  geom_point(alpha = 0.2) + theme_classic() + 
  ggtitle("Price by Diamond Quality") + ylab("price in $") + 
  stat_smooth(method = "lm")

#Now I've instead added LOESS trendcurves for each color
ggplot(diamonds, aes(x= carat, y= price, color=clarity)) +
  geom_point(alpha = 0.2) + theme_classic() + 
  ggtitle("Price by Diamond Quality") + ylab("price in $") + 
  stat_smooth(method = "loess")

#Go to the Tutorials > Data Visualization Part 1 for a refresher on how to use
#colors in geom_line (a time series)

#Section 2 Color Palette Choices and Color-Blind Friendly Visualizations ####

#always work to use colorblind-friendly or black-and-white friendly palettes

#Be sure to read this superb article!
#https://www.nature.com/articles/s41467-020-19160-7?utm_source=twitter&utm_medium=social&utm_content=organic&utm_campaign=NGMT_USG_JC01_GL_NRJournals

#And this one!
#https://research.google/blog/turbo-an-improved-rainbow-colormap-for-visualization/

#I use the colorpalette knowledge I learned from R-DAVIS every time I make a plot,
#and it's not an exaggeration to say that it changed my life!
#Here are some templates that you may use and edit in your own work.

#There are four types of palettes: 
#1: continuous
#2: ordinal (for plotting categories representing least to most of something, with zero at one end)
#3: qualitative (for showing different categories that are non-ordered)
#4: diverging (for plotting a range from negative values to positive values, with zero in the middle)


install.packages("RColorBrewer")
#RColorBrewer shows some good examples of these. Let's take a look.
library("RColorBrewer")
#This is a list of all of RColorBrewer's colorblind-friendly discrete color palettes 
display.brewer.all(colorblindFriendly = TRUE)

#CONTINUOUS DATA
#use scale_fill_viridis_c or scale_color_viridis_c for continuous
#I set direction = -1 to reverse the direction of the colorscale.
ggplot(diamonds, aes(x= clarity, y= carat, color=price)) +
  geom_point(alpha = 0.2) + theme_classic() +
  scale_color_viridis_c(option = "A", direction = 
                          -1)

#let's pick another viridis color scheme by using a different letter for option
ggplot(diamonds, aes(x= clarity, y= carat, color=price)) +
  geom_point(alpha = 0.2) + theme_classic() +
  scale_color_viridis_c(option = "E", direction = -1)

#to bin continuous data, use the suffix "_b" instead
ggplot(diamonds, aes(x= clarity, y= carat, color=price)) +
  geom_point(alpha = 0.2) + theme_classic() +
  scale_color_viridis_b(option = "C", direction = -1)

#ORDINAL (DISCRETE SEQUENTIAL) 
#from the viridis palette
#use scale_fill_viridis_d or scale_color_viridis_d for discrete, ordinal data
ggplot(diamonds, aes(x= cut, y= carat, fill = color)) +
  geom_boxplot() + theme_classic() + 
  ggtitle("Diamond Quality by Cut") + 
  scale_fill_viridis_d("color")

#scale_color is for color and scale_fill is for the fill. 
#note I have to change the
#aes parameter from "fill =" to "color =", to match
ggplot(diamonds, aes(x= cut, y= carat, color = color)) +
  geom_boxplot(alpha = 0.2) + theme_classic() + 
  ggtitle("Diamond Quality by Cut") + 
  scale_color_viridis_d("color")

#here's how it looks on a barplot
ggplot(diamonds, aes(x = clarity, fill = cut)) + 
  geom_bar() +
  theme(axis.text.x = element_text(angle=70, vjust=0.5)) +
  scale_fill_viridis_d("cut", option = "B") +
  theme_classic()

#from RColorBrewer:
ggplot(diamonds, aes(x= cut, y= carat, fill = color)) +
  geom_boxplot() + theme_classic() + 
  ggtitle("Diamond Quality by Cut") + 
  scale_fill_brewer(palette = "PuRd")
#how did we know the name of the palette is "PuRd"? From this list:
display.brewer.all(colorblindFriendly = TRUE)

#QUALITATIVE CATEGORICAL

#From RColorBrewer:
ggplot(iris, 
       aes(x= Sepal.Length, y= Petal.Length, fill = Species)) +
  geom_point(shape=24, color="black") + theme_classic() + 
  ggtitle("Sepal and Petal Length of Three Iris Species") + 
  scale_fill_brewer(palette = "Set2")
#how did we know the name of the palette is "Set2"? From this list:
display.brewer.all(colorblindFriendly = TRUE)

#From the ggthemes package:
#let's also clarify the units
library(ggthemes)
ggplot(iris, aes(x= Sepal.Length, y= Petal.Length, color = Species)) +
  geom_point() + theme_classic() + 
  ggtitle("Sepal and Petal Length of Three Iris Species") + 
  scale_color_colorblind("Species") +
  xlab("Sepal Length in cm") + 
  ylab("Petal Length in cm")

#Manual Palette Design
#this is another version of the same 
#colorblind palette from the ggthemes package but with gray instead of black.
#This is an example of how to create a named vector
#of colors and use it as a manual fill.
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
names(cbPalette) <- levels(iris$Species)
#we don't need all the colors in the palette because there are only 3 categories. 
#We cut the vector length to 3 here
cbPalette <- cbPalette[1:length(levels(iris$Species))]

ggplot(iris, aes(x= Sepal.Length, y= Petal.Length, color = Species)) +
  geom_point() + theme_classic() + 
  ggtitle("Sepal and Petal Length of Three Iris Species") + 
  scale_color_manual(values = cbPalette) +
  xlab("Sepal Length in cm") + 
  ylab("Petal Length in cm")

#DIVERGING DISCRETE
#from RColorBrewer
myiris <- iris %>% group_by(Species) %>% mutate(size = case_when(
  Sepal.Length > 1.1* mean(Sepal.Length) ~ "very large",
  Sepal.Length < 0.9 * mean(Sepal.Length) ~ "very small",
  Sepal.Length < 0.94 * mean(Sepal.Length) ~ "small",
  Sepal.Length > 1.06 * mean(Sepal.Length) ~ "large",
  T ~ "average"
  
))
myiris$size <- factor(myiris$size, levels = c(
  "very small", "small", "average", "large", "very large"
))

ggplot(myiris, aes(x= Petal.Width, y= Petal.Length, color = size)) +
  geom_point(size = 2) + theme_gray() +
  ggtitle("Diamond Quality by Cut") + 
  scale_color_brewer(palette = "RdYlBu")

#Paul Tol also has developed qualitative, sequential, and diverging colorblind palettes:
#https://cran.r-project.org/web/packages/khroma/vignettes/tol.html
#you can enter the hex codes in manually just like the cbPalette example above


#also check out the turbo color palette!
#https://docs.google.com/presentation/d/1Za8JHhvr2xD93V0bqfK--Y9GnWL1zUrtvxd_y9a2Wo8/edit?usp=sharing
#https://blog.research.google/2019/08/turbo-improved-rainbow-colormap-for.html

#to download it and use it in R, use this link
#https://rdrr.io/github/jlmelville/vizier/man/turbo.html


#Section 3: Non-visual representations ####
#Braille package
mybarplot <- ggplot(diamonds, aes(x = clarity)) + 
  geom_bar() +
  theme(axis.text.x = element_text(angle=70, vjust=0.5)) +
  theme_classic() + ggtitle("Number of Diamonds by Clarity")
mybarplot

library(BrailleR)

VI(mybarplot)

library(sonify)
plot(iris$Petal.Width)
sonify(iris$Petal.Width)

detach("package:BrailleR", unload=TRUE)

#Section 4: Publishing Plots and Saving Figures & Plots ####
library(cowplot)
#you can print multiple plots together, 
#which is helpful for publications
# make a few plots:

plot.diamonds <- ggplot(diamonds, aes(clarity, fill = cut)) + 
  geom_bar() +
  theme(axis.text.x = element_text(angle=70, vjust=0.5))

#plot.diamonds

plot.cars <- ggplot(mpg, aes(x = cty, y = hwy, colour = factor(cyl))) + 
  geom_point(size = 2.5)
#plot.cars

plot.iris <- ggplot(data=iris, aes(x=Sepal.Length, y=Petal.Length, fill=Species)) +
  geom_point(size=3, alpha=0.7, shape=21)
#plot.iris

# use plot_grid
panel_plot <- plot_grid(plot.cars, plot.iris, plot.diamonds, 
                        labels=c("A", "B", "C"), ncol=2, nrow = 2)

panel_plot

#you can fix the sizes for more control over the result
fixed_gridplot <- ggdraw() + draw_plot(plot.iris, x = 0, y = 0, width = 1, height = 0.5) +
  draw_plot(plot.cars, x=0, y=.5, width=0.5, height = 0.5) +
  draw_plot(plot.diamonds, x=0.5, y=0.5, width=0.5, height = 0.5) + 
  draw_plot_label(label = c("A","B","C"), x = c(0, 0.5, 0), y = c(1, 1, 0.5))

fixed_gridplot

#saving figures
ggsave("figures/gridplot.png", fixed_gridplot)
#you can save images as .png, .jpeg, .tiff, .pdf, .bmp, or .svg

#for publications, use dpi of at least 700
ggsave("figures/gridplot.png", fixed_gridplot, 
       width = 6, height = 4, units = "in", dpi = 700)

#interactive web applications
library(plotly)

plot.iris <- ggplot(data=iris, aes(x=Sepal.Length, y=Petal.Length, 
                                   fill=Species)) +
  geom_point(size=3, alpha=0.7, shape=21)

plotly::ggplotly(plot.iris)



#Dates and times----
#three time classes
#Dates
#posixct (calendar time)
#posixlt (local time)

sample_dates_1 <- c("2018-02-01", "2018-03-21", "2018-10-05", 
                    "2019-01-01", "2019-02-18")

class(sample_dates_1)











#The string must be of the form
#YYYY-MM-DD
#to convert it into a Date object
sample_dates_1 <- as.Date(sample_dates_1)

class(sample_dates_1)

#otherwise this happens:
sample_dates_2 <- c("02-01-2018", "03-21-2018", 
                    "10-05-2018", "01-01-2019", "02-18-2019")
sample_dates_3 <-as.Date(sample_dates_2) # this doesn't work

sample_dates_3








#to fix this error, you need to specify the format like so:
sample_dates_3<- as.Date(sample_dates_2, format = "%m-%d-%Y" ) 
# date code preceded by "%"

sample_dates_3


#here is a complete list of date-time formats
?strptime













#challenge
as.Date("Jul 04, 2019", format = 
          "%b%d,%Y")









#when working with times, POSIXct is the best class to work with
tm1 <- as.POSIXct("2016-07-24 23:55:26")
tm1

tm2 <- as.POSIXct("25072016 08:32:07", format = "%d%m%Y %H:%M:%S")
tm2











#posixct assumes you collected your data in the 
#timezone your computer is set to. 
#To change this, set the timezone parameter. 
#Here's an example that sets the timezone to "GMT"
tm3 <- as.POSIXct("2010-12-01 11:42:03", tz = "GMT")
tm3
















#the tidyverse way:
library(lubridate)

sample_dates_1 <- c("2018-02-01", "2018-03-21", 
                    "2018-10-05", "2019-01-01", "2019-02-18")
#we use ymd since our data is y-m-d
sample_dates_lub <- ymd(sample_dates_1)

sample_dates_lub











sample_dates_2 <- c("2-01-2018", "3-21-2018", 
                    "10-05-18", "01-01-2019", "02-18-2019")
#notice that not all of the expected number of 
#digits are always used. Lubridate don't care!

sample_dates_lub2 <- mdy(sample_dates_2)
sample_dates_lub2













#more examples using lubridate:
lubridate::ymd("2016/01/01")# --> 2016-01-01
lubridate::ymd("2011-03-19")# --> 2011-03-19
lubridate::mdy("Feb 19, 2011")# --> 2011-02-19
lubridate::dmy("22051997")# --> 1997-05-22












#Timezones:
#hms means hours, minutes seconds. 
#to add time to a date, use functions that 
#add "_hms" or "_hm"
#it's a good idea to combine your date and 
#time into a single column, since
#it represents different sized increments 
#of a single time variable

lubridate::ymd_hm("2016-01-01 12:00", 
                  tz="America/Los_Angeles")
# --> 2016-01-01 12:00:00
#24 hour time:
lubridate::ymd_hm("2016/04/05 14:47", 
                  tz="America/Los_Angeles")
# --> 2016-04-05 14:47:00

#converts 12 hour time into 24 hour time:
latime <- lubridate::ymd_hms("2016/04/05 4:47:21 PM", 
                             tz="America/Los_Angeles") 
latime
#how to change time zones
with_tz(latime, tzone = "GMT")
with_tz(latime, tzone = "Pacific/Honolulu")
# --> 2016-04-05 16:47:21








#make sure your data starts as 
#character strings, not as dates and times, 
#before converting to lubridate
#read_csv will see dates and 
#times and guess that you want them as 
#Date and Time objects, so you have to 
#explicitly tell it not to do this.

library(dplyr)
library(readr)

# read in some data and skip header lines
mloa1 <- read_csv("https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/main/data/mauna_loa_met_2001_minute.csv")
head(mloa1) #R tried to guess for you that 
#the year, month, day, and hour columns were numbers

# import raw dataset & specify column types
mloa2 <- read_csv("https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/main/data/mauna_loa_met_2001_minute.csv",
                  col_types = "cccccccddddddddd")

#notice the difference in the data types of these two objects:
glimpse(mloa1) 
glimpse(mloa2)











# now we are ready to make a datetime col 
#so that we can use lubridate on it:
mloa2$datetime <- paste(mloa2$year, "-", mloa2$month,
                        "-", mloa2$day, ", ", mloa2$hour24, ":",
                        mloa2$min, sep = "")

glimpse(mloa2)
#since we used "paste," our new column is a character string type













#3 options for how to progress from here:
# convert Date Time to POSIXct in local timezone using lubridate

#WARNING!!
#this method as_datetime does not work 
#in this dataset unless you specify
#format, because otherwise it tries to look for 
#seconds but we don't have data for seconds, 
#and there are an inconsistent number of 
#digits for each portion of the datetime 
#(eg month could be "2" or "12")
mloa2$datetime_test <- as_datetime(mloa2$datetime, 
                                   tz="America/Los_Angeles", 
                                   format="%Y-%m-%d, %H:%M")
#note: America/Los_Angeles is not actually 
#the time zone that this data is from,
#which is evident because when telling 
#lubridate to assume the data is from 
#America/Los_Angeles, the 60 datapoints 
#during the switch to daylight savings 
#are parsed as "NA" because that hour didn't actually exist!

# Instead, convert using the ymd_functions
#This method works!
mloa2$datetime_test2 <- ymd_hm(mloa2$datetime, 
                               tz = "Pacific/Honolulu")

# OR wrap in as.character()
mloa1$datetime <- ymd_hm(as.character(mloa2$datetime), 
                         tz="Pacific/Honolulu")
tz(mloa1$datetime)














#how do we extract different components from a lubridate object?
# Functions called day(), month(), year(), 
#hour(), minute(), second(), etc... will 
#extract those elements of a datetime column.
months <- month(mloa2$datetime)

# Use the table function to get a quick 
#summary of categorical variables
table(months)

# Add label and abbr agruments to convert 
#numeric representations to have names
months <- month(mloa2$datetime, label = TRUE, abbr=TRUE)
table(months)

#how to check for daylight savings time
dst(mloa2$datetime_test[1])
dst(mloa2$datetime)

latime <- lubridate::ymd_hms("2016/04/05 4:47:21 PM", 
                             tz="America/Los_Angeles") 
latime
dst(latime)
gm <- with_tz(latime, tzone = "GMT")
dst(gm) 
hi <- with_tz(latime, tzone = "Pacific/Honolulu")
dst(hi) 
# --> 2016-04-05 16:47:21

seq(mdy('01-01-2020'), mdy('10-01-2020'), by = 1) # can add a sequence of dates

mdy('01-01-2020') - months(2) # can math on time

#decimal_date lets you get an objective timeline, could be helpful for sorting or mathing on time

# HW 7 Review -------------------------------------------------------------
gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")

pg <- gapminder %>% 
  select(country, year, pop, continent) %>% 
  filter(year > 2000) %>% 
  pivot_wider(names_from = year, values_from = pop) %>% 
  mutate(pop_change_0207 = `2007` - `2002`)

pg %>% 
  filter(continent != "Oceania") %>% 
  ggplot(aes(x = reorder(country, pop_change_0207), y = pop_change_0207)) +
  geom_col(aes(fill = continent)) +
  facet_wrap(~continent, scales = "free") +
  theme_bw() +
  scale_fill_viridis_d() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), 
        legend.position = "none") +
  xlab("Country") +
  ylab("Change in Population Between 2002 and 2007")

# Creating Functions ------------------------------------------------------
# Learning Objectives: 
## Define a function that takes arguments
## Set default value for function arguments
## Explain why we should divide programs into small, single-purpose functions



## Defining a function -----------------------------------------------------
# arguments are the input, return values are the output
# for now, we will work with functions that return a single value


# providing argument defaults so you don't have to specify every argument every time (e.g., na.rm = FALSE in mean)








# Process to write your own function --------------------------------------
## temperature conversion example: Farenheit to Kelvin
((50 - 32) * (5/9)) + 273.15
((62 - 32) * (5/9)) + 273.15
((72 - 32) * (5/9)) + 273.15

## How do write function: 
# 1. Identify what piece(s) will change within your commands -- this is your argument
# 2. Remove it and replace with object(s) name(s)
# 3. Place code and argument into the function() function




## Pass-by-value: changes or objects within the function only exist within the function
## what happens in the function, stays in the function 

f_to_k <- function(tempF){
  ((tempF - 32) * (5/9)) + 273.15
}

f_to_k(tempF = 72)


((tempF - 32) * (5/9)) + 273.15

f_to_k <- function(tempF){
  k <- ((tempF - 32) * (5/9)) + 273.15
  print("hello")
  return(k)
}

f_to_k(72)
#use return at the end of your function to call out that value

f_to_k(72)


# source()ing functions ---------------------------------------------------
source("scripts/functions.R")




# Using dataframes in functions -------------------------------------------
# Say you find yourself subsetting a portion of your dataframe again and again 
# Example: Calculate average GDP in a given country, in a given span of years, using the gapminder data

gapminder %>% 
  filter(country == "Canada", year %in% c(1950:1970)) %>% 
  summarize(meanGDP=(mean(gdpPercap, na.rm = TRUE)))

# generalize this where we change county nad year range

avgGDP <- function(cntry, yr.range){
  gapminder %>% 
    filter(country == cntry, year %in% c(yr.range)) %>% 
    summarize(meanGDP=(mean(gdpPercap, na.rm = TRUE)))
  }

gapminder %>% 
  filter(country == "United States", year %in% c(1980:1995) %>% 
  summarize(meanGDP=(mean(gdpPercap, na.rm = TRUE)))


  
  avgGDP(cntry = "United States", yr.range = 1980:1995)

# Challenge ---------------------------------------------------------------
# Write a new function that takes two arguments, the gapminder data.frame (d) and the name of a country (e.g. "Afghanistan"), and plots a time series of the country’s population. The return value from the function should be a ggplot object. Note: It is often easier to modify existing code than to start from scratch. To start out with one plot for a particular country, figured out what you need to change for each iteration (these will be your arguments), and then wrap it in a function.

ts_plot <- function(cntry){ggplot(data = gapminder %>% filter(country == cntry), aes(x = year, y = pop)) + geom_line()}
  
ts_plot("Afghanistan")  

ts_plot("United States")
  
ggplot(data = gapminder %>% filter(country == "Afghanistan"), aes(x = year, y = pop)) + geom_line()




