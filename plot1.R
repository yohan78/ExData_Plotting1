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

png(filename="plot1.png",width=480,height=480,units="px")
par(mfrow=c(1,1),mar=c(5,4.5,4,2))
hist(subsetdate$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()