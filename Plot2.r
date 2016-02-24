# Plot 2

# subset data set containing observations from Maryland fip = 24510
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_ml <- subset(NEI, fips == 24510)
NEI_total <- tapply(NEI_ml$Emissions,factor(NEI_ml$year),sum)
barplot(NEI_total, xlab = "Year", ylab = "Total Emission", main = "Total PM 2.5 Emission in Baltimore City")

dev.copy(png, file="Proj2_plot2.png", height=480, width=480)
dev.off()

# It seems to have a decreasing trend along the year. However, in 2005, there was a relapse. 