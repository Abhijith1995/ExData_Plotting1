
constructPlot <- function()
{
  
  #Reading the dataset
  dataSet <-  read.table('C:/Users/aramalingam/Desktop/exdata-data-household_power_consumption/household_power_consumption.txt',sep =";",header = T)
  
  
  #subsetting data to include only things we want
  subSet1 <-dataSet[dataSet$Date == "1/2/2007",]
  subSet2 <-dataSet[dataSet$Date == "2/2/2007",]
  
  
  #This is the final data set we want to work with
  finalData = rbind(subSet1,subSet2)
  
  
  #Converting the  column from character to numeric  
 # finalData[,c(3:9)] <- apply(finalData[,3][,c(3:9)], 2, function(x) as.numeric(x))
  
  
  
  #Creating a new column which combines the Day and the Time columns 
  finalData$dayTime <- strptime(paste(finalData$Date, finalData$Time, sep = ' '), format = "%d/%m/%Y %H:%M:%S")
  
  

  
  
  #Generating a plot
  plot(finalData$dayTime, finalData$Sub_metering_1, type = "n", xlab="", ylab = "Energy sub metering")
  lines(finalData$dayTime, finalData$Sub_metering_1)
  lines(finalData$dayTime, finalData$Sub_metering_2, col = "red")
  lines(finalData$dayTime, finalData$Sub_metering_3, col = "blue")
  
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1,1))
  
  
  
  #Creating a PNG file to store the output data
  dev.copy(png,file="plot3.png")
  dev.off()
  
}
