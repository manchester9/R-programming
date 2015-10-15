
corr <- function(directory, threshold = 0) {
  source("complete.R")
  wd = getwd()
  newDir = paste(wd, directory, sep = "/")
  completeCases = complete(directory)
  AboveThreshold = completeCases[completeCases$nobs > threshold,1]
  fileNames = list.files(newDir, full.names = TRUE)
  correlations = rep(NA,length(AboveThreshold))
  for (i in AboveThreshold) {
    fileData = (read.csv(fileNames[i]))
    completeCases = complete.cases(fileData)
    validSulfate = fileData[completeCases, 2]
    validNitrate = fileData[completeCases, 3]
    correlations[i] = cor(x = validSulfate, y = validNitrate)
}
  correlations = correlations[complete.cases(correlations)]
}


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

cr <- corr("specdata")
summary(cr)


