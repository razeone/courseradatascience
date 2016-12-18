# Week 4 Editing text variables
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
if(!file.exists("./data")){dir.create("./data")}
download.file(fileUrl, destfile = "./data/cameras.csv", method = "curl")
cameraData <- read.csv("./data/cameras.csv")
names(cameraData)
# All the letter to lowercase
tolower(names(cameraData))
# Splitting variable names with for example period
splitNames <- strsplit(names(cameraData), "\\.")
splitNames[[5]]
splitNames[[6]]
# Quick aside on lists
myList <- list(letters = c("A", "b", "c"), numbers = 1:3, matrix(1:25, ncol = 5))
head(myList)
myList[1]
myList$letters
myList[[1]]
# Fixing character vectors - sapply()
splitNames[[6]][1]
firstElement <- function(x){x[1]}
sapply(splitNames, firstElement)
# Peer review data
fileUrl1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1, destfile = "./data/reviews.csv", method = "curl")
download.file(fileUrl2, destfile = "./data/solutions.csv", method = "curl")
reviews <- read.csv("./data/reviews.csv"); solutions <- read.csv("./data/solutions.csv")
head(reviews, 2)
head(solutions, 2)
# Fixing character vectors - sub()
names(reviews)
sub("_", "", names(reviews),)
testName <- "this_is_a_test"
# sub() Only substitutes the first underscore
sub("_", "", testName)
# We fix that with gsub
gsub("_", "", testName)
# Finding values with grep() and grepl()
grep("Alameda", cameraData$intersection)
table(grepl("Alameda", cameraData$intersection))
cameraData2 <- cameraData[!grepl("Alameda", cameraData$intersection),]
# More on grep
# Instead of the index you can get the value
grep("Alameda", cameraData$intersection, value = TRUE)
# Looking for missing data
grep("JeffStreet", cameraData$intersection)
length(grep("JeffStreet", cameraData$intersection))
# More useful string functions
library(stringr)
nchar("Jeffrey Leek")
substr("Jeffrey Leek", 1, 7)
paste("Jeffrey", "Leek")
paste0("Jeffrey", "Leek")
str_trim("Jeff     ")
# Importante points about text in data sets
# Names in variables should be
# - All lower cases
# - Descriptive (Diagnosis versus Dx)
# - Not duplicated
# - Not have underscores or dots or white spaces
# Variables with character values
# - Should usually be made into factor variables (depends on application)
# - Should be descriptive (use TRUE/FALSE instead of 0/1 and Male/Female vz 0/1 or M/F)