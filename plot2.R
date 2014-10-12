
constructPlot <- function()
{
  
  #Reading the dataset
  dataSet <-  read.table('C:/Users/aramalingam/Desktop/exdata-data-household_power_consumption/household_power_consumption.txt',sep =";",header = T)
  
  
  #subsetting data to include only things we want
  subSet1 <-dataSet[dataSet$Date == "1/2/2007",]
  subSet2 <-dataSet[dataSet$Date == "2/2/2007",]
  
  
  #This is the final data set we want to work with
  finalData = rbind(subSet1,subSet2)
  
  
  #Converting the third column from character to numeric  
  finalData[,3]<-as.numeric(as.character(finalData[,3]))  
  
  
  #Creating a new column which combines the Day and the Time columns 
  finalData$fDayTime <- strptime(paste(finalData$Date, finalData$Time, sep = ' '), format = "%d/%m/%Y %H:%M:%S")
  
  #Generating a plot
  plot(finalData$fDayTime, finalData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  
  
  
  #Creating a PNG file to store the output data
  dev.copy(png,file="plot2.png")
  dev.off()
  
}
