# Import dplyr for data manipulation and ggplot2 for plotting
library(dplyr)
library(ggplot2)

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
    subset(fips == "24510"|fips == "06037") %>%
    group_by(year, fips) %>%
    summarise(sum(Emissions))

# Get the percent change in relation to 1999
chartdata$change <- (chartdata$`sum(Emissions)`
                     /c(3931.12,346.82) -1)* 100

# Assign names instead of fips for clarity
chartdata$location <- c("LA County", "Baltimore")

# Open png plotting device
png(file="plot6.png")

# Plot percent change in emission for LA and Baltimore
p <- qplot(year,change,
      data = chartdata, col= location,
      geom=c("point","smooth"), method = "lm",
      main = "Changes in PM2.5 Emissions from 1999-2008
Baltimore City vs. Los Angeles County",
      xlab = "Year", ylab = "Percent Change in Total Tons of P2.5 Emission")

# Print the plot
print(p)

# Save the plot
dev.off()