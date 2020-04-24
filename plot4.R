#PLOT 4

setwd("C:/Users/TW/Desktop/Coursera/4_Week1_Assignment/ExData_Plotting1/")

#Reading, naming and subsetting power consumption data
consumption <- read.table("household_power_consumption.txt",sep=";")
names(consumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
sub_consumption <- subset(consumption,consumption$Date=="1/2/2007" | consumption$Date =="2/2/2007")

# Transforming Date and Time
sub_consumption$Date <- as.Date(sub_consumption$Date, format="%d/%m/%Y")
sub_consumption$Time <- strptime(sub_consumption$Time, format="%H:%M:%S")
sub_consumption[1:1440,"Time"] <- format(sub_consumption[1:1440,"Time"],"2007-02-01 %H:%M:%S")
sub_consumption[1441:2880,"Time"] <- format(sub_consumption[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# Plot with four graphs
par(mfrow=c(2,2))

# Plot functions
with(sub_consumption,{
        plot(sub_consumption$Time,as.numeric(as.character(sub_consumption$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
        plot(sub_consumption$Time,as.numeric(as.character(sub_consumption$Voltage)), type="l",xlab="datetime",ylab="Voltage")
        plot(sub_consumption$Time,sub_consumption$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering", ylim=c(0,40))
                with(sub_consumption,lines(Time,as.numeric(as.character(Sub_metering_1))))
                with(sub_consumption,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
                with(sub_consumption,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
                legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
        plot(sub_consumption$Time,as.numeric(as.character(sub_consumption$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

#Copy plot to a PNG file
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()