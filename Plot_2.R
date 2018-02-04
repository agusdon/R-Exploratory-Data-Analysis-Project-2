#Required Packages
library(downloader)
library(dplyr)

#Download and extract data
data_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download(data_url, dest = "data.zip", mode = "wb")
unzip("data.zip", exdir = "C:/Users/Aaron/OneDrive/Research Projects/R/Exploratory Data Analysis")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset data for Baltimore
sub <- filter(NEI,fips=="24510")
bmore <- tapply(sub$Emissions, sub$year, sum)

#Plot Data
par(mar=c(4,4,2,2))
plot(bmore,type="o",main="PM2.5 Emissions in Baltimore County per Year",xlab="Year",ylab="PM2.5 Emissions",pch=15,col="darkgreen",lty=2,las=1,font.lab=2,xaxt="n")
axis(side=1,labels=c(1999,2002,2005,2008),at=c(1,2,3,4))

#Save File
dev.copy(png, file="Plot2.png", height=480, width=480)
dev.off()