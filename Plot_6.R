#Required Packages
library(downloader)
library(dplyr)
library(ggplot2)

#Download and extract data
data_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download(data_url, dest = "data.zip", mode = "wb")
unzip("data.zip", exdir = "C:/Users/Aaron/OneDrive/Research Projects/R/Exploratory Data Analysis")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset data
sub4 <- filter(NEI, fips == "24510"|fips=="06037")
sub5 <- filter(sub4,type=="ON-ROAD")
emissions <- aggregate(sub5[c("Emissions")], list(type = sub5$type, year = sub5$year, zip = sub5$fips), sum)

#Plot Data
plot <- ggplot(emissions, aes(x=year, y=Emissions, colour=zip)) +
  geom_point(alpha=0.4) +
  geom_smooth(alpha=0.4, size=1, method="loess") +
  ggtitle("Motor Vehicle Emissions in Baltimore (24510) vs LA (06037) Counties")+
  ylab("Emission Levels")+
  xlab("Year")+
  theme(axis.title=element_text(face="bold",size="12"),plot.title=element_text(face="bold",colour="red"))
print(plot)

#Save File
dev.copy(png, file="Plot6.png", height=480, width=480)
dev.off()