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

#Subset data for Baltimore
sub2 <- filter(NEI, fips == "24510")
bmore_sources<- aggregate(sub2[c("Emissions")], list(type = sub2$type, year = sub2$year), sum)

#Plot Data
plot <- ggplot(bmore_sources, aes(x=year, y=Emissions, colour=type)) +
  geom_point(alpha=0.4) +
  geom_smooth(alpha=0.4, size=1, method="loess") +
  ggtitle("Total Emissions by Type in Baltimore City")+
  ylab("PM2.5 Emissions")+
  xlab("Year")+
  theme(axis.title=element_text(face="bold",size="12"),plot.title=element_text(face="bold",colour="red"))
print(plot)

#Save File
dev.copy(png, file="Plot3.png", height=480, width=480)
dev.off()