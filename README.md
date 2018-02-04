Exploratory Data Analysis - Course Project 2
============================================

# Introduction

Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. Approximatly every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as the National Emissions Inventory (NEI). You can read more information about the NEI at the EPA National [Emissions Inventory web site](http://www.epa.gov/ttn/chief/eiinformation.html).

For each year and for each type of PM source, the NEI records how many tons of PM2.5 were emitted from that source over the course of the entire year. The data that you will use for this assignment are for 1999, 2002, 2005, and 2008.

# Data

The data for this assignment are available from the course web site as a single zip file:

* [Data for Peer Assessment [29Mb]](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip)

The zip file contains two files:

PM2.5 Emissions Data (`summarySCC_PM25.rds`): This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year. Here are the first few rows.

# Assignment

The goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008. You may use any R package you want to support your analysis.

## Making and Submitting Plots

For each plot you should

* Construct the plot and save it to a PNG file.
* Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You should also include the code that creates the PNG file. Only include the code for a single plot (i.e. plot1.R should only include code for producing plot1.png)
* Upload the PNG file on the Assignment submission page
* Copy and paste the R code from the corresponding R file into the text box at the appropriate point in the peer assessment.

In preparation the data sets archive is downloaded and extracted.

```r
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
```

## Questions

The following questions are addressed with exploratory figures answering each question. 

- Have total emissions from PM_{2.5} decreased in the United States from 1999 to
  2008?

  [[./plot1.png]]

- Have total emissions from PM_{2.5} decreased in the Baltimore City, Maryland
  from 1999 to 2008?

  [[./plot2.png]]

- Of the four types of sources indicated by the =type= (point, nonpoint, onroad,
  nonroad) variable, which of these four sources have seen decreases in
  emissions from 1999-2008 for Baltimore City? Which have seen increases in
  emissions from 1999-2008? 

  [[./plot3.png]]

- Across the United States, how have emissions from coal combustion-related
  sources changed from 1999-2008?

  [[./plot4.png]]

- How have emissions from motor vehicle sources changed from 1999-2008 in
  Baltimore City?

  [[./plot5.png]]

- Compare emissions from motor vehicle sources in Baltimore City with emissions
  from motor vehicle sources in Los Angeles County, California. Which city has
  seen greater changes over time in motor vehicle emissions?

  [[./plot6.png]]
