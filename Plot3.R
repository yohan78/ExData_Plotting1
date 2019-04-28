##-- Set working Directory
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


png(filename="plot2.png",width=480,height=480,units="px")
plot(subsetdate$Time,subsetdate$Global_active_power, ylab="Global Active Power (kilowatts)",  xlab="", pch =".", type="l")
dev.off()