library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(filename="plot1.png",width = 480, height = 480)
total.emissions <- summarize(group_by(NEI, year), Emissions=sum(Emissions))
clrs <- c("red", "green", "blue", "yellow")
barplot(height=total.emissions$Emissions/1000, names.arg=total.emissions$year,
        xlab="years", ylab=expression('total PM'[2.5]*' emission in kilotons'),ylim=c(0,8000),
        main=expression('Total PM'[2.5]*' emissions at various years in kilotons'),col=clrs)
dev.off()
