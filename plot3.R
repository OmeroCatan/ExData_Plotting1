# Set Working Directory

setwd("C:/Users/omero_000/Desktop/DataScience/ExploratoryDataAnalysis")
getwd()

# Read Data Table

power <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Convert Dates using as.date()

power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

# Subset for Dates from 2007-02-01 to 2007-02-02

new_power <- subset(power, subset = Date <= "2007-02-02" & Date >= "2007-02-01")

# Convert Date & Time

new_power$DateTime <- strptime(paste(new_power$Date, new_power$Time), "%Y-%m-%d %H:%M:%S")
new_power$DateTime <- as.POSIXct(new_power$DateTime)

# Plot 3

plot(new_power$Sub_metering_1 ~ new_power$DateTime, type = "l", xlab = "",
     ylab = "Energy sub metering")

# Add additional Lines

lines(new_power$Sub_metering_2 ~ new_power$DateTime, col = "Red")
lines(new_power$Sub_metering_3 ~ new_power$DateTime, col = "Blue")

# Add Legend

legend("topright", lty = 1, col = c("Black", "Red", "Blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Copy Plot 3

dev.copy(png, file = "plot3.png")
dev.off()
