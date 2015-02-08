## The following function reads in energy consumption data from
## UC Irvin Machine Learning data set to plot a histogram of the 
## Global_active_power for the 2nd day of February 2007

plot1 <- function()
{
  ## Read data table as string, not factors.
  ## (60 mins/h * 24 hr/day * 90 days) = 129600 samples
  Data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, nrows=129600, na.strings="?", stringsAsFactors=FALSE)
  Data <- na.omit(Data)
  EnergyFeb2 <- Data[Data$Date %in% c("1/2/2007", "2/2/2007"),]
    
  ## Plot the data into PNG file
  png(filename="plot1.png", width=480, height=480)
  hist(as.numeric(EnergyFeb2$Global_active_power), breaks=12, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
  dev.off()
}