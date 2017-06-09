library(sqldf)
# As recommended in the assignment instructions, ONLY the data corresponding to the required dates(2007-02-01 and 2007-02-02) have been read

data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date='1/2/2007' or Date='2/2/2007'", eol = "\n",sep=";",header=TRUE)

# Reformat Date
data$dateTime = paste(data$Date, data$Time)
data$dateTime <- strptime(data$dateTime, "%d/%m/%Y %H:%M:%S")

# Open png device
png(file="plot3.png", width=480, height=480,units="px")

# Plot 3
plot(data$dateTime,data$Sub_metering_1,col="black", type="l",ylab="Energy sub metering", xlab="")
lines(data$dateTime,data$Sub_metering_2,col="red")
lines(data$dateTime,data$Sub_metering_3,col="blue")
legend("topright",col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=1)


dev.off()