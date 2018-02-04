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
sub3 <- filter(NEI, fips == "24510" & type=="ON-ROAD")
bmore_sources2 <- aggregate(sub3[c("Emissions")], list(type = sub3$type, year = sub3$year, zip = sub3$fips), sum)

#Plot Data
par(mar=c(4,4,2,2))
plot(bmore_sources2$year,bmore_sources2$Emissions,ylab="Emission Levels",xlab="Year",las=1,main="Motor Vehicle-Related Emissions in Baltimore Count",font.lab=2,cex=2,font.axis=2)
lines(lowess(bmore_sources2$year, bmore_sources2$Emissions),lty=4,lwd=2)

#Save File
dev.copy(png, file="Plot5.png", height=480, width=480)
dev.off()