# Install the package if its not available
# install.packages("data.table")
#setwd("C:/Users/divinity/Desktop/Coursera/Exploratory/Week1")

library(data.table)

# fread for performance
data<-fread("household_power_consumption.txt",header=TRUE,na.strings = "?")

# date boundaries
filteredData<-data[(data$Date=="1/2/2007" | data$Date=="2/2/2007" )]

hist(filteredData$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")

dev.copy(png, file="Plot1.png", height=480, width=480)
dev.off()