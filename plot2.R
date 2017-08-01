NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
baltimoreData <- NEI[NEI$fips == "24510", ]
baltimore_total <- aggregate(Emissions ~ year, baltimoreData, sum)
png("plot2.png", width = 480, height = 480)
barplot(baltimore_total$Emissions, names.arg = baltimore_total$year,
	  main = "Total PM2.5 Emissions From All Sources Around Baltimore City",
	  xlab = "Years", ylab = "PM2.5 Emissions", col = "Blue")
dev.off()