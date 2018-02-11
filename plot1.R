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

# Plot 1

hist(new_power$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
     col = "red")

# Copy Plot 1

dev.copy(png, file = "plot1.png")
dev.off()
