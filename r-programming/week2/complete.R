complete <- function(directory, id = 1:332) {
    # We can avoid the loop in the previous function pollutantmean.R
    # by calling files function member of list native object.
    files <- list.files(directory)
    # Declare an empty frame
    resultframe <- data.frame(id = numeric(), nobs = numeric())
    for(i in id) {
        # Path and filename in a variable
        pathandfile <- paste(directory, "/", files[i], sep = "", collapse = NULL)
        # Working data
        rawdata <- read.csv(pathandfile, header = T)
        # The frame "indexes" for empty or NA values
        gooddata <- complete.cases(rawdata)
        # We call a temporary dataframe 
        # note: This could lead to a memory leak?
        newframe <- data.frame(id= i, nobs = nrow(rawdata[gooddata,]))
        # The function for append or += equivalent is rbind for data frames
        resultframe <- rbind(resultframe, newframe)
    }
    # There's no dinstinction on using return and sending the last sentence in R
    resultframe
}

#tests

complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)
