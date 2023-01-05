##read data into R
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
##create data frame
df3 <- aggregate(NEI[NEI$fips == "24510", ]$Emissions, 
                 by = list(Category = NEI[NEI$fips == "24510", ]$year, 
                           Category = NEI[NEI$fips == "24510", ]$type), 
                 FUN = sum)
names(df3) <- c("Year", "Source", "Emissions")
##create plot
library(ggplot2)
png("./plot_3.png")
qplot(x=Year,y=Emissions, data = df3, color = Source,
      geom = c("point", "line"))  + theme_bw()
dev.off()