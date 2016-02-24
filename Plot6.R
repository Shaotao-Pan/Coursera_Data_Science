# Plot 6
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))
MD.LA<- subset(NEI, ((fips == "24510" | fips == "06037") & type == 'ON-ROAD'))
subset.MD.LA <- aggregate(Emissions~year+fips, MD.LA, sum)
subset.MD.LA$fips[subset.MD.LA$fips == '24510'] <- "Baltimore, MD"
subset.MD.LA$fips[subset.MD.LA$fips == '06037'] <- "Los Angeles, LA"

require(ggplot2)
g <- ggplot(subset.MD.LA, aes(x=factor(year),y = Emissions)) + geom_bar(stat="identity") + guides(fill=T) + ggtitle("Total emissions from motor vehicles in Baltimore and Los Angeles")
g <- g + labs(x = "Year", y = expression('Total PM'[2.5])) + facet_grid(.~fips) 
g

dev.copy(png, file='Proj2_plot6.png', height=480, width=480)
dev.off()