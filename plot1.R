plot1 <- function(){
  ## Read the file
  subset<-read.csv.sql("household_power_consumption.txt", sep=";", sql='select * from file where Date="1/2/2007" OR Date="2/2/2007"')
  png(filename="plot1.png", height=480, width=480)
  hist(subset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
  dev.off()
}