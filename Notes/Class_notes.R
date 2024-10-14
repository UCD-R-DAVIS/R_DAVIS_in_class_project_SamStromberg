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
# Change vectors----
weight_g <- (weight_g, 90)
weight_g <- c(weight_g, 90)
weight_g
# challenge----
num_char <- c(1, 2, 3, "a") # least common denominator
num_char
num_logical <- c(1, 2, 3, TRUE) # booleans usually function as binary anyway,
# so defaults
num_logical
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")
class(num_char)
num_char <- c(1 ,2, 3, a)
# subsetting ----
animals <- c(animals, "cat")
animals[2]
animals [2,3]
animals[c(2,3)]
# indexing: takes items from a vector and create a new combination of values

# conditional subsetting----
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


