# This file belongs to my notes about the Getting and Cleaning Data MOOC of coursera's
# Data Science specialization, particular to Reading from the Web

# First let's read the HTML code to a given website to perform webscrapping
# 1. Connect
con <- url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
# 2. Read lines
htmlCode <- readLines(con)
# 3. Close connection
close(con)
# Write the htmlCode variable
htmlCode
# Another way of doing this is by using the XML package for parsing
# Load the library
library(XML)
# Assign the URL to a variable
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
# Read the HTML
html <- htmlTreeParse(url, useInternalNodes = T)
# Getting the title of the page
xpathSApply(html, "//title", xmlValue)
# And finally getting some citations
xpathSApply(html, "//td[@class='gsc_a_c']", xmlValue)
# We can also use the httr library
library(httr)
# Using the GET command to retrieve the HTML
html2 <- GET(url)
# Transform from HTML2 to text
content2 <- content(html2, as="text")
# Parse the HTML so we can read it
parsedHtml <- htmlParse(content2, asText = T)
# And finally reading the title
xpathSApply(parsedHtml, "//title", xmlValue)
# Accessing websites with passwords
# This website requires simple login
pg1 <- GET("http://httpbin.org/basic-auth/user/passwd")
# Response 401
pg1
# Let's authenticate using httr package and the 'authenticate' command
pg2 <- GET("http://httpbin.org/basic-auth/user/passwd", authenticate("user", "passwd"))
# HTTP 200 OK
pg2
# All the components of that auth URL call
names(pg2)
# Using handles allow us to store the cookies for a given handle
# in this case we use google.com
google <- handle("https://google.com")
pg1 <- GET(handle=google, path="/")
pg2 <- GET(handle=google, path="search")