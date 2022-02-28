setwd("./Coursera")
txt_data<- read.csv("household_power_consumption.txt",header=TRUE, stringsAsFactors=FALSE, sep=';',na.strings="?",nrows=2075259)
sub_data<- subset(txt_data, txt_data$Date=="1/2/2007" | txt_data$Date=="2/2/2007")

dt <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap<-as.numeric(sub_data$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dt, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()