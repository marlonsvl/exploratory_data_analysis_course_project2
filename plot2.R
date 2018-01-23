#### EXPLORATORY DATA ANALYSIS COURSE PROJECT 2 ######
#### Plot 2 ######
#setwd("/Users/marlonvinan/Documents/Doctorado/Exploratory_data_analysis_course/project2")

### LOAD DATA #####
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download(dataset_url, dest = "data.zip", mode = "wb")
unzip("data.zip", exdir = "./")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


### finding data #####
dataBal <- subset(NEI, fips == "24510")
findData <- aggregate(dataBal$Emissions, by = list(dataBal$year), sum)
png("plot2.png", width=480, height=480)
plot(findData, type = "o", pch=19,  xlab = "PM2.5 emission", ylab = "Year", 
     lty=20, col = "blue", main="Emissions from PM2.5 in the Baltimore City, 
     Maryland from 1999 to 2008")
dev.off()

