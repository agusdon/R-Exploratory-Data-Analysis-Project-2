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

#Subset Data for coal
CC <- grepl("Fuel Comb.*Coal",SCC$EI.Sector)
CCs <- SCC[CC,]
coalcombustion_emission <- NEI[(NEI$SCC %in% CCs$SCC),]
coal_emission <- summarise(group_by(coalcombustion_emission,year),Emissions=sum(Emissions))

#Create Plot
plot<-ggplot(coal_emission,aes(x=factor(year),y=Emissions/1000,fill=year,label=round(Emissions/1000,2)))+
  geom_bar(stat="identity")+
  xlab("Year")+
  ylab(expression("Total PM2.5 emissions in kilotons"))+
  ggtitle("Emissions from coal combustion-related sources in kilotons")+
  geom_label(aes(fill=year),colour="red",fontface="bold")+
  theme(axis.title=element_text(face="bold",size="12"),plot.title=element_text(face="bold",colour="red"))
print(plot)

#Save File
dev.copy(png, file="Plot4.png", height=480, width=480)
dev.off()