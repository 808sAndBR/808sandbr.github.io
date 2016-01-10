# Import dplyr for data manipulation
library(dplyr)

# Import the data from the unzipped exdata_data_NEI_data folder
NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")

# Sum the data by year
NEIby_year <- group_by(NEI, year)
chartdata <- summarise(NEIby_year, sum(Emissions))

# Divide emissions by 1 million so that it's easier to read
chartdata$reduced <- chartdata$`sum(Emissions)`/1000000

# Open png plotting device
png(file="plot1.png")

# Plot the emissions data
plot(chartdata$year,chartdata$reduced, xlab = "Year",
     main = "U.S. Total PM2.5 Emissions 1999-2008", 
     ylab = "Total Tons of P2.5 Emission (in millions)",
     las =1, pch=19, col= "blue")

# Add a line to show the decline over time
abline(lm(reduced ~ year, chartdata), lwd=3)

# Save the plot
dev.off()