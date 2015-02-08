## This function sets up the canvas to have 4 plots for
## convenient comparision of 2-day energy consumption data
## from multivariate data perspectives.
## The plots are stored in the PNG file 480x480

plot4 <- function()
{
  ## Read data table as string, not factors.
  Data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, nrows=129600, na.strings="?", stringsAsFactors=FALSE)
  Data <- na.omit(Data)
  EnergyFeb2 <- Data[Data$Date %in% c("1/2/2007", "2/2/2007"),]
  
  ## Contantenate and convert date time string to date time and bind it
  ## as new column in the data set
  datetime <- strptime(paste(EnergyFeb2$Date,EnergyFeb2$Time), format="%d/%m/%Y %H:%M:%S")
  EnergyFeb2 <- cbind(datetime, EnergyFeb2)
  
  ## Plot the data into PNG file
  png(filename="plot4.png", width=480, height=480)
  
  ## Set up the canvas to allow 4 plots 
  par(mfcol=c(2,2))
  
  ## datetime/Global active power plot
  plot(EnergyFeb2$datetime, EnergyFeb2$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  
  ## datetime/Energy sub metering plot
  plot(EnergyFeb2$datetime, EnergyFeb2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(EnergyFeb2$datetime, EnergyFeb2$Sub_metering_2, col="red")
  lines(EnergyFeb2$datetime, EnergyFeb2$Sub_metering_3, col="blue")
  legend("topright", lwd=0.75, cex=0.75, col=c("black", "red", "blue"), bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
  ## datetime/Voltage plot
  plot(EnergyFeb2$datetime, EnergyFeb2$Voltage, type="l", xlab="datetime", ylab="Voltage")
  ## datetime/Global reactive power
  plot(EnergyFeb2$datetime, EnergyFeb2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  dev.off()
}