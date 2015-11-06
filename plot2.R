#Creates and formats data
thing <- read.table("household_power_consumption.txt", header = FALSE, col.names = c("date", "time", "activepower","reactivepower","voltage","intensity","submeter1","submeter2","submeter3"), sep = ";", nrows = 2880, skip = 66637)
thing$date <- strptime(thing$date, "%d/%m/%Y")
thing$time <- strptime(thing$time, "%T")
thing$time <- sub(".* ","",thing$time)
datetime <- paste(thing$date, thing$time)
withtime <- cbind(thing,datetime)
#Creates and plots png
png(filename = "plot2.png", width = 480, height = 480)
plot(withtime$datetime, withtime$activepower, xaxt = "n", ylab = "Global Active Power (kilowatts)", type = "b")
lines(withtime$datetime, withtime$activepower)
axis(1, at = c(1,1441,2880), labels = c("Thu", "Fri", "Sat"))
dev.off()