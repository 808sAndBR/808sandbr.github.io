# load lubridate library
library(lubridate)

# load all data
alldata <- read.table("household_power_consumption.txt", header=TRUE,sep=";")

# Subset the data we need and combine them
subdata1 <- subset(alldata, Date == "1/2/2007")
subdata2 <- subset(alldata, Date == "2/2/2007")
subdata <-rbind( subdata1,subdata2)

# Combine date and time data and use lubricdate to put in usable format
subdata$DayTime <- dmy(subdata$Date) + hms(subdata$Time)

# Open png plotting device
png(file="plot4.png")

# Make it so plots will show up in two by two right to left
par(mfrow=c(2,2))

# Plot global active power by time
plot(subdata$DayTime,as.numeric(as.character(subdata$Global_active_power)), type="l", xlab = "",ylab = "Global Active Power")

# Plot voltage by time
plot(subdata$DayTime,as.numeric(as.character(subdata$Voltage)), type="l", xlab = "datetime",ylab = "Voltage")

# Plot the three sub meeterings for energy in different colors
plot(subdata$DayTime,as.numeric(as.character(subdata$Sub_metering_1)), type="l", xlab = "", ylab = "Energy sub metering")
points(subdata$DayTime,as.numeric(as.character(subdata$Sub_metering_2)), col="red",type="l")
points(subdata$DayTime,as.numeric(as.character(subdata$Sub_metering_3)), col="blue",type="l")

# Create legend forthe submetering data
legend("topright", lty = 1,col=c("black","blue","red"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")

# Plot global reactive power over time
plot(subdata$DayTime,as.numeric(as.character(subdata$Global_reactive_power)), type="l", xlab = "datetime",ylab = "Global_reactive_power")

# Save the plot
dev.off()
