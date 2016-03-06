pollutantmean = function(directory, pollutant, id = 1:50) {
  wd = getwd()
  newDir = paste(wd, directory, sep = "/")
  fileNames = list.files(newDir, full.names = TRUE)
  selectedDataset = data.frame()
  for (i in id) {
    selectedDataset = rbind(selectedDataset, read.csv(fileNames[i]))
  }
  if (pollutant == 'sulfate') {
    round(mean(selectedDataset$sulfate, na.rm = TRUE),3)
  } else if (pollutant == 'nitrate') {
    round(mean(selectedDataset$nitrate, na.rm = TRUE),3)
  }
}






































