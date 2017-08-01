library(ggplot2)
NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
baltimoreData <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD", ]
baltimore_total <- aggregate(Emissions ~ year, baltimoreData, sum)
png("plot5.png", width = 480, height = 480)
g <- ggplot(baltimore_total, aes(factor(year), Emissions)) +
	geom_bar(stat = "identity") +
	ggtitle('Total Emissions From Motor Vehicle Sources in Balitmore City') +
	xlab("Years") + ylab("Total PM2.5 Emissions")
print(g)
dev.off()