library(ggplot2)
NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
baltimoreData <- NEI[NEI$fips == "24510", ]
baltimore_total <- aggregate(Emissions ~ year + type, baltimoreData, sum)
png("plot3.png", width = 480, height = 480)
g <- ggplot(baltimore_total, aes(year, Emissions, color = type)) + 
	geom_line() + ggtitle('Total Emissions In Baltimore City') + 
	xlab("Years") + ylab("Total PM2.5 Emissions")
print(g)
dev.off()