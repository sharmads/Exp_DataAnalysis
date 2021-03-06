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

# Plot 1
epc.subset$Global_active_power <- as.numeric(epc.subset$Global_active_power)
png(filename=paste(kRoot,"plot1.png"),width=480,height=480)
hist(epc.subset$Global_active_power, col="orangered",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
