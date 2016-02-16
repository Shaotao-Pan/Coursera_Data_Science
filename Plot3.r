filename = "household_power_consumption.txt"
da1 = read.table(filename, header = T, sep = ";", na.strings = "?")
da1$Date <- as.Date(da1$Date, format="%d/%m/%Y")
da2 = subset(da1, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(da2$Date), as.character(da2$Time))
da2$Datetime <- as.POSIXct(datetime)

attach(da2)
plot(Datetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(Datetime, Sub_metering_2, type="l", col="red")
lines(Datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()