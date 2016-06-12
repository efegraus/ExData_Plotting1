# June 11,2016
#You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime()  and as.Date() functions.
#Note that in this dataset missing values are coded as ?.
# Clear everything
rm(list = ls())
# Load data
epdata <- read.delim("household_power_consumption.txt",sep=";",na.strings = "?")
# Create full date time column
epdata$dt <- paste(epdata$Date,epdata$Time)
# Make it a date/time format
epdata$dt <- as.POSIXct(epdata$dt,format = "%d/%m/%Y %H:%M:%S")
# Make date a date format
epdata$Date <- as.Date(epdata$Date,"%d/%m/%Y")
# subset the data
data_analysis <- epdata[epdata$Date == "2007-02-01" | epdata$Date == "2007-02-02",]

png(file = "plot4.png", width =480,height = 480)
par(mfrow = c(2, 2))
# 1st graph
plot(data_analysis$dt,data_analysis$Global_active_power,col="black",type = "l",ylab = "Global Active Power (kilowatts)",xlab="")
# 2nd graph
plot(data_analysis$dt,data_analysis$Voltage,xlab = "datetime",ylab="Voltage",type="l")
# 3rd graph
plot(data_analysis$dt,data_analysis$Sub_metering_1,col="black",type = "l",ylab = "Energy Sub Metering",xlab="")
lines(data_analysis$dt,data_analysis$Sub_metering_2,col="red")
lines(data_analysis$dt,data_analysis$Sub_metering_3, col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","blue","red"),lty = c(1,1))
# 4th graph
plot(data_analysis$dt,data_analysis$Global_reactive_power,xlab = "datetime",ylab="Global_reactive_power",type="l")

dev.off()

