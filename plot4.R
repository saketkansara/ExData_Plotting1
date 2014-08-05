energydata <- read.table("household_power_consumption.txt", colClasses = "character", header = TRUE, sep = ";");

#convert date and time
energydata$Date <- as.Date(energydata$Date,format="%d/%m/%Y");

#convert character to numeric
energydata$Global_active_power <- as.numeric(energydata$Global_active_power);
energydata$Global_reactive_power <- as.numeric(energydata$Global_reactive_power);
energydata$Voltage <- as.numeric(energydata$Voltage);
energydata$Sub_metering_1 <- as.numeric(energydata$Sub_metering_1);
energydata$Sub_metering_2 <- as.numeric(energydata$Sub_metering_2);
energydata$Sub_metering_3 <- as.numeric(energydata$Sub_metering_3);

#take subset for only first two days in february 2007
sub_energydata <- subset(energydata,energydata$Date == "2007-02-01" | energydata$Date == "2007-02-02", na.rm = TRUE);


#paste date and time together for strptime
x <- paste(sub_energydata$Date, sub_energydata$Time);
x <- strptime(x,format="%Y-%m-%d %H:%M:%S");

#plot chart
par(mfrow = c(2,2));

#plot 1
plot(x, sub_energydata$Global_active_power, type = "l", xlab = "", ylab = "Global active power", cex.names = 0.5);

#plot 2
plot(x, sub_energydata$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", cex.names = 0.5);

#plot 3
#plot(x, sub_energydata$Sub_metering_1, type = "n");
plot(x, sub_energydata$Sub_metering_1, type = "l", col="black", xlab="", ylab="Energy sub metering");
points(x, sub_energydata$Sub_metering_2, type = "l", col="red");
points(x, sub_energydata$Sub_metering_3, type = "l", col="blue");
legend("topright", pch = "", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex=0.8);

#plot 4
plot(x, sub_energydata$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global reactive power", cex.names = 0.5);

dev.copy(png,"plot4.png",width=480,height=480);
dev.off();