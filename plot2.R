## Load and subset data

fileName <- "household_power_consumption.txt"
fullDataset <- read.csv(fileName, sep=";", na.strings=c("","?"))
dataset <- subset(fullDataset, Date %in% c("1/2/2007", "2/2/2007"))

## Parse datetimes
datetimes <- paste(dataset$Date, dataset$Time)
dataset$DateTime = strptime(datetimes, "%d/%m/%Y %H:%M:%S")

## Plot1: Global Active Power histogram
png(filename = "plot2.png", width = 480, height = 480)
plot(dataset$DateTime,
     dataset$Global_active_power,
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type = "l")
dev.off()
