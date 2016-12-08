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

##plot2## Creates graph of date/time vs global active power data
plot(strptime(Timestamp, "%d/%m/%Y %H:%M:%S"), selectdate$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

##copy my plot2 to a png file
dev.copy(png, file = "plot2.png")
##Cose the png device
dev.off()
