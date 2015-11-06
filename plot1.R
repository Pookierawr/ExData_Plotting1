#Creates and formats data
thing <- read.table("household_power_consumption.txt", header = FALSE, col.names = c("date", "time", "activepower","reactivepower","voltage","intensity","submeter1","submeter2","submeter3"), sep = ";", nrows = 2880, skip = 66637)
thing$date <- strptime(thing$date, "%d/%m/%Y")
thing$time <- strptime(thing$time, "%T")
thing$time <- sub(".* ","",thing$time)
datetime <- paste(thing$date, thing$time)
#Creates and plots png
png(filename = "plot1.png", width = 480, height = 480)
hist(thing$activepower, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()