# Exploratory Data Analysis -- Course Project 1
# Dharmpal Sharma
#

options(stringsAsFactors = FALSE)
options(scipen=100) 
options(width=100)

kRoot <- "C:/RDev/Data/Expl_Analysis/"
epc <- read.table(paste(kRoot,"household_power_consumption.txt",sep=""),sep=";",header=TRUE)
epc$Date <- as.Date(epc$Date, format="%d/%m/%Y")
epc.subset <- subset(epc, Date >= "2007-02-01" & Date <= "2007-02-02")
epc.subset$Time <- strptime(epc.subset$Time,format="%H:%M:%S")

# Plot 1
epc.subset$Global_active_power <- as.numeric(epc.subset$Global_active_power)
png(filename=paste(kRoot,"plot1.png"),width=480,height=480)
hist(epc.subset$Global_active_power, col="orangered",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

# Plot 2
# This was annoying. The line plot was simple, then I spent almost an hour on
# that f&%$ing x-axis. Turns out you don't even need to calc the day of the 
# week...you wouldn't get "Sat", since that wouldn't be in the data set.
epc.subset$DOW <- format(epc.subset$Date, "%a")
epc.subset$DOW <- as.factor(epc.subset$DOW)
with(epc.subset[,c("Global_active_power","DOW")], {
    png(filename=paste(kRoot,"plot2.png"),width=480,height=480)
    plot(Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xaxt="n",xlab="")
    axis(1,c(1,1441,2880),labels=c("Thu","Fri","Sat"))
    dev.off()
  }
)


# Plot 3
with(epc.subset, {
  png(filename=paste(kRoot,"plot3.png"),width=480,height=480)
  plot(Sub_metering_1,type="l",ylab="Energy sub metering",xaxt="n",xlab="")
  lines(Sub_metering_2,type="l",col="red")
  lines(Sub_metering_3,type="l",col="blue")
  axis(1,c(1,1441,2880),labels=c("Thu","Fri","Sat"))
  legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black","red","blue"),lty=1)
  dev.off()
}
)

# Plot 4
with(epc.subset, {
  png(filename=paste(kRoot,"plot4.png"),width=480,height=480)
  par(mfrow=c(2,2))
  plot(Global_active_power,type="l",ylab="Global Active Power",xaxt="n",xlab="")
  axis(1,c(1,1441,2880),labels=c("Thu","Fri","Sat"))
  plot(Voltage,type="l",xaxt="n",xlab="datetime")
  axis(1,c(1,1441,2880),labels=c("Thu","Fri","Sat"))
  plot(Sub_metering_1,type="l",ylab="Energy sub metering",xaxt="n",xlab="")
  lines(Sub_metering_2,type="l",col="red")
  lines(Sub_metering_3,type="l",col="blue")
  axis(1,c(1,1441,2880),labels=c("Thu","Fri","Sat"))
  legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black","red","blue"),lty=1,border=FALSE)
  plot(Global_reactive_power,type="l",ylab="Energy sub metering",xaxt="n",xlab="datetime")
  axis(1,c(1,1441,2880),labels=c("Thu","Fri","Sat"))
  dev.off()
}
)
