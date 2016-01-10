# Read in all data
alldata <- read.table("household_power_consumption.txt", header=TRUE,sep=";")

# Subset the days we need and combine their data
subdata1 <- subset(alldata, Date == "1/2/2007")
subdata2 <- subset(alldata, Date == "2/2/2007")
subdata <-rbind( subdata1,subdata2)

# Launch png as graphics device
png(file="plot1.png")

# Create histogram from the data with red bars, labeled appropriately
hist(as.numeric(as.character(subdata$Global_active_power)),col="red",breaks=12, main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Save the plot
dev.off()