power<-read.table(file = "household_power_consumption.txt",sep = ";",na.strings = '?',header = T, as.is = T)
selected_dates<-c("2/2/2007","1/2/2007")
power<-power[power$Date %in% selected_dates,]
power$DateTime <- strptime(paste(power$Date, power$Time, sep = " "), form = "%d/%m/%Y %H:%M:%S")


png(filename = 'plot2.png',width = 480, height = 480,units = 'px')
plot(x=power$DateTime, y=power$Global_active_power, type= 'l'
     , ylab = "Global Active Power (kilowatts)",xlab =  '')
dev.off()

