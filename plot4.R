library(ggplot2)
NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC, by = "SCC")
match_coal <- grepl("coal", NEISCC$Short.Name, ignore.case = TRUE)
NEISCC_data <- NEISCC[match_coal, ]
coal_total <- aggregate(Emissions ~ year, NEISCC_data, sum)
png("plot4.png", width = 480, height = 480)
g <- ggplot(coal_total, aes(factor(year), Emissions)) +
	geom_bar(stat = "identity") +
	ggtitle('Total Emissions From All Coal-Combustion Related Sources') +
	xlab("Years") + ylab("Total PM2.5 Emissions")
print(g)
dev.off()