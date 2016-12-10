# This file is part of my notes on 
# First example of subsetting and assigning
set.seed(13435)
X <- data.frame("var1" = sample(1:5), "var2" = sample(6:10), "var3" = sample(11:15))
X <- X[sample(1:5),]; X$var2[c(1,3)] = NA
X

# Getting one single column
# Using index
X[,1]
# Using variable name
X[,"var1"]
# Subsetting using column and row
# The first two rows of the column 'var2'
X[1:2, "var2"]
# Subset using logical operators
# AND
X[(X$var1 <= 3 & X$var3 > 11),]
# OR
X[(X$var1 <= 3 | X$var3 > 15),]
# Dealing with missing values
X[which(X$var2 > 8),]
# Sorting (by default ascending)
sort(X$var1)

# Sort descending
sort(X$var1, decreasing = TRUE)
# NA at the end
sort(X$var2, na.last = TRUE)

# Ordering
# Order a data frame by a particular variable
X[order(X$var1),]
# Ordering with several variables
# Sort the first value and then if there're several values that are the same,
# then sort based on the second
X[order(X$var2, X$var3),]
# Ordering with plyr
library(plyr)
arrange(X,var1)
arrange(X, desc(var1))

# Adding rows and columns
X$var4 <- rnorm(5)
X
# Using cbind
var5 <- rnorm(5)
Y <- cbind(X, var5)
Y 