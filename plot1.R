NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
total_emissions <- aggregate(Emissions ~ year, NEI, sum)
png("plot1.png", width = 480, height = 480)
barplot(total_emissions$Emissions, names.arg = total_emissions$year,
	  main = "Total PM2.5 Emissions From All Sources", xlab = "Years",
	  ylab = "PM2.5 Emissions", col = "Blue")
dev.off()