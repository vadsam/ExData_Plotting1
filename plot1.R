
rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
rawdata$Date <- as.Date(rawdata$Date, format='%d/%m/%Y')
Feb_Data <- subset(rawdata, Date== "2007-02-01" | Date == "2007-02-02")

png("plot1.png", width=480, height=480)
hist(as.numeric(Feb_Data$Global_active_power)/1000, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()