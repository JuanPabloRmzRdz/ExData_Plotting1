library(dplyr)

##Read file
data<-read.table("/Users/juanpablormzrdz/Documents/RStudio Coursera/ExData_Plotting1/household_power_consumption.txt",header=TRUE,sep=";")

##Change class for Date, Time and Global_active_power columns
par(mfcol=c(1,1))
data$Date <- paste(data$Date,data$Time)
data$Date <- strptime(data$Date,"%Y-%m-%d %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)

#Build graph
plot(data$Date,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

##Create file for the graph
dev.copy(png,file="plot2.png")
dev.off()

