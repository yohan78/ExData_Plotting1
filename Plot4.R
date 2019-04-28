#-- Set working Directory
setwd("C:\\Users\\Yohan\\Pictures\\Yohan\\Data sciece\\Exploratory data analisis\\Semana1\\Course Project 1\\exdata_data_household_power_consumption")
getwd()


#Activate library
library("data.table")
#Create a variable with the data

file <- "household_power_consumption.txt"
ReadData <- read.table(file, header = T, sep = ";", na.strings = "?")

#Subset Dates
subsetdate <- ReadData[ReadData$Date %in% c("1/2/2007","2/2/2007"),]

# to prevent scientific notation check variables are numeric

# > class(ReadData$Voltage)
# [1] "numeric"
# > class(subsetdate$Voltage)
# [1] "numeric"
# > class(ReadData$Global_active_power)
# [1] "numeric"
# > class(ReadData$Global_reactive_power)
# [1] "numeric"
# > class(ReadData$Sub_metering_1)
# [1] "numeric"

# Convert Data
subsetdate$Date<-as.Date(subsetdate$Date, format = "%d/%m/%Y")


#Convert Time and paste Date and Time
#%F = Equivalent to %Y-%m-%d (the ISO 8601 date format).
#%T = Equivalent to %H:%M:%S.
subsetdate$Time<-strptime(paste(subsetdate$Date,subsetdate$Time),"%F %T")

# Create plots

png(filename="plot4.png",width=480,height=480,units="px")
par(mfrow=c(2,2),mar=c(4.5,5,2,2))
#--First Plot
plot(subsetdate$Time,subsetdate$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", pch =".", type="l")

#--Second Plot
plot(subsetdate$Time,subsetdate$Voltage, ylab="Voltage", xlab="datetime", type="l")

#--Third plot
plot(subsetdate$Time,subsetdate$Sub_metering_1,ylab="Energy sub metering", xlab="", type="l", col="black")
points(subsetdate$Time,subsetdate$Sub_metering_2, col="red", type="l")
points(subsetdate$Time,subsetdate$Sub_metering_3, col="blue", type="l")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=names(subsetdate[,7:9]), bty="n")

#--Fourth plot
plot(subsetdate$Time,subsetdate$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")
dev.off()
