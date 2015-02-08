## This function plots express the energy consumption during
## two days Feb 1st and Feb 2nd in 2007, in terms of Global
## active power.
## The plot is stored in the PNG file 480x480

plot2 <- function()
{
  ## Read data table as string, not factors.
  ## (60 mins/h * 24 hr/day * 90 days) = 129600 samples
  Data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, nrows=129600, na.strings="?", stringsAsFactors=FALSE)
  Data <- na.omit(Data)
  EnergyFeb2 <- Data[Data$Date %in% c("1/2/2007", "2/2/2007"),]
  
  ## Contantenate and convert date time string to date time and bind it
  ## as new column in the data set
  datetime <- strptime(paste(EnergyFeb2$Date,EnergyFeb2$Time), format="%d/%m/%Y %H:%M:%S")
  EnergyFeb2 <- cbind(datetime, EnergyFeb2)
  
  ## Plot the data into PNG file
  png(filename="plot2.png", width=480, height=480)
  plot(EnergyFeb2$datetime, EnergyFeb2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()  
}