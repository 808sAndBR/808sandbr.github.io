# Import dplyr for data manipulation and ggplot2 for plotting
library(dplyr)
library(ggplot2)

# Import the data from the unzipped exdata_data_NEI_data folder
NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")

# Filter to only Baltimore City data ang group by year and type
chartdata <- filter(NEI, fips=="24510") %>%
    group_by(year, type) %>%
    summarise(sum(Emissions))

# Open png plotting device (width 2x height for readability)
png(file="plot3.png", width = 960)

# Plot data with lm lines to show increase/decrease over time
p <- qplot(year,`sum(Emissions)`,
      data = chartdata, facets = .~type, 
      geom=c("point","smooth"), method = "lm",
      main = "Baltimore City PM2.5 Emissions By Source",
      xlab = "Year", ylab = "Total Tons of P2.5 Emission")

# Print the plot
print(p)

# Save the plot
dev.off()