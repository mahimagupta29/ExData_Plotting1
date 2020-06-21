## Aim of this function is to 
## 1. read the household_power_consumption.txt file
## 2. subset for data taken from 2 days: 2007-02-01 and 2007-02-02
## 3. generate a plot of global active power vs. time

## Assumes household_power_consumption.txt file located in working dir

## read data
power_consumption_data <- read.table("C:/Users/mahim/ExData_Plotting1/household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

## Create column in table with date and time merged together
FullTimeDate <- strptime(paste(power_consumption_data$Date, power_consumption_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
power_consumption_data <- cbind(power_consumption_data, FullTimeDate)

## change class of all columns to correct class
power_consumption_data$Date <- as.Date(power_consumption_data$Date, format="%d/%m/%Y")
power_consumption_data$Time <- format(power_consumption_data$Time, format="%H:%M:%S")
power_consumption_data$Global_active_power <- as.numeric(power_consumption_data$Global_active_power)


## subset data from 2007-02-01 and 2007-02-02
subsetdata <- subset(power_consumption_data, Date == "2007-02-01" | Date =="2007-02-02")

## plot globalactivepower vs date&time
# Plot must be saved as PNG files of 480x480 pixels
png("plot2.png", width=480, height=480, units = "px")
with(subsetdata, plot(FullTimeDate, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
