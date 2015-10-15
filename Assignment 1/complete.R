
complete = function(directory, id = 1:50) {
  wd = getwd()
  newDir = paste(wd, directory, sep = "/")
  fileNames = list.files(newDir, full.names = TRUE)
  selectedDataset = data.frame()
  completeCases = data.frame()
  nobs = data.frame();
  for (i in id) { 
    selectedDataset = (read.csv(fileNames[i],header=TRUE))
    nobs = sum(complete.cases(selectedDataset))
    completeCases = rbind(completeCases, data.frame(i,nobs))
  }
  completeCases
}

