# Load data from source file
rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
# convert the Date column values from Character to Date format
rawdata$Date <- as.Date(rawdata$Date, format='%d/%m/%Y')
# subset the data only for Feb 1 and 2 in 2007
Feb_Data <- subset(rawdata, Date== "2007-02-01" | Date == "2007-02-02")

# plot the histogram and store it as png
png("plot1.png", width=480, height=480)
hist(as.numeric(Feb_Data$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()