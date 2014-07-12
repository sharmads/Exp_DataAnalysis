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

# Plot 2
epc.subset$DOW <- format(epc.subset$Date, "%a")
epc.subset$DOW <- as.factor(epc.subset$DOW)
with(epc.subset[,c("Global_active_power","DOW")], {
    png(filename=paste(kRoot,"plot2.png"),width=480,height=480)
    plot(Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xaxt="n",xlab="")
    axis(1,c(1,1441,2880),labels=c("Thu","Fri","Sat"))
    dev.off()
  }
)
