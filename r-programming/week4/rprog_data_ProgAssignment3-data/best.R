# We need another function to avoid writting, write less is better
getBestHospitalName <- function(col_num, state_sub) {
    # Getting the desired set & supressing NA warnings instead of cleaning? Hum!
    outcome_set <- suppressWarnings(as.numeric(state_sub[, col_num]))
    # Getting  the min value
    min <- min(outcome_set, na.rm=T)
    # Getting an index for that value
    min_index <- which(outcome_set == min)
    # And getting the corresponding hospital name, sorting because ties
    hospital_name <- sort(state_sub[min_index, 2])
    # Return alphabeticaly the first
    hospital_name[1]
}
best <- function(state, outcome) {
    # Read the data
    outcome_data <- read.csv("outcome-of-care-measures.csv", sep = ",", colClasses = "character")
    # Allowed death reasons
    valid_diseases <- c("heart attack", "heart failure", "pneumonia")
    # Validation or die
    if(!(state %in% outcome_data[,7])) {
        stop("Invalid state name")
    }
    else {
        # Validate or die
        if(!(outcome %in% valid_diseases)) {
            stop("Invalid outcome")
        }
        # State subset
        state_sub <- outcome_data[outcome_data[,7]==state,]
        if(outcome == valid_diseases[1]) {
            name <- getBestHospitalName(11, state_sub)
            return(name)
        }
        if(outcome == valid_diseases[2]) {
            name <- getBestHospitalName(17, state_sub)
            return(name)
        }
        if(outcome == valid_diseases[3]) {
            name <- getBestHospitalName(23, state_sub)
            return(name)
        }
    }
}

# Tests
best("TX", "heart attack")
best("TX", "heart failure")
best("MD", "heart attack")
best("MD", "pneumonia")
# Comment the tests that fails since make noise 
# when loading the function.
#best("BB", "heart attack")
#best("NY", "hert attack")