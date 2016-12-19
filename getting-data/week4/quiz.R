url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url = url, destfile = "./data/housing2006.csv")
housing <- read.csv("./data/housing2006.csv")
names(housing)
splitNames <- strsplit(names(housing), "wgtp")
splitNames[123]
url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url1, destfile = "./data/product_data.csv", method = "curl")
product <- read.csv("./data/product_data.csv")
names(product)
noComma <- gsub(",", "", product$X.3)
noCommaNum <- as.numeric(noComma)
mean(noCommaNum[5:194])
grep("United$", product$X.2)
url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url2, destfile = "./data/fedstats_country.csv", method = "curl")
fedstats <- read.csv("./data/fedstats_country.csv")
cleanProduct <- product[5:194,]
mergedData <- merge(fedstats, cleanProduct, by.x = "CountryCode", by.y = "X")
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
picked2012 <- sampleTimes[grep("2012", sampleTimes)]
length(picked2012)
library(lubridate)
pickedMonday <- grep("Mon", wday(picked2012, label = T))
length(pickedMonday)