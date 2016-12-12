# Managing Data Frames with dplyr
# dplyr Verbs
# select: return a subset of the columns of a data frame
# filter: extract a subset of rows from a data frame based on
# logical conditions
# arrange: reorder rows of a data frame
# rename: rename variables in a data frame
# mutate: add new variables/columns or transform existing variables
# summari ze/se: generate summary statistics of different variables
# in the data frame, possibly within strate
# There's also a handy print method that prevents you from
# printing a lot of data to the console.
#
# dplyr Properties
# The first argument is a data frame.
# The subsequent arguments describe that to do with it,
# and you can refer to columns in the data frame directly
# without using the $ operator (just use the names)
# The result is a new data frame
# Data frames must be properly formatted and annotated
# for this to all be usefull.
#
# Using the tools
library(dplyr)
options(width = 105)
chicago <- readRDS("chicago.rds")
dim(chicago)
str(chicago)
names(chicago)
# Select all the columns from city to dptp
head(select(chicago, city:dptp))
# Select all the columns except for those you remove using -
head(select(chicago, -(city:dptp)))
# Doing the same with regular R functions
i <- match("city", names(chicago))
j <- match("dptp", names(chicago))
head(chicago[, -(i:j)])
# The filter function for subsetting based on particular conditions
chic.f <- filter(chicago, pm25tmean2 > 30)
head(chic.f, 10)
# You can also use several logical conditions
# For example, not just pm25tmean2 greater than 30
# but also tmpd greater than 80
chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)
head(chic.f)
# Now let's arrange the data frame with the arrange command
# and using a certain variable, in this case the date.
chicago <- arrange(chicago, date)
head(chicago)
tail(chicago)
# And here's how to do it in a descending way
chicago <- arrange(chicago, desc(date))
# Rename
# So let's rename variables by using the command rename
chicago <- rename(chicago, pm25 = pm25tmean2, dewpoint = dptp)
head(chicago)
# Mutate
# The mutate command is used to create new variables
# in this case, let's create a new variables called pm25detrend
# which is the pm25 variable minus the mean.
chicago <- mutate(chicago, pm25detrend = pm25-mean(pm25, na.rm = TRUE))
head(select(chicago, pm25, pm25detrend))
chicago <- mutate(chicago, tempcat = factor(1 * (tmpd > 80), labels = c("cold", "hot")))
hotcold <- group_by(chicago, tempcat)
hotcold
summarize(hotcold, pm25 = mean(pm25), o3 = max(o3tmean2), no2 = median(no2tmean2))
chicago <- mutate(chicago, year = as.POSIXlt(date)$year + 1900)
years <- group_by(chicago, year)
summarize(years, pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2), no2 = median(no2tmean2))
chicago %>% mutate(month = as.POSIXlt(date)$mon + 1) %>% group_by(month) %>% summarize(pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2), no2 = median(no2tmean2))
# Once you learn the "dplyr" grammar there are a few additional benefits
# dplyr can work with other data frame "backends"
# data.table for large fast tables
# SQL interface for relational databases via de DBI package