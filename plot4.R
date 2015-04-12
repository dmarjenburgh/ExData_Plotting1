## Load and subset data

fileName <- "household_power_consumption.txt"
fullDataset <- read.csv(fileName, sep=";", na.strings=c("","?"))
dataset <- subset(fullDataset, Date %in% c("1/2/2007", "2/2/2007"))

## Parse datetimes
datetime <- strptime(paste(dataset$Date, dataset$Time), "%d/%m/%Y %H:%M:%S")

## Get dataseries
globalActivePower <- dataset$Global_active_power
globalReactivePower <- dataset$Global_reactive_power
voltage <- dataset$Voltage
subMetering <- dataset[7:9]

## Plot4 Multiple plots
png(filename = "plot4.png", width = 480, height = 480)

par(mfcol = c(2, 2))
plotColors <- c("black", "red", "blue")

plot(datetime, globalActivePower, ylab = "Global Active Power", xlab = "", type = "l")

plot(datetime, subMetering[[1]], type = "l", ylab = "Energy sub metering", xlab = "", col = plotColors[1])
lines(datetime, subMetering[[2]], col = plotColors[2])
lines(datetime, subMetering[[3]], col = plotColors[3])
legend("topright", names(subMetering), col = plotColors, lty = 1, bty = "n")

plot(datetime, voltage, type = "l", ylab = "Voltage")

plot(datetime, globalReactivePower, type = "l", , ylab = "Global_reactive_power")

dev.off()
