##read data into R
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
## subsetting NEI data by vehicle
vhlSCC <- SCC[SCC$Data.Category == "Onroad", ]
vhlNEI.Bal <- merge(NEI[NEI$fips == "24510", ],vhlSCC, by = "SCC")
##create df
df5 <- aggregate(vhlNEI.Bal$Emissions, by = list(Category = vhlNEI.Bal$year), 
                 FUN=sum)
names(df5) = c("Year", "Vehicle.Emissions")
##create plot
library(ggplot2)
qplot(df5$Year,df5$Vehicle.Emissions,main = "Vehicle Emissions in Baltimore", 
      geom = c("point","line"), xlab="Year",ylab="Vehicle Emissions")+theme_bw()
dev.copy(png,"./plot_5.png")
dev.off()