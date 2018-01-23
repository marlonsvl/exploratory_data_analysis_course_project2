#### EXPLORATORY DATA ANALYSIS COURSE PROJECT 2 ######
#### Plot 1 ######
#setwd("/Users/marlonvinan/Documents/Doctorado/Exploratory_data_analysis_course/project2")

### LOAD DATA #####
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download(dataset_url, dest = "data.zip", mode = "wb")
unzip("data.zip", exdir = "./")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
# Using the base plotting system, make a plot showing the total PM2.5 emission 
# from all sources for each of the years 1999, 2002, 2005, and 2008.

data <- aggregate(NEI$Emissions, by = list(NEI$year), sum)

#### making plot 1 ######
png("plot1.png", width=480, height=480)
plot(data, type = "o", pch=19,  xlab = "PM2.5 emission", ylab = "Year", lty=10, col = "blue")
dev.off()

