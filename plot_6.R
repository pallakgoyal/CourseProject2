##read data into R
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
## subsetting NEI data by vehicle
vhlSCC <- SCC[SCC$Data.Category == "Onroad", ]
vhlNEI.Bal <- merge(NEI[NEI$fips == "24510", ],vhlSCC, by = "SCC")
vhlNEI.LA <- merge(NEI[NEI$fips == "06037", ],vhlSCC, by="SCC")
##create df
df5 <- aggregate(vhlNEI.Bal$Emissions, by = list(Category = vhlNEI.Bal$year), 
                 FUN=sum)
names(df5) = c("Year", "Vehicle.Emissions")
df5$city <- rep("Baltimore",times=4) 
df6 <- aggregate(vhlNEI.LA$Emissions, by = list(Category = vhlNEI.LA$year), 
                 FUN=sum)
names(df6) = c("Year", "Vehicle.Emissions")
df6$city <- rep("Los.Angeles",times=4)
df7 <- rbind(df5,df6)
##create plot
library(ggplot2)
qplot(Year,Vehicle.Emissions,data=df7,color=city,geom=c("point","line"),
      xlab="Year",ylab="Emissions",main="Comparison of Vehicular emissions")+
        theme_bw()
dev.copy(png,"./plot_6.png")
dev.off()