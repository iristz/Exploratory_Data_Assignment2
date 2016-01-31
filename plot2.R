NEI<-readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC<-readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
subsetNEI<-NEI[NEI$fips=='24510',]
Aggregated<-aggregate(Emissions~year,subsetNEI,sum)
png('plot2.png')
barplot(height=Aggregated$Emissions, names.arg=Aggregated$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()