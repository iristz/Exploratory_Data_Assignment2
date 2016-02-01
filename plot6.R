library(ggplot2)
NEI<-readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC<-readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
subsetNEI<-NEI[NEI$fips=="24510"|NEI$fips=="06037",]
png("plot6.png")
motor<-grep("motor",SCC$Short.Name, ignore.case=T)
motor<-SCC[motor,]
motor<-subsetNEI[subsetNEI$SCC %in% motor$SCC, ]
g<-ggplot(motor, aes(year, Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037")  1999-2008')
print(g)
dev.off()
