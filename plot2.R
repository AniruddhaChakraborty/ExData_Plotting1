library(sqldf)
# As recommended in the assignment instructions, ONLY the data corresponding to the required dates(2007-02-01 and 2007-02-02) have been read

data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date='1/2/2007' or Date='2/2/2007'", eol = "\n",sep=";",header=TRUE)

# Reformat Date
data$dateTime = paste(data$Date, data$Time)
data$dateTime <- strptime(data$dateTime, "%d/%m/%Y %H:%M:%S")

# Plot 2
plot(data$dateTime,data$Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab="")

# Copy to png device
dev.copy(png, file="plot2.png", width=480, height=480,units="px")

dev.off()