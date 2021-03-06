if(!file.exists("exdata-data-household_power_consumption.zip")) {
  temp <- tempfile()
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  a <- unzip(temp)
  unlink(temp)
}
a <- read.table(a, header=T, sep=";", na.strings = "?")

x<-a

#x$Time
x$Date<- as.Date(x$Date, format="%d/%m/%Y")
y <- x[(x$Date=="2007-02-01") | (x$Date=="2007-02-02"),]

#plot3
plot(as.POSIXct(paste(y$Date,y$Time)),y$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(as.POSIXct(paste(y$Date,y$Time)),y$Sub_metering_2,col="red")
lines(as.POSIXct(paste(y$Date,y$Time)),y$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=1, lwd=1)
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
getwd()
