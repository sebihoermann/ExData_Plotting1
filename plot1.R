##Exploratory Data Analysis - Assignment 1
##
## plot.R plots a png file called plot1.png
# downloadlink: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
setwd("./")
f = "./household_power_consumption.zip"
if (!file.exists(f)) {
  d = download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = f, method = "curl")
}
unzip(f, exdir="./")
data = read.csv("./household_power_consumption.txt", header=T, 
                sep=";", stringsAsFactors=F, na.strings="?",
                colClasses=c("character", "character", "numeric",
                             "numeric", "numeric", "numeric",
                             "numeric", "numeric", "numeric"))

## Cutting out used data:
data$Date = as.Date(data$Date, format="%d/%m/%Y")
startday = as.Date("01/02/2007", format="%d/%m/%Y")
endday = as.Date("02/02/2007", format="%d/%m/%Y")
data = data[data$Date >= startday & data$Date <= endday,]
## Creating the plot
png(filename="plot1.png", width=480, height=480)
hist(data$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", col="red")
dev.off()

