library(ggplot2)
NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
baltimore_LA_Data <- NEI[(NEI$fips == "24510" | NEI$fips == "06037") 
				& NEI$type == "ON-ROAD", ]
baltimore_LA_total <- aggregate(Emissions ~ year + fips, baltimore_LA_Data, sum)
baltimore_LA_total$fips[baltimore_LA_total$fips == "24510"] <- "Baltimore, MD"
baltimore_LA_total$fips[baltimore_LA_total$fips == "06037"] <- "Los Angeles, CA"
png("plot6.png", width = 480, height = 480)
g <- ggplot(baltimore_LA_total, aes(factor(year), Emissions)) +
	facet_grid(.~fips) + geom_bar(stat = "identity") +
	ggtitle('Total Emissions From Motor Vehicle Sources In Baltimore City & LA') +
	xlab("Years") + ylab("Total PM2.5 Emissions")
print(g)
dev.off()