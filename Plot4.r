# Plot 4
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

# Merge two data sets
merge <- merge(x=NEI, y=SCC.coal, by='SCC')
merge.sum <- aggregate(merge[, 'Emissions'], by=list(merge$year), sum)
colnames(merge.sum) <- c('Year', 'Emissions')
require(ggplot2)
ggplot(data=merge.sum, aes(x=Year, y=Emissions/1000)) + 
  geom_bar(stat="identity") + theme_bw() + guides(fill=FALSE)+
  labs(x="year", y=expression(paste('PM', ''[2.5], ' in kilotons'))) + 
  labs(title=expression('Total Emissions of PM'[2.5]))

dev.copy(png, file="Proj2_plot4.png", height=480, width=480)
dev.off()