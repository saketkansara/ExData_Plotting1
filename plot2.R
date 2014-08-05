energydata <- read.table("household_power_consumption.txt", colClasses = "character", header = TRUE, sep = ";");

#convert date and time
energydata$Date <- as.Date(energydata$Date,format="%d/%m/%Y");

#convert factor to numeric
energydata$Global_active_power <- as.numeric(energydata$Global_active_power);

#take subset for only first two days in february 2007
sub_energydata <- subset(energydata,energydata$Date == "2007-02-01" | energydata$Date == "2007-02-02", na.rm = TRUE);


#paste date and time together for strptime
x <- paste(sub_energydata$Date, sub_energydata$Time);
x <- strptime(x,format="%Y-%m-%d %H:%M:%S");

#plot chart
plot(x, sub_energydata$Global_active_power, type = "l", xlab = "", ylab = "Global active power (kilowatts)");
dev.copy(png,"plot2.png",width=480,height=480);
dev.off();