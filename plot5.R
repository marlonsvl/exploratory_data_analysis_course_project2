#### EXPLORATORY DATA ANALYSIS COURSE PROJECT 2 ######
#### Plot 5 ######
#setwd("/Users/marlonvinan/Documents/Doctorado/Exploratory_data_analysis_course/project2")
library(ggplot2)
### LOAD DATA #####
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download(dataset_url, dest = "data.zip", mode = "wb")
unzip("data.zip", exdir = "./")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


### finding data #####
subNEI <- subset(NEI, fips == "24510" & type == "ON-ROAD")
dat <- aggregate(subNEI$Emissions, by = list(subNEI$type, subNEI$year, subNEI$fips),sum)
names(dat) <- c("Type","Year","fips", "Emissions")
png("plot5.png", width=480, height=480)
qplot(Year, Emissions, data = dat, geom = "line") + theme_light() + 
  ggtitle("Emissions from motor vehicle sources in Baltimore City") +
  xlab("Year") +
  ylab("Emissions")
dev.off()

