# Loading best
source("best.R")
# We need two helper classes for dealing with names and ordering
# there might be a better way of doing this with apply() like functions
getTopNHospitalRankNames <- function(outcome, state_sub, num) {
    # Return the desired sorted value 
    return(state_sub[, 2][order(outcome, state_sub[, 2])[num]])
}
getHospitalRank <- function(col_num, state_sub, num) {
    # Getting the desired set & supressing NA warnings instead of cleaning? Hum!
    outcome_set <- suppressWarnings(as.numeric(state_sub[, col_num]))
    # Compute the length of the outcome_set
    outcome_len <- dim(state_sub[!is.na(outcome_set), ])[1]
    # Iy you want the "worst" then you get the last one
    if(num == "worst") {
        # Return "worst" hospital name with helper function
        getTopNHospitalRankNames(outcome_set, state_sub, outcome_len)
    }
    else if (num > outcome_len) {
        # Return NA if you have a higher "num" than the actual length
        return(NA)
    }
    else {
        # Or compute with the given value
        getTopNHospitalRankNames(outcome_set, state_sub, num)
    }
    
}
rankhospital <- function(state, outcome, num = "best") {
    # Read the data
    outcome_data <- read.csv("outcome-of-care-measures.csv", sep = ",", colClasses = "character")
    # Allowed death reasons
    valid_diseases <- c("heart attack", "heart failure", "pneumonia")
    # Validation or die
    if(!(state %in% outcome_data[,7])) {
        stop("Invalid state name")
    }
    else {
        if(!(outcome %in% valid_diseases)) {
            stop("Invalid outcome")
        }
        if(num == "best") {
            return(best(state, outcome))
        }
        # State subset
        state_sub <- outcome_data[outcome_data[,7]==state,]
        if(outcome == valid_diseases[1]) {
            name <- getHospitalRank(11, state_sub, num)
            return(name)
        }
        if(outcome == valid_diseases[2]) {
            name <- getHospitalRank(17, state_sub, num)
            return(name)
        }
        if(outcome == valid_diseases[3]) {
            name <- getHospitalRank(23, state_sub, num)
            return(name)
        }
    }
    
}

# tests
rankhospital("TX", "heart failure", 4)
rankhospital("MD", "heart attack", "worst")
rankhospital("MN", "heart attack", 5000)
# One more test to fix a bug though
rankhospital("MD", "heart attack", "best")