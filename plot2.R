#PLOT 2

setwd("C:/Users/TW/Desktop/Coursera/4_Week1_Assignment/ExData_Plotting1/")

#Reading, naming and subsetting power consumption data
consumption <- read.table("household_power_consumption.txt",sep=";")
names(consumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
sub_consumption <- subset(consumption,consumption$Date=="1/2/2007" | consumption$Date =="2/2/2007")

# Transforming Date and Time 
datetime <- strptime(paste(sub_consumption$Date, sub_consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Plot function
plot(datetime, as.numeric(as.character(sub_consumption$Global_active_power)), type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Copy plot to a PNG file
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
