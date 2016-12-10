# Lecture: Summarizing Data
# Create dir and download the given CSV
# Some shortcuts for common tasks in R
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
if(!file.exists("./data")){dir.create("./data")}
download.file(fileUrl, destfile = "./data/restaurants.csv", method = "curl")
restData <- read.csv("./data/restaurants.csv")
# The same here for reading data from csv
head(restData, n = 3)
tail(restData, n = 3)
summary(restData)
# More in depth information
str(restData)
# Quantiles of quantitavies variables
quantile(restData$councilDistrict, na.rm = T)
quantile(restData$councilDistrict, probs = c(0.5,0.75,0.9))
# Make tables
# Shows specific variables info
table(restData$zipCode, useNA = "ifany")
# two dimensional tables
# useful
table(restData$councilDistrict, restData$zipCode)
# Check for missing values
sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(restData$zipCode > 0)
# Row and column sums
colSums(is.na(restData))
# No missing values are here
all(colSums(is.na(restData))==0)
# Values with specific characteristics
# Here you get the number of coincidences
table(restData$zipCode %in% c("21212"))
table(restData$zipCode %in% c("21212", "21213"))
# You can also get the values by:
restData[restData$zipCode %in% c("21212", "21213"),]
# Cross tabs
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)
# In this case we're telling to R that we want to see
# Freq variable in the table cross by Gender and Admit variables
xt <- xtabs(Freq ~ Gender + Admit, data = DF)
xt
# Flat tables
warpbreaks$replicate <- rep(1:9, len = 54)
# In this case we're crossing the table through the breaks variable
# and crossed by all the other variables: 'wool', 'tension', 'replicate'
xt = xtabs(breaks ~., data = warpbreaks)
xt
# Summarize the data
ftable(xt)
# Size of a data set
fakeData = rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData), units = "Mb")