
rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
rawdata$Date <- as.Date(rawdata$Date, format='%d/%m/%Y')
Feb_Data <- subset(rawdata, Date== "2007-02-01" | Date == "2007-02-02")

Feb_Data$Date_Time <- as.POSIXct(paste(as.Date(Feb_Data$Date), Feb_Data$Time))

png("plot3.png", width=480, height=480)
plot( Feb_Data$Date_Time, as.numeric(Feb_Data$Sub_metering_1), type="l", ylab="Energy Sub metering", xlab="")
lines(Feb_Data$Date_Time, as.numeric(Feb_Data$Sub_metering_2), type="l", col="red")
lines(Feb_Data$Date_Time, as.numeric(Feb_Data$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=3)
dev.off()