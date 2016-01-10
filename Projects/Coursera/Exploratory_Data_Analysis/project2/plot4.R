# Import dplyr for data manipulation
library(dplyr)

# Import the data from the unzipped exdata_data_NEI_data folder
NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

# Merge data based on SCC value in each
alldata <- merge(NEI, SCC, by.x="SCC", by.y="SCC")

# Check if emission is from a coal combustion source
coalcombustion <-grepl("fuel comb (.*) coal", 
                       alldata$EI.Sector, ignore.case = TRUE)

# Summarize yearly emission data for coal combustion sources
chartdata <- subset(alldata, coalcombustion) %>%
    group_by(year) %>%
    summarise(sum(Emissions))

# Divide emissions by 100 thousand so that it's easier to read
chartdata$reduced <- chartdata$`sum(Emissions)`/100000

# Open png plotting device
png(file="plot4.png")

# Plot the emision data
plot(chartdata$year,chartdata$reduced, xlab = "Year",
     main = "US PM2.5 Emissions from Coal Combustion 1999-2008", 
     ylab = "Total Tons of P2.5 Emission (in 100 thousands)",
     las =1, pch=19, col= "blue")

# Add a line to show the decline over time
abline(lm(reduced ~ year, chartdata), lwd=3)

# Save the plot
dev.off()
