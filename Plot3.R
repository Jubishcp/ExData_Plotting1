# Install the package if its not available
# install.packages("data.table")
setwd("C:/Users/divinity/Desktop/Coursera/Exploratory/Week1")

library(data.table)

# fread for performance
data<-fread("household_power_consumption.txt",header=TRUE,na.strings = "?")
filteredData<-data[(data$Date=="1/2/2007" | data$Date=="2/2/2007" )]


# date formating
filteredData$Date <- as.Date(filteredData$Date, format="%d/%m/%Y")
dateTime <- paste(filteredData$Date, filteredData$Time)
filteredData$DateTime <- as.POSIXct(dateTime)

with(filteredData, {
  plot(Sub_metering_1~DateTime, type="l",xlab="",
       ylab="Energy sub metering")
  lines(Sub_metering_2~DateTime, col='Red')
  lines(Sub_metering_3~DateTime, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
 
dev.copy(png, file="Plot3.png", height=480, width=480)
dev.off()