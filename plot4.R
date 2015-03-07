#Exploratory Data Analysis - Assignement 1
#
# plot.R plots a png file called plot1.png
# downloadlink: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
setwd("./")
f = "./household_power_consumption.zip"
if (!file.exists(f)) {
  d = download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = f, method = "curl")
}
g = "./household_power_consumption.txt"
if (!file.exists(g)) {
  unzip(f, exdir="./")
}
data = read.csv("./household_power_consumption.txt", header=T, 
                sep=";", stringsAsFactors=F, na.strings="?",
                colClasses=c("character", "character", "numeric",
                             "numeric", "numeric", "numeric",
                             "numeric", "numeric", "numeric"))

# Cutting out used data: 
data$Date = strptime(paste(data$Date, data$Time),format="%d/%m/%Y %H:%M:%S")
startday = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S")
endday = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S")
data = data[data$Date >= startday & data$Date <= endday, ]
#plotting:
png(filename="plot4.png", width=480, height=480)

par(mfcol=c(2,2))
plot(data$Date, data$Global_active_power, type="l", xlab="",ylab="Global Active Power")
plot(data$Date, data$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
lines(data$Date, data$Sub_metering_2, col="red")
lines(data$Date, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"), lwd=par("lwd"), bty="n")
plot(data$Date, data$Voltage, type="l",xlab="datetime", ylab="Voltage")
plot(data$Date, data$Global_reactive_power, type="l",xlab="datetime", ylab="Global_reactive_power")
dev.off()

