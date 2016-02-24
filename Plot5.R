# Plot 5
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

MD<- subset(NEI, fips == 24510 & type == 'ON-ROAD')

# Aggregate
MD.df <- aggregate(Emissions~year, MD, sum)
colnames(MD.df) <- c('year', 'Emissions')

require(ggplot2)

ggplot(data=MD.df, aes(x=year, y=Emissions)) + geom_bar(stat="identity") + guides(fill=T) + 
  labs(title='Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') + 
  labs(y=expression('PM'[2.5]) , x='Year' )
dev.copy(png, file='Proj2_plot5.png', height=480, width=480)
dev.off()