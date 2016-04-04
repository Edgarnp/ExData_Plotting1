power<-read.table(file = "household_power_consumption.txt",sep = ";",na.strings = '?',header = T, as.is = T)
selected_dates<-c("2/2/2007","1/2/2007")
power<-power[power$Date %in% selected_dates,]
power$DateTime <- strptime(paste(power$Date, power$Time, sep = " "), form = "%d/%m/%Y %H:%M:%S")


png(filename = 'plot3.png',width = 480, height = 480,units = 'px')
plot(x=power$DateTime, y=power$Sub_metering_1, ylab = "Energy sub metering",xlab =  '',pch = '')
lines(x=power$DateTime, y=power$Sub_metering_1)
lines(x=power$DateTime, y=power$Sub_metering_2, col = 'red')
lines(x=power$DateTime, y=power$Sub_metering_3, col = 'blue')
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black","red","blue"))
dev.off()
