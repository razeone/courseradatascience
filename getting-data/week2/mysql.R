# This file belongs to the 'Reading from MySQL' lecture of coursera's 
# data science specialization. 
#
# WARNING: Please do NOT run this examples from your local since this
# examples connect to a public MySQL database with data of the human
# genome.


# Connect to the corrresponding database
hg19 <- dbConnect(MySQL(), user="genome", db="hg19", host="genome-mysql.cse.ucsc.edu")
# List all tables for that db
allTables <- dbListTables(hg19)
# Get the length of the allTables variable
length(allTables)
# List the fields of specific table
dbListFields(hg19, "affyU133Plus2")
# Select count rows in that table
dbGetQuery(hg19, "select count(*) from affyU133Plus2")
# 58463
# Getting a whole table data
affyData <- dbReadTable(hg19, "affyU133Plus2")
# Let's check that the number of rows is the same as select count(*)
nrow(affyData)
# Selecting a specific subset of a table
# 1. Create query
query <- dbSendQuery(hg19, "SELECT * FROM affyU133Plus2 WHERE misMatches between 1 AND 3")
# 2. Fetch the query
affyMis <- fetch(query)
# Getting the quantiles for that subset and the 'misMatches' field
quantile(affyMis$misMatches)
# It's possible to get just the first n rows as well with the 'fetch' command
# dbClearResult is mandatory when using dbSendQuery with fetch
affyMisSmall <- fetch(query, n=10); dbClearResult(query)
# Then don't forget to disconnect from the db
dbDisconnect(hg19)

