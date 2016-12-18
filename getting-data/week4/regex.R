# Regular expressions
# Regular expressions can be thought as a combinantion of literals and metacharacters
# Literals are words that match exactly
# Regular expressions consists only in literals; a match occurs if the secuence of literal occurs
# ^ metacharacter represents the start of a line
# $ metacharacter represents the end of a line
# We can list a set of characters we will accept at a given point in the match
# [Bb] [Uu] [Ss] [Hh]
# Similarly, you can specify a range of letters [a-z] or [a-zA-Z]; notice that the order doesn't matter
# ex:
# ^[09][a-zA-Z]
# When used at the beginning of a character class, the "" is also a metacharacter and indicates matching characters NOT in the
# indicated class.
# ex:
# [^?.]$
# will match the lines
# i like basketballs
# dont worry... we all die anyway!
# More Metacharacters
# "." is used to refer to any character. So
# 9.11
# matches with:
# its stupid the post 9-11 rules
# if any 9-11
# NetBios scanning ip 203.169.114.66
# Front Door 9:11:46 AM
# flood|fire
# matches with:
# this girl is on fire
# the floor is flood
# We can include any alternatives
# flood|earthquake|hurricane|coldfire
# matches with:
# Not a whole lot of hurricanes
# We do have earthquakes
# The alternatives can be also regular expressions and not only literals
# ^[Gg]ood|[Bb]ad
# matches with:
# good to hear some good news
# Good afternoon fellas
# Katie has some bad experiences
# Miss Bad news
# The use of parenthesis can help us to reach the desired regex
# ^([Gg]ood|[Bb]aad)
# in the example below, we're looking for all the lines that start
# with '[Gg]ood' or '[Bb]ad' at the beginning of the line
# so that regex will match with:
# bad habits
# Bad news
# Good morning everyone
# The questionmark indicates that the regex is optional
# note that we're escaping the character '.' so it isn't intepreted as a
# metacharacter.
# [Gg]eorge( [Ww]\.)? [Bb]ush
# matches with:
# BBC reported president George W. Bush claimed God told him to invade Irak
# I can spell better than you and george bush combined
# The * and + signs indicate repetition
# * means any number, including none of the item
# + means at least one of the item
# (.*)
# any character any number of times
# matches with:
# Hello I'm Jorge
# ()
# !"·$%&/&%$·
# (He's so old)
# Another example:
# [0,9]+ (.*)[0-9]+
# matches with:
# working as MP here 720 MP bataillion, 42nd brigade
# so say 2 or 3 number of times
# I was there like 3 or 4 times before
# It's time 4 me 2 go 2 bed
# { and } are referred to as interval quantifiers, they let us specify
# the minumum and maximum number of matches of an expression
# ex:
# [Bb]ush( +[^ ]+ +){1,5} debate
# the regex in the parenthesis denote "space, word, space"
# and the curly braces mean between one and five times
# will match with:
# Bush has historicaly win all the debates
# in my opinion, Bush doesn't need those debates
# That's what Bush supporters are doing about debate
# bush doesn't need those debates? Maybe you're right
#
# More metacharacters: and
# m,n means at least m but not more than n matches
# m means exactly m matches
# m, means at least m matches
#
#  +([a-zA-Z]+) +\1 +
# meaning: at least one space, at least one letter from a|A to z|Z
# and the repetition of the coincidence denoted by \1 and another white space
# matching:
# time for bed, night night twitter!
# blah blah blah blah
# my tattoo is so so itchy today
# I was standing all all alone against the world outside...
# hi anybody anybody at home?
# estudiando css css css... que desastrito
#
# ^s(.*)s
# sitting at starbucks
# setting up mysql and rails
# studying stuff for the exams
# stop fightihng with crackers
#
# The freediness of * can be turned off with the ?, as in
# ^s(.*?)s$
# used with  functions grep, grepl, sub, gsub

