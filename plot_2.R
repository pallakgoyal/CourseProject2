##read data into R
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
##create data frame with sum of pollutants for Baltimore city
df2 <- aggregate(NEI[NEI$fips == "24510", ]$Emissions, 
                 by = list(Category = NEI[NEI$fips == "24510", ]$year), 
                 FUN = sum)
names(df2) = c("Years", "TotalPM25")
##create barplot
png("./plot_2.png")
barplot(formula = TotalPM25 ~ Years, data = df2, 
        main = "Total PM25 in Baltimore City")
dev.off()