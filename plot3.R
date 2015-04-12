## Load and subset data

fileName <- "household_power_consumption.txt"
fullDataset <- read.csv(fileName, sep=";", na.strings=c("","?"))
dataset <- subset(fullDataset, Date %in% c("1/2/2007", "2/2/2007"))

## Parse datetimes
datetime <- strptime(paste(dataset$Date, dataset$Time), "%d/%m/%Y %H:%M:%S")

## Get sub metering data
subMetering <- dataset[7:9]

## Plot3: Energy sub metering
png(filename = "plot3.png", width = 480, height = 480)

plot(datetime,
     subMetering[[1]],
     type = "n",
     ylab = "Energy sub metering",
     xlab = "")

# Add 3 sub metering categories separately with different colors
plotColors <- c("black", "red", "blue")
points(datetime, subMetering[[1]], type = "l", col = plotColors[1])
points(datetime, subMetering[[2]], type = "l", col = plotColors[2])
points(datetime, subMetering[[3]], type = "l", col = plotColors[3])

# Add legend
legend("topright", names(subMetering), lty = 1, col = plotColors)

dev.off()
