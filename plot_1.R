##download data
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileurl, destfile = "./neidata.zip")
unzip("./neidata.zip")
##read data into R
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
##create a dataframe with sum of pollutants and year
df <- aggregate(NEI$Emissions, by = list(Category = NEI$year), FUN = sum)
names(df) = c("Year", "TotalPM25")
##create barplot
png("./plot_1.png")
barplot(formula = TotalPM25 ~ Year, data = df, 
        main = "Total PM25 Emissions in USA")
dev.off()