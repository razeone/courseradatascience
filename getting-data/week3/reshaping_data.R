# Lecture: Reshaping Data
# The goal is Tidy Data
# 1. Each variable forms one column
# 2. Each observation forms a row
# 3. Each table/file stores data about one kind of observation (e.g. people, hospitals)
library(reshape2)
head(mtcars)
# Melting data
mtcars$carname <- rownames(mtcars)
# To the data frame we're going to melt
carMelt <- melt(mtcars, id = c("carname", "gear", "cyl"), measure.vars = c("mpg", "hp"))
# A bunch of id values carname, gear, cyl
# one row for every mpg and one row for each hp
head(carMelt, n = 3)
tail(carMelt, n = 3)
# Casting data frames
# With the dcast function we can recast the data frame
# into particular shapes and particular data frames
# We want to see cyl variable broken down by different vairables
cylData <- dcast(carMelt, cyl ~ variable)
# Summarizes the data
cylData
# Another way of summarize
cylData <- dcast(carMelt, cyl ~ variable, mean)
cylData
# Averaging values
head(InsectSprays)
# The sum of the count for each of the different sprays
# Apply to count along of different spray the sum function
tapply(InsectSprays$count, InsectSprays$spray, sum)
# Another way - split
spIns <- split(InsectSprays$count, InsectSprays$spray)
spIns
# and also apply
sprCount <- lapply(spIns, sum)
sprCount
# Another way - combine
unlist(sprCount)
sapply(spIns, sum)
# Another way - plyr package
library(plyr)
ddply(InsectSprays, .(spray), summarize, sum = sum(count))
# Creating a new variable
spraySums <- ddply(InsectSprays, .(spray), summarize, sum=ave(count, FUN=sum))
dim(spraySums)
head(spraySums)
# Another functions to look at
# acast - for casting as multi-dimensional arrays
# arrange - for faster reordering without using order() commands
# mutate - adding new variables