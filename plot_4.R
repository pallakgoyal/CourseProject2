##read data into R
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
##subesetting NEI data by coal 
coalrows <- grep("Coal", SCC$SCC.Level.Three)
coalSCC <- SCC[coalrows, ]$SCC
NEIcoal <- NEI[NEI$SCC == coalSCC, ]
##create df
df4 <- aggregate(NEIcoal$Emissions, by = list(Category = NEIcoal$year), 
                 FUN = sum)
names(df4) = c("Year", "Coal Emissions")
##plot
library(ggplot2)
qplot(df4$Year,df4$`Coal Emissions`, geom = c("point", "line"), xlab = "Year", 
      ylab = "Coal Emissions", main = "Coal related emisions in USA")+theme_bw()
dev.copy(png,"./plot_4.png")
dev.off()