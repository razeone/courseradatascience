fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/housing.csv")
housing <- read.csv("./data/housing.csv")
agricultureLogical <- ifelse(housing$ACR >= 3 & housing$AGS >= 6, T, F)
which(agricultureLogical)
library(jpeg)
jpegUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(jpegUrl, destfile = "./data/jeff.jpg")
jeffPic <- readJPEG("./data/jeff.jpg", native = TRUE)
quantile(jeffPic, probs = (0:10)/10)
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl1, destfile = "./data/domestic_data.csv")
fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl2, destfile = "./data/educational_data.csv")
domestic <- read.csv("./data/domestic_data.csv")
educational <- read.csv("./data/educational_data.csv")
mergedData <- merge(domestic, educational, by.x = "X", by.y = "CountryCode", all = TRUE)
intersection <- intersect(domestic$X, educational$CountryCode)
sorted <- domestic[order(domestic$Gross.domestic.product.2012, decreasing = TRUE),]
sort(domestic$Gross.domestic.product.2012, decreasing = TRUE)