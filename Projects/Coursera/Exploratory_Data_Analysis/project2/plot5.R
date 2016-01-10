# Import dplyr for data manipulation
library(dplyr)

# Import the data from the unzipped exdata_data_NEI_data folder
NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

# Merge data based on SCC value in each
alldata <- merge(NEI, SCC, by.x="SCC", by.y="SCC")

# Check if emission is from a motor vehicle
vehiclesource <-grepl("Mobile - On-Road", 
                       alldata$EI.Sector, ignore.case = TRUE)

# Summarize data for vehicle emilsions in Baltimore
chartdata <- subset(alldata, vehiclesource) %>%
    subset(fips == "24510") %>%
    group_by(year) %>%
    summarise(sum(Emissions))

# Open png plotting device
png(file="plot5.png")

# Plot emission data
plot(chartdata$year,chartdata$`sum(Emissions)`, xlab = "Year",
     main = "Baltimore City PM2.5 Emissions 
from Motor Vehicles 1999-2008", 
     ylab = "Total Tons of P2.5 Emission",
     las =1, pch=19, col= "blue")

# Add regression line so we can see change over time
abline(lm(`sum(Emissions)` ~ year, chartdata), lwd=3)

# Save the plot
dev.off()