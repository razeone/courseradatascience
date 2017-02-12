# Working with dates
d1 <- date()
d1
class(d1)
d2 <- Sys.Date()
d2
class(d2)
# Formatting dates
# %d = day as number
# %a = abbreviated weekday
# %A = unabbreviated weekday
# %m = month (00-12)
# %b = abbreviated month
# %B = unabbreviated month
# %y = 2 digit year
# %Y = four digit year
format(d2, "%a %b %d")
# Creating dates
x <- c("1jan1960", "2jan1960", "31mar1960", "30jul1960")
z <- as.Date(x, "%d%b%Y")
z
z[1] - z[2]
as.numeric(z[1] - z[2])
# Converting to Julian
weekdays(d2)
months(d2)
julian(d2)
# Lubridate
library(lubridate)
ymd("20140108")
mdy("08/04/2016")
dmy("03-04-2013")
# Dealing with times
ymd_hms("2011-08-03 10:15:03")
ymd_hms("2011-08-03 10:15:03", tz = "Pacific/Auckland")
?Sys.timezone
# Some functions have slightly different syntax
x <- dmy(c("1jan2013", "2jan2013", "31mar2013", "30jul2013"))
# Getting the day of the week
wday(x[1])
wday(x[1], label = TRUE)