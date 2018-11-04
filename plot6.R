library(dplyr)
library(ggplot2)


baltcitymarybyyear <- summarise(group_by(filter(NEI, fips == "24510"& type == 'ON-ROAD')
, year), Emissions=sum(Emissions))
LosAngelesbyyear <- summarise(group_by(filter(NEI, fips == "06037"& type == 'ON-ROAD')
, year), Emissions=sum(Emissions))
baltcitymarybyyear$County <- "Baltimore City, MD"
LosAngelesbyyear$County <- "Los Angeles County, CA"
both.emissions <- rbind(baltcitymarybyyear, LosAngelesbyyear)
png(filename="plot6.png",width = 600, height = 480)
ggplot(both.emissions, aes(x=factor(year), y=Emissions,fill=County, label = round(Emissions,2))) +
    geom_bar(stat="identity") +
    facet_grid(County~., scales="free") +
    xlab("year") +
    ylab(expression("total PM"[2.5]*" emissions in tons")) +
    ggtitle(expression("Motor vehicle emission variation in Baltimore and Los Angeles in tons"))+
    geom_label(aes(fill = County),colour = "white", fontface = "bold")
    



dev.off()