##read data into R
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
## subsetting NEI data by vehicle
vhlSCC <- SCC[SCC$Data.Category == "Onroad", ]
vhlNEI.LA <- merge(NEI[NEI$fips == "06037", ],vhlSCC, by="SCC")
##create df
df6 <- aggregate(vhlNEI.Bal$Emissions, by = list(Category = vhlNEI.Bal$year), 
                 FUN=sum)
names(df6) = c("Year", "Vehicle.Emissions")
##create plot
library(ggplot2)
qplot(df6$Year,df6$Vehicle.Emissions, main="Vehicle Emissions in Los Angeles",
      geom = c("point","line"), xlab="Year",ylab="Vehicle Emissions" )+
        theme_bw()
dev.copy(png,"./plot_6.png")
dev.off()