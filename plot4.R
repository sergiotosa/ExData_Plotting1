plot4 <- function(){
  ## Read the file
  subset<-read.csv.sql("household_power_consumption.txt", sep=";", sql='select * from file where Date="1/2/2007" OR Date="2/2/2007"')
  date<-paste(subset$Date,subset$Time)
  time<-strptime(date, format="%d/%m/%Y %H:%M:%S")
  png(filename="plot4.png", height=480, width=480)
  par(mfcol=c(2,2))
  plot(time, subset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  plot(time, subset$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
  lines(time, subset$Sub_metering_2, type="l", col="red", xlab="", ylab="Energy sub metering")
  lines(time, subset$Sub_metering_3, type="l", col="blue", xlab="", ylab="Energy sub metering")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
  
  plot(time, subset$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  plot(time, subset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  dev.off()
}