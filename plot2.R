plot2 <- function(){
  ## Read the file
  subset<-read.csv.sql("household_power_consumption.txt", sep=";", sql='select * from file where Date="1/2/2007" OR Date="2/2/2007"')
  date<-paste(subset$Date,subset$Time)
  time<-strptime(date, format="%d/%m/%Y %H:%M:%S")
  png(filename="plot2.png", height=480, width=480)
  plot(time, subset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()
}