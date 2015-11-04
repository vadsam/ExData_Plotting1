# Load data from source file
rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
# convert the Date column values from Character to Date format
rawdata$Date <- as.Date(rawdata$Date, format='%d/%m/%Y')
# subset the data only for Feb 1 and 2 in 2007
Feb_Data <- subset(rawdata, Date== "2007-02-01" | Date == "2007-02-02")
# Add new variable to store the date time values
Feb_Data$Date_Time <- as.POSIXct(paste(as.Date(Feb_Data$Date), Feb_Data$Time))

# plot the graph and store it as png file
png("plot2.png", width=480, height=480)
plot(Feb_Data$Date_Time, as.numeric(Feb_Data$Global_active_power), type = "l", ylab="Global Active Power (kilowatts)", xlab = "") 
dev.off()
