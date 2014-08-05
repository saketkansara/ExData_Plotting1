energydata <- read.table("household_power_consumption.txt", colClasses = "character", header = TRUE, sep = ";");

energydata$Date <- as.Date(energydata$Date,format="%d/%m/%Y"); #convert date

energydata$Global_active_power <- as.numeric(energydata$Global_active_power); #convert factor to numeric

#take subset for only first two days in february 2007
sub_energydata <- subset(energydata,energydata$Date == "2007-02-01" | energydata$Date == "2007-02-02", na.rm = TRUE);

#plot histogram
with(sub_energydata, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"));
dev.copy(png,"plot1.png",width=480,height=480);
dev.off();