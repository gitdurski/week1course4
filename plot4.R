library(dplyr)
library(data.table)
library(shiny)
#Reads in data from file
fh <- read.table("H:/DATA_SCIENCE/Coursera/course4/Week1/household_power_consumption.txt", sep =";",header = TRUE,na.strings="?")
#subset the dataset
selectdate = fh[fh$Date %in% c("1/2/2007","2/2/2007"),]
##converting factor to cheracter to numeric
Global_active_power = as.numeric(as.character(fh$Global_active_power))
##converting Date and time variables to Date/time classes
Timestamp <-paste(selectdate$Date, selectdate$Time)
##making the graph

##plot4##Sets graphing parameters so that 4 graphs are drawn by column
par(mfcol = c(2,2))
# Creates graph of date/time vs global active power data
plot(strptime(Timestamp, "%d/%m/%Y %H:%M:%S"), selectdate$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power(kilowatts)")
#Creates 2nd graph in column 1 
#Creates plot of date/time v Sub metering 1 data
plot(strptime(Timestamp, "%d/%m/%Y %H:%M:%S"), selectdate$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
#Adds line graph for date/time v Sub metering 2 data in red
lines(strptime(Timestamp, "%d/%m/%Y %H:%M:%S"), selectdate$Sub_metering_2, type = "l", col = "red" )
#Adds line graph for date/time v Sub metering 3 data in blue
lines(strptime(Timestamp, "%d/%m/%Y %H:%M:%S"), selectdate$Sub_metering_3, type = "l", col = "blue" )
#Adds legend to graph
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Creates first graph in column 2
#This graphs date/time v Voltage
plot(strptime(Timestamp, "%d/%m/%Y %H:%M:%S"), selectdate$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")
#Creates second graph in column 2
#This plots datetime v global reactive power
plot(strptime(Timestamp, "%d/%m/%Y %H:%M:%S"), selectdate$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")

##copy my plot4 to a png file
dev.copy(png, file = "plot4.png")
##Cose the png device
dev.off()
