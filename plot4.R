setwd("./Coursera")
txt_data<- read.csv("household_power_consumption.txt",header=TRUE, stringsAsFactors=FALSE, sep=';',na.strings="?",nrows=2075259)
sub_data<- subset(txt_data, txt_data$Date=="1/2/2007" | txt_data$Date=="2/2/2007")

dt<- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap<- as.numeric(sub_data$Global_active_power)
grp<- as.numeric(sub_data$Global_reactive_power)
smt1<- as.numeric(sub_data$Sub_metering_1)
smt2<- as.numeric(sub_data$Sub_metering_2)
smt3<- as.numeric(sub_data$Sub_metering_3)
volt<- as.numeric(sub_data$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2)) 

plot(dt, gap, type="l", xlab="", ylab="Global Active Power")

plot(dt, volt, type="l", xlab="datetime", ylab="Voltage")

plot(dt, smt1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, smt2, type="l", col="red")
lines(dt, smt3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

plot(dt, grp, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()