#source("best.R")
# We can use practically the same function that rankall for getting the desired Hospital Name
getTopNHospitalRankNames <- function(outcome, state_sub, num) {
    # Return the desired sorted value 
    return(state_sub[, 2][order(outcome, state_sub[, 2])[num]])
}

getHospitalRankByState <- function(col_num, state_sub, num) {
    # Getting the desired set & supressing NA warnings instead of cleaning? Hum!
    outcome_set <- suppressWarnings(as.numeric(state_sub[, col_num]))
    # Compute the length of the outcome_set
    outcome_len <- dim(state_sub[!is.na(outcome_set), ])[1]
    # Iy you want the "worst" then you get the last one
    if(num == "worst") {
        # Return "worst" hospital name with helper function
        getTopNHospitalRankNames(outcome_set, state_sub, outcome_len)
    }
    else if (num == "best") {
        getTopNHospitalRankNames(outcome_set, state_sub, 1)
    }
    else if (num > outcome_len) {
        # Return NA if you have a higher "num" than the actual length
        #print(outcome_len)
        return(NA)
    }
    else {
        # Or compute with the given value
        getTopNHospitalRankNames(outcome_set, state_sub, num)
    }
}
rankall <- function(outcome, num = "best") {
    ## Read outcome data
    # Read the data
    outcome_data <- read.csv("outcome-of-care-measures.csv", sep = ",", colClasses = "character")
    # Allowed death reasons
    valid_diseases <- c("heart attack", "heart failure", "pneumonia")
    ## For each state, find the hospital of the given rank
    sorted_states <- sort(unique(outcome_data$State))
    ## Check that state and outcome are valid
    if(!(outcome %in% valid_diseases)) {
        stop("Invalid outcome")
    }
    else {
        # Create an empty vector of the "sorted_states" length
        hospital <- vector("character", length(sorted_states))
        for(i in 1:length(sorted_states)) {
            # Get the subset for the given state
            state_sub <- outcome_data[outcome_data[,7]==sorted_states[i],]
            # TO-DO: We could have a matching object with the outcome and col_num 
            # just sayin'
            if(outcome == valid_diseases[1]) {
                # And finally we assign the name to each one of the elements of the array
                hospital[i] <- getHospitalRankByState(11, state_sub, num)
            }
            if(outcome == valid_diseases[2]) {
                hospital[i] <- getHospitalRankByState(17, state_sub, num)
            }
            if(outcome == valid_diseases[3]) {
                hospital[i] <- getHospitalRankByState(23, state_sub, num)
            }
        }
        # Create the resulting data.frame
        result <- data.frame(hospital=hospital, state=sorted_states)
        return(result)
    }
}

# Tests
head(rankall("heart attack", 20), 10)
tail(rankall("pneumonia", "worst"), 3)
tail(rankall("heart failure"), 10)