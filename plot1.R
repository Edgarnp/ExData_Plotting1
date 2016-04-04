power<-read.table(file = "household_power_consumption.txt",sep = ";",na.strings = '?',header = T, as.is = T)
selected_dates<-c("2/2/2007","1/2/2007")
power<-power[power$Date %in% selected_dates,]

png(filename = 'plot1.png',width = 480, height = 480,units = 'px')
hist(power$Global_active_power, col = "red"
     ,xlab = "Global Active Power (kilowatts)"
     , main = "Global Active Power")
dev.off()