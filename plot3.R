# Read data into a table and delimit by semicolon, include headers
rawData <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt",
                      header = TRUE, sep = ";", dec = ".", na.strings = "?")

# Extract a subset of the data for dates that match Feb 1st and 2nd in 2007
febData <- subset(rawData, Date == "1/2/2007" | Date == "2/2/2007")

# Change the date to the correct format
febData$Date <- as.Date(febData$Date, format = "%d/%m/%Y")
febData$Times <- as.POSIXct(paste(febData$Date, febData$Time))

# Open a png file to plot to
png("plot3.png", width = 480, height = 480)

# Create the histogram plot pictured in the example
plot(febData$Times,as.numeric(febData$Sub_metering_1), "n", xlab = "", ylab = "Energy sub metering")
points(febData$Times,as.numeric(febData$Sub_metering_1), type = "line", col = "black")
points(febData$Times,as.numeric(febData$Sub_metering_2), type = "line", col = "red")
points(febData$Times,as.numeric(febData$Sub_metering_3), type = "line", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , col = c("black", "red", "blue"), lty = c(1,1,1))

# Close the file
dev.off()
