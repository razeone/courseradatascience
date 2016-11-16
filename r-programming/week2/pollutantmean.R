pollutantmean <- function(directory, pollutant, id=1:332) {
    sumatory <- numeric()
    for(i in id){
        filename <- as.character(i)
        while(nchar(filename) < 3) {
            filename <- paste("0", filename, sep = "", collapse = NULL) 
        }
        pathandfile <- paste(directory, "/", filename, ".csv", sep = "", collapse = NULL)
        rawdata <- read.csv(pathandfile, header = T)
        stopifnot(pollutant == 'nitrate' | pollutant == 'sulfate')
        gooddata <- rawdata[complete.cases(rawdata[[pollutant]]),]
        sumatory <- c(sumatory, gooddata[[pollutant]])
    }
    result <- mean(sumatory)
    return(round(result, 3))
}

# tests
pollutantmean("specdata", "sulfate", 1:10) == 4.064
pollutantmean("specdata", "nitrate", 70:72) == 1.706
pollutantmean("specdata", "nitrate", 23) == 1.281