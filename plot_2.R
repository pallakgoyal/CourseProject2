##read data into R
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
##create data frame with sum of pollutants for Baltimore city
bt1999 <- sum(NEI[NEI$year == 1999 & NEI$fips == "24510", ]$Emissions)
bt2002 <- sum(NEI[NEI$year == 2002 & NEI$fips == "24510", ]$Emissions)
bt2005 <- sum(NEI[NEI$year == 2005 & NEI$fips == "24510", ]$Emissions)
bt2008 <- sum(NEI[NEI$year == 2008 & NEI$fips == "24510", ]$Emissions)
years <- c("1999","2002","2005","2008")
btpm25 <- c(bt1999, bt2002, bt2005, bt2008)
df2 <- data.frame(years, btpm25)
names(df2) = c("Years", "TotalPM25")
##create barplot
png("./plot_2.png")
barplot(formula = TotalPM25 ~ Years, data = df2, 
        main = "Total PM25 in Baltimore City")
dev.off()