library(dplyr)

##Read file
data<-read.table("/Users/juanpablormzrdz/Documents/RStudio Coursera/ExData_Plotting1/household_power_consumption.txt",header=TRUE,sep=";")

##Change class for Date, Time and Global_active_power columns
par(mfcol=c(1,1))
data$Date <- paste(data$Date,data$Time)
data$Date <- strptime(data$Date,"%Y-%m-%d %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)

#Build graph
par("mar"=c(3.8,4.1,1.4,2.1))
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main ="Global Active Power")

##Create file for the graph
dev.copy(png,file="plot1.png")
dev.off()
