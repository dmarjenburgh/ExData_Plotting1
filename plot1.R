## Load and subset data

fileName <- "household_power_consumption.txt"
fullDataset <- read.csv(fileName, sep=";", na.strings=c("","?"))
dataset <- subset(fullDataset, Date %in% c("1/2/2007", "2/2/2007"))

## Plot1: Global Active Power histogram

png(filename = "plot1.png", width = 480, height = 480)

hist(dataset$Global_active_power,
     main = "Global Active Power",
     col = "red",
     xlab = "Global Active Power (kilowatts)")

dev.off()

