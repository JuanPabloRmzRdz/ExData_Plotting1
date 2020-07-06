library(dplyr)

##Read file
data<-read.table("/Users/juanpablormzrdz/Documents/RStudio Coursera/ExData_Plotting1/household_power_consumption.txt",header=TRUE,sep=";")

##Change class for Date, Time and Global_active_power columns
par(mfcol=c(1,1))
data$Date <- paste(data$Date,data$Time)
data$Date <- strptime(data$Date,"%Y-%m-%d %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)

#Build graph
plot(data$Date,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data$Date,data$Sub_metering_2,col="red")
lines(data$Date,data$Sub_metering_3,col="blue")
legend("topright",pch=95,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##Create file for the graph
dev.copy(png,file="plot3.png")
dev.off()