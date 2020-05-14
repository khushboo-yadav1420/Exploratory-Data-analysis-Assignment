library("data.table")

setwd("C:/Users/Dell/Desktop/myproject")


#Reads in data from file then subsets data for specified dates
hpc <- data.table::fread(input = "household_power_consumption.txt"
                         , na.strings="?")
hpc[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Making a POSIXct date capable of being filtered and graphed by time of day
hpc[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
hpc <- hpc[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot4.png", width=480, height=480)
# Plot 1
plot(hpc[, dateTime], hpc[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

# Plot 2
plot(hpc[, dateTime],hpc[, Voltage], type="l", xlab="datetime", ylab="Voltage")

# Plot 3
plot(hpc[, dateTime], hpc[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(hpc[, dateTime], hpc[, Sub_metering_2], col="red")
lines(hpc[, dateTime], hpc[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

# Plot 4
plot(hpc[, dateTime], hpc[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
