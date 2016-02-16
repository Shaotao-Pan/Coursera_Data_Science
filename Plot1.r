filename = "household_power_consumption.txt"
da1 = read.table(filename, header = T, sep = ";", na.strings = "?")
da1$Date <- as.Date(da1$Date, format="%d/%m/%Y")
da2 = subset(da1, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
# str(da2)
attach(da2)
hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
