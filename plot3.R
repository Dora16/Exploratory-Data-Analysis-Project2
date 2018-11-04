library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(filename="plot3.png",width = 480, height = 480)
baltcitymary.byyear<-summarise(group_by(filter(NEI, fips == "24510"), year,type), Emissions=sum(Emissions))
ggplot(baltcitymary.byyear, aes(x=factor(year), y=Emissions, fill=type,label = round(Emissions,2))) +
    geom_bar(stat="identity") +
    facet_grid(. ~ type) +
    xlab("year") +
    ylab(expression("total PM"[2.5]*" emission in tons")) +
    ggtitle(expression("PM"[2.5]*paste(" emissions in Baltimore ",
                                       "City by various source types", sep="")))+
    geom_label(aes(fill = type), colour = "white", fontface = "bold")

dev.off()