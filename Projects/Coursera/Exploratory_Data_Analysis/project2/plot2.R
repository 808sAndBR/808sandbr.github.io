# Import dplyr for data manipulation
library(dplyr)

# Import the data from the unzipped exdata_data_NEI_data folder
NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")

# Filter to only Baltimore City data ang group by year
chartdata <- filter(NEI, fips=="24510") %>%
    group_by(year) %>%
    summarise(sum(Emissions))

# Open png plotting device
png(file="plot2.png")

# Plot the emissions data
plot(chartdata$year,chartdata$`surm(listm(Emissions)`, xlab = "Year",
     main = "Baltimore City PM2.5 Emissions 1999-2008", 
     ylab = "Total Tons of P2.5 Emission",
     las =1, pch=19, col= "blue")

# Add a line to show the decline over time
abline(lm(`sum(Emissions)` ~ year, chartdata), lwd=3)

# Save the plot
dev.off()