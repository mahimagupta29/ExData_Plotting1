
  ## Aim of this function is to 
  ## 1. read the household_power_consumption.txt file
  ## 2. subset for data taken from 2 days: 2007-02-01 and 2007-02-02
  ## 3. generate a histogram of global active power(kilowatts)
  
  ## Assumes household_power_consumption.txt file located in working dir
  
  ## read data
power_consumption_data <- read.table("C:/Users/mahim/ExData_Plotting1/household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
power_consumption_data
  ## change class of all columns to correct class
power_consumption_data$Date <- as.Date(power_consumption_data$Date, format="%d/%m/%Y")
power_consumption_data$Global_active_power <- as.numeric(power_consumption_data$Global_active_power)
  
  ## subset data from 2007-02-01 and 2007-02-02
subsetdata <- subset(power_consumption_data, Date == "2007-02-01" | Date =="2007-02-02")
  
  ## plot histogram of global active power for those 2 days
png("plot1.png", width=480, height=480)
hist(subsetdata$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
  
dev.off()


