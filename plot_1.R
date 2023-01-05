##download data
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileurl, destfile = "./neidata.zip")
unzip("./neidata.zip")
##read data into R
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
##create a dataframe with sum of pollutants and year
t1999 <- sum(NEI[NEI$year == 1999, ]$Emissions)
t2002 <- sum(NEI[NEI$year == 2002, ]$Emissions)
t2005 <- sum(NEI[NEI$year == 2005, ]$Emissions)
t2008 <- sum(NEI[NEI$year == 2008, ]$Emissions)
years <- c("1999","2002","2005","2008")
tpm25 <- c(t1999, t2002, t2005, t2008)
df <- data.frame(tpm25, years)
names(df) = c("TotalPM25", "Year")
##create barplot
png("./plot_1.png")
barplot(formula = TotalPM25 ~ Year, data = df)
dev.off()