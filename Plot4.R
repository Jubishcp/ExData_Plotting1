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

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(filteredData, {
  plot(Global_active_power~DateTime, type="l", 
       ylab="Global Active Power", xlab="" )
  plot(Voltage~DateTime, type="l", 
       ylab="Voltage", xlab="datetime" )
  plot(Sub_metering_1~DateTime, type="l", 
       ylab="Energy sub metering", xlab="" )
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.6)
  plot(Global_reactive_power~DateTime, type="l", 
       ylab="Global_reactive_power",xlab="datetime" )
})

dev.copy(png, file="Plot4.png", height=480, width=480)
dev.off()