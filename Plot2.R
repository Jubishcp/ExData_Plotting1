# Install the package if its not available
# install.packages("data.table")
#setwd("C:/Users/divinity/Desktop/Coursera/Exploratory/Week1")

library(data.table)

# fread for performance
data<-fread("household_power_consumption.txt",header=TRUE,na.strings = "?")
filteredData<-data[(data$Date=="1/2/2007" | data$Date=="2/2/2007" )]

# date formating
filteredData$Date <- as.Date(filteredData$Date, format="%d/%m/%Y")
dateTime <- paste(filteredData$Date, filteredData$Time)
filteredData$DateTime <- as.POSIXct(dateTime)

plot(filteredData$Global_active_power~filteredData$DateTime, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="Plot2.png", height=480, width=480)
dev.off()