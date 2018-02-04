#Required Packages
library(downloader)

#Download and extract data
data_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download(data_url, dest = "data.zip", mode = "wb")
unzip("data.zip", exdir = "C:/Users/Aaron/OneDrive/Research Projects/R/Exploratory Data Analysis")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
data <- with(NEI, aggregate(Emissions, by = list(year), sum))

#Plot Data
par(mar=c(4,4,2,2))
plot(data, type = "o",main="PM2.5 Emissions by Year",xlab="Year", ylab = "PM2.5 Emissions", pch=17, col = "red",lty=1,cex=2,font.axis=2,font.lab=2)

#Save File
dev.copy(png, file="Plot1.png", height=480, width=480)
dev.off()