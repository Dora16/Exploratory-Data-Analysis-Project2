library(dplyr)
library(ggplot2)


baltcitymary.emissions<-NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]

baltcitymarybyyear <- summarise(group_by(baltcitymary.emissions, year), Emissions=sum(Emissions))


png(filename="plot5.png",width = 480, height = 480)
ggplot(baltcitymarybyyear, aes(x=factor(year), y=Emissions,fill=year, label = round(Emissions,2))) +
    geom_bar(stat="identity") +
    xlab("year") +
    ylab(expression("total PM"[2.5]*" emissions in tons")) +
    ggtitle("Emissions from motor vehicle sources in Baltimore City")+
    geom_label(aes(fill = year),colour = "white", fontface = "bold")



dev.off()