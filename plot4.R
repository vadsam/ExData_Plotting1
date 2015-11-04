# Load data from source file
rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
# convert the Date column values from Character to Date format
rawdata$Date <- as.Date(rawdata$Date, format='%d/%m/%Y')
# subset the data only for Feb 1 and 2 in 2007
Feb_Data <- subset(rawdata, Date== "2007-02-01" | Date == "2007-02-02")
# Add new variable to store the date time values
Feb_Data$Date_Time <- as.POSIXct(paste(as.Date(Feb_Data$Date), Feb_Data$Time))

# plot the graph and store it as png file

png("plot4.png", width=480, height=480)
# define the ows/columns in plotting space
par(mfcol = c(2, 2))
# code for plot 1
plot(Feb_Data$Date_Time, as.numeric(Feb_Data$Global_active_power), type = "l", ylab="Global Active Power (kilowatts)", xlab = "")

# code for plot 2
plot(Feb_Data$Date_Time, as.numeric(Feb_Data$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(Feb_Data$Date_Time, as.numeric(Feb_Data$Sub_metering_2), type="l", col="red")
lines(Feb_Data$Date_Time, as.numeric(Feb_Data$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=3)

# code for plot 3
plot(Feb_Data$Date_Time, as.numeric(Feb_Data$Voltage), type="l", xlab="datetime", ylab="Voltage")

# code for plot 4
plot(Feb_Data$Date_Time, as.numeric(Feb_Data$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()

