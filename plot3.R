## Load and subset data

fileName <- "household_power_consumption.txt"
fullDataset <- read.csv(fileName, sep=";", na.strings=c("","?"))
dataset <- subset(fullDataset, Date %in% c("1/2/2007", "2/2/2007"))

## Parse datetimes
datetimes <- paste(dataset$Date, dataset$Time)
dataset$DateTime = strptime(datetimes, "%d/%m/%Y %H:%M:%S")

## Plot3: Energy sub metering
png(filename = "plot3.png", width = 480, height = 480)

plot(dataset$DateTime,
     dataset$Subset_metering_1,
     type = "n",
     ylab = "Energy sub metering",
     xlab = "")

# Add 3 sub metering categories separately with different colors
plotColors <- c("black", "red", "blue")
points(dataset$DateTime, dataset$Sub_metering_1, type = "l", col = plotColors[1])
points(dataset$DateTime, dataset$Sub_metering_2, type = "l", col = plotColors[2])
points(dataset$DateTime, dataset$Sub_metering_3, type = "l", col = plotColors[3])

# Add legend
legend("topright", names(dataset[7:9]), lty = 1, col = plotColors)

dev.off()

