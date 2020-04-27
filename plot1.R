# Read data into a table and delimit by semicolon, include headers
rawData <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt",
                      header = TRUE, sep = ";", dec = ".", na.strings = "?")

# Extract a subset of the data for dates that match Feb 1st and 2nd in 2007
febData <- subset(rawData, Date == "1/2/2007" | Date == "2/2/2007")

# Open a png file to plot to
png("plot1.png", width = 480, height = 480)

# Create the histogram plot pictured in the example
hist(as.numeric(febData$Global_active_power), col="red", xlab="Global Active Power (kilowatts)",
     main = "Global Active Power")

# Close the file
dev.off()
