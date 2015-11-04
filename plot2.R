
rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
rawdata$Date <- as.Date(rawdata$Date, format='%d/%m/%Y')
Feb_Data <- subset(rawdata, Date== "2007-02-01" | Date == "2007-02-02")

Feb_Data$Date_Time <- as.POSIXct(paste(as.Date(Feb_Data$Date), Feb_Data$Time))
png("plot2.png", width=480, height=480)
plot(Feb_Data$Date_Time, as.numeric(Feb_Data$Global_active_power)/1000, type = "l", ylab="Global Active Power (kilowatts)", xlab = "") 
dev.off()
