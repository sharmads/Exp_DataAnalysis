# Exploratory Data Analysis -- Course Project 1
# Dharmpal Sharma on 11-JUL-2014
#

options(stringsAsFactors = FALSE)
options(scipen=100) 
options(width=100)

kRoot <- "C:/RDev/Data/Expl_Analysis/"
epc <- read.table(paste(kRoot,"household_power_consumption.txt",sep=""),sep=";",header=TRUE)
epc$Date <- as.Date(epc$Date, format="%d/%m/%Y")
epc.subset <- subset(epc, Date >= "2007-02-01" & Date <= "2007-02-02")
epc.subset$Time <- strptime(epc.subset$Time,format="%H:%M:%S")

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
