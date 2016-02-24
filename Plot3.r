# Plot 3
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

require(ggplot2)
NEI_ml <- subset(NEI, fips == 24510)
barplot.tp <- ggplot(NEI_ml,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") + theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))
barplot.tp
dev.copy(png, file="Proj2_plot3.png", height=480, width=480)
dev.off()