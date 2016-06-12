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

png(file = "plot2.png", width =480,height = 480)
plot(data_analysis$dt,data_analysis$Global_active_power,col="black",type = "l",ylab = "Global Active Power (kilowatts)",xlab="")
dev.off()

