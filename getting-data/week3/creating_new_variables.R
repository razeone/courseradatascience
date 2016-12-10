# Lecture: Creating new variables
# Create dir and download the given CSV
# Some shortcuts for common tasks in R
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
if(!file.exists("./data")){dir.create("./data")}
download.file(fileUrl, destfile = "./data/restaurants.csv", method = "curl")
restData <- read.csv("./data/restaurants.csv")
# Creating sequences
# A vector from 1 to 10 summing 2
s1 <- seq(1,10, by=2); s1 # 1 3 5 7 9
# From 1 to 10 and with 3 values
s2 <- seq(1,10, length = 3); s2 # 1.0 5.5 10.0
# Create a vector and another with the indexes using seq
x <- c(1,3,8,25,100); seq(along = x)
# Subsetting variables
# Getting all those restaurants that fall into the two neighborhoods
restData$nearMe <- restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe)
# now we use the ifelse to assign True
restData$zipWrong <- ifelse(restData$zipCode < 0, T, F)
table(restData$zipWrong, restData$zipCode < 0)
# Creating categorical variables
restData$zipGroups <- cut(restData$zipCode, breaks = quantile(restData$zipCode))
table(restData$zipGroups)
# Kind of clustering
table(restData$zipGroups, restData$zipCode)
# Shortcut, you can have the separation in groups over quantiles
# using the Hmisc package and using the cut2 function
library(Hmisc)
restData$zipGroups = cut2(restData$zipCode, g = 4) # Note that this produces a factor variable
table(restData$zipGroups) 
# Creating factor variables
restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]
class(restData$zcf)
# Levels of factor variables
yesno <- sample(c("yes", "no"), size = 10, replace = TRUE)
yesnofac <- factor(yesno, levels = c("yes", "no"))
relevel(yesnofac, ref = "yes")
as.numeric(yesnofac)
# Using the mutate function
library(Hmisc); library(plyr)
restData2 <- mutate(restData, zipGroups = cut2(zipCode, g = 4))
table(restData2$zipGroups)
# Common transforms
# abs(x) absolute value
# sqrt(x) square root
# ceiling(x) ceiling(3.475) is 4
# floor(x) floor(3.475) is 3
# round(x, digits = n) round(3.475, digits = 2) is 3.48
# signif(x, digits = n) signif(3.475, digits = 2) is 3.5
# cos(x), sin(x)
# log(x) natural logarithm
# log2(x), log10(x) other common logs
# exp(x) exponentiating x