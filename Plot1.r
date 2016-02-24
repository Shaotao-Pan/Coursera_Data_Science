# Plot 1
# read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset data set. Collapse the Emission by the year
NEI_aggrgt <- aggregate(Emissions~year, NEI, sum)
with(NEI_aggrgt,barplot(Emissions/10^6, main = "PM2.5 total emission from 1999 to 2008", names.arg=NEI_aggrgt$year,xlab="Year",
                        ylab="PM2.5 Emissions (10^6 Tons)"))

dev.copy(png, file="Proj2_plot1.png", height=480, width=480)
dev.off()

# Yes. Based on the barplot, the totle emission of PM 2.5 decreases from 1999 to 2008.