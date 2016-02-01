library(plyr)
library(ggplot2)
NEI<-readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC<-readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
motor <- ddply(NEI[NEI$fips == "24510" 
                   & NEI$type == "ON-ROAD",],
               .(type,year), summarise, 
              TotalEmissions = sum(Emissions))
png("plot5.png")
ggplot(motor, aes(year, TotalEmissions)) +
     geom_line() + geom_point() +
     labs(title = "Total Emissions from Motor Vehicles in Baltimore City",
         x = "Year", y = "Total Emissions")
dev.off()    