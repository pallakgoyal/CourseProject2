# CourseProject2
Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. Approximatly every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as the National Emissions Inventory (NEI). You can read more information about the NEI at the EPA National Emissions Inventory web site.

For each year and for each type of PM source, the NEI records how many tons of PM2.5 were emitted from that source over the course of the entire year. The data that I will use for this assignment are for 1999, 2002, 2005, and 2008.

plot_1.R and plot_1.png show the plot that answered the following question in the assignment.Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008. It shows that the total PM25 emissions for the United States as a whole have declined between 1999 and 2008, consistently.

plot_2.R and plot_2.png show the plot that answered the following question in the assignment. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question. The total emissions for Baltimore City show a declining trend but they have climbed up in alternate years.

plot_3.R and plot_3.png show the plot that answered the following question in the assignment. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.Non-Road, On-Road, and Non-Point sources have shown a consisten decline but the point sources have a shown an increase between 1999-2005 and a decline in 2008 to reach 1999 levels.

plot_4.R and plot_4.png show the plot that answered the following question in the assignment.Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008? The plot shows that emissions fell from 1999 to 2002, rose between 2002 and 2005 and fell to levels below 1999 in 2008.

