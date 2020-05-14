hpc <- read.csv("C:/Users/Dell/Desktop/myproject/household_power_consumption.txt", header=FALSE, sep=";")
View(hpc)
hpc$V3 <- as.numeric(hpc$V3)
hpc$V1 <- as.Date(hpc$V1, "%d/%m/%Y")
str(hpc)
View(hpc)
hpc1 <- subset(hpc,(hpc$V1 >= "2007-02-01") & (hpc$V1 <= "2007-02-02"))
View(hpc1)
png("plot1.png", width=480, height=480)
hist(hpc1$V3, main="Global Active Power", xlim = c(0,6),
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()