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



#
#block

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



