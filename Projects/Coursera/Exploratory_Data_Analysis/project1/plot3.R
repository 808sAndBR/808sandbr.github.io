# Load the lubridate package
library(lubridate)

# Load all data
alldata <- read.table("household_power_consumption.txt", header=TRUE,sep=";")

# Subset the days we need and combine them
subdata1 <- subset(alldata, Date == "1/2/2007")
subdata2 <- subset(alldata, Date == "2/2/2007")
subdata <-rbind( subdata1,subdata2)

# combine the date and time columns using lubridate to put into datetime format
subdata$DayTime <- dmy(subdata$Date) + hms(subdata$Time)

# Open png plotting device
png(file="plot3.png")

# Plot sub_metering_1 data and set appropriate labels
plot(subdata$DayTime,as.numeric(as.character(subdata$Sub_metering_1)), type="l", xlab = "", ylab = "Energy sub metering")

# Plot sub_metering_2 in red
points(subdata$DayTime,as.numeric(as.character(subdata$Sub_metering_2)), col="red",type="l")

# Plot sub_metering_3 in blue
points(subdata$DayTime,as.numeric(as.character(subdata$Sub_metering_3)), col="blue",type="l")

# Create legend with submetering data
legend("topright", lty = 1,col=c("black","blue","red"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Save plot
dev.off()