power<-read.table(file = "household_power_consumption.txt",sep = ";",na.strings = '?',header = T, as.is = T)
selected_dates<-c("2/2/2007","1/2/2007")
power<-power[power$Date %in% selected_dates,]
power$DateTime <- strptime(paste(power$Date, power$Time, sep = " "), form = "%d/%m/%Y %H:%M:%S")


png(filename = 'plot4.png',width = 480, height = 480,units = 'px')
par(mfrow= c(2,2))
with(power, {
    #Plot (1,1)
    plot(x=power$DateTime, y=power$Global_active_power, type = 'l'
         , ylab = "Global Active Power (kilowatts)",xlab =  '')
        
    #Plot (1,2)
    plot(x=DateTime, y=Voltage, pch = '', ylab = "Voltage", type = 'l')
    
    #Plot (2,1)
    plot(x=power$DateTime, y=power$Sub_metering_1, type = 'l'
         , ylab = "Energy sub metering",xlab =  '',pch = '')
    lines(x=power$DateTime, y=power$Sub_metering_2, col = 'red')
    lines(x=power$DateTime, y=power$Sub_metering_3, col = 'blue')
    legend("topright"
           , legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")
           , lty = c(1,1,1), col = c("black","red","blue"), bty = "n")
    
    #Plot (2,2)
    plot(x=DateTime, y = Global_reactive_power, type = 'l')
  
})
dev.off()
