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


