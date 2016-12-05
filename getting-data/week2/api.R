# This file is part of my notes on the Getting and Cleaning Data MOOC
# In particular for the Reading from APIs for the week 2

# Accessing Twitter from R
# WARNING: This examples cover the Twitter API 1.1 and actually a deprecated version
myApp <- oauth_app("twitter", "yourConsumerKeyHere", "yourConsumerSecretHere")
sig <- sign_oauth1.0(myapp, token = "yourTokenHere", token_secret = "yourTokenSecretHere")
homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)
# Converting the JSON object
json1 <- content(homeTL)
json2 <- jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]