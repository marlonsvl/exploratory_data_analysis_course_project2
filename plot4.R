#### EXPLORATORY DATA ANALYSIS COURSE PROJECT 2 ######
#### Plot 4 ######
#setwd("/Users/marlonvinan/Documents/Doctorado/Exploratory_data_analysis_course/project2")
library(ggplot2)
### LOAD DATA #####
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download(dataset_url, dest = "data.zip", mode = "wb")
unzip("data.zip", exdir = "./")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


### finding data #####
coalSCC <- SCC[grepl("Coal", SCC$Short.Name), ]
subNEI <- NEI[NEI$SCC %in% coalSCC$SCC, ]

png("plot4.png", width=480, height=480)
plot4 <- ggplot(subNEI, aes(x = factor(year), y = Emissions/10^5, fill =type)) + 
  geom_bar(stat= "identity", width = .6) + 
  xlab("year") +ylab("Coal-Related PM2.5 * Emissions(10^5)") + 
  ggtitle("Total Coal-Related PM2.5 Emissions")
print(plot4)

dev.off()

