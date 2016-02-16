filename = "household_power_consumption.txt"
da1 = read.table(filename, header = T, sep = ";", na.strings = "?")
da1$Date <- as.Date(da1$Date, format="%d/%m/%Y")
da2 = subset(da1, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(da2$Date), as.character(da2$Time))
da2$Datetime <- as.POSIXct(datetime)
plot(Global_active_power ~Datetime,data = da2, xlab = "",ylab = "Global Active Power (kilowatts)", type = "l")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
