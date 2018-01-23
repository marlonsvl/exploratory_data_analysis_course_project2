#### EXPLORATORY DATA ANALYSIS COURSE PROJECT 2 ######
#### Plot 3 ######
#setwd("/Users/marlonvinan/Documents/Doctorado/Exploratory_data_analysis_course/project2")
library(ggplot2)
### LOAD DATA #####
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download(dataset_url, dest = "data.zip", mode = "wb")
unzip("data.zip", exdir = "./")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


### finding data #####
dataBal <- subset(NEI, fips == "24510")
dat <- aggregate(dataBal$Emissions, by = list(dataBal$year, dataBal$type), sum)
names(dat) <- c("Year", "Type", "Emissions")
png("plot3.png", width=480, height=480)
qplot(Year, Emissions, data = dat, color = Type, geom = "line")+
  ggtitle("Total PM2.5 Emissions in Baltimore County by Source Type") + 
  xlab("Year") + ylab("PM2.5 Emissions")

dev.off()

