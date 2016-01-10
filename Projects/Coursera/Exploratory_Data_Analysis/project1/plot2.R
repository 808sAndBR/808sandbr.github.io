# Import lubridate library
library(lubridate)

# Load all data
alldata <- read.table("household_power_consumption.txt", header=TRUE,sep=";")

# Subset for days we need and combune their data
subdata1 <- subset(alldata, Date == "1/2/2007")
subdata2 <- subset(alldata, Date == "2/2/2007")
subdata <-rbind( subdata1,subdata2)

# combine the date and time columns using lubridate to put into datetime format
subdata$DayTime <- dmy(subdata$Date) + hms(subdata$Time)

# Open plotting device
png(file="plot2.png")

# Plot global active power over the two days
plot(subdata$DayTime,as.numeric(as.character(subdata$Global_active_power)), type="l", xlab = "",ylab = "Global Active Power (kilowatts)")

# Save the plot
dev.off()
