#### EXPLORATORY DATA ANALYSIS COURSE PROJECT 2 ######
#### Plot 6 ######
#setwd("/Users/marlonvinan/Documents/Doctorado/Exploratory_data_analysis_course/project2")
library(ggplot2)
### LOAD DATA #####
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download(dataset_url, dest = "data.zip", mode = "wb")
unzip("data.zip", exdir = "./")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


### finding data #####
subNEIBal <- subset(NEI, fips == "24510" & type == "ON-ROAD")
dataBal <- aggregate(subNEIBal$Emissions, by = list(subNEIBal$type, subNEIBal$year, subNEIBal$fips),sum)

subNEILA <- subset(NEI, fips == "06037" & type == "ON-ROAD")
dataLA <- aggregate(subNEILA$Emissions, by = list(subNEILA$type, subNEILA$year, subNEILA$fips),sum)

allData <- rbind(dataBal, dataLA)

names(allData) <- c("Type","Year","fips", "Emissions")
png("plot6.png", width=480, height=480)

qplot(Year, Emissions, data = allData, color = fips, geom = "line")+
  ggtitle("Total PM2.5 Emissions in Baltimore vs Los Angeles by Source Type") + 
  xlab("Year") + ylab("PM2.5 Emissions")


dev.off()

