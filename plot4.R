#Reads in data from time frame
thing <- read.table("household_power_consumption.txt", header = FALSE, col.names = c("date", "time", "activepower","reactivepower","voltage","intensity","submeter1","submeter2","submeter3"), sep = ";", nrows = 2880, skip = 66637)
#Fixes time/date format and adds on a column with the combined
thing$date <- strptime(thing$date, "%d/%m/%Y")
thing$time <- strptime(thing$time, "%T")
thing$time <- sub(".* ","",thing$time)
datetime <- paste(thing$date, thing$time)
withtime <- cbind(thing,datetime)
#Creates the png for the plot
png(filename = "plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))
#Plot 1
plot(withtime$datetime, withtime$activepower, xaxt = "n", ylab = "Global Active Power (kilowatts)", type = "b")
lines(withtime$datetime, withtime$activepower)
axis(1, at = c(1,1441,2880), labels = c("Thu", "Fri", "Sat"))
#Plot 2
plot(withtime$datetime, withtime$submeter1, xaxt = "n", ylab = "Energy sub metering", type = "n")
lines(withtime$datetime, withtime$submeter1)
lines(withtime$datetime, withtime$submeter2, col = "red")
lines(withtime$datetime, withtime$submeter3, col = "blue")
axis(1, at = c(1,1441,2880), labels = c("Thu", "Fri", "Sat"))
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Plot 3
plot(withtime$datetime, withtime$voltage, xaxt = "n", xlab = "datetime", ylab = "Voltage", type = "b")
lines(withtime$datetime, withtime$voltage)
axis(1, at = c(1,1441,2880), labels = c("Thu", "Fri", "Sat"))
#Plot 4
plot(withtime$datetime, withtime$reactivepower, xaxt = "n", xlab = "datetime", ylab = "Global_reactive_power", type = "b")
lines(withtime$datetime, withtime$reactivepower)
axis(1, at = c(1,1441,2880), labels = c("Thu", "Fri", "Sat"))
dev.off()