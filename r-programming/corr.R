source("complete.R")

corr <- function(directory, threshold = 0) {
    
    # There's a shortcut for ls and retrieve the directories
    if(grep("specdata", directory) == 1) {
        directory <- ("./specdata/")
    }
    # Get the completedata
    completedata <- complete("specdata", 1:332)
    nobs <- completedata$nobs
    # Filtering on threshold
    ids <- completedata$id[nobs > threshold]
    # Size of the vector
    idsize <- length(ids)
    
    corvect <- rep(0, idsize)
    # find all files in the specdata folder
    files <- as.character( list.files(directory) )
    filespaths <- paste(directory, files, sep="")
    j <- 1
    for(i in ids) {
        curfile <- read.csv(filespaths[i], header=T, sep=",")
        corvect[j] <- cor(curfile$sulfate, curfile$nitrate, use="complete.obs")
        j <- j + 1
    }
    #result <- corr_vector
    #return(result)   
    # return(round(corvect, 4))
    corvect
}

# tests
cr <- corr("specdata", 150)
head(cr)
summary(cr)
cr <- corr("specdata", 400)
head(cr)
summary(cr)
cr <- corr("specdata", 5000)
summary(cr)
length(cr)
cr <- corr("specdata")
summary(cr)
length(cr)
