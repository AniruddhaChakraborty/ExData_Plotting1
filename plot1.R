library(sqldf)
# As recommended in the assignment instructions, ONLY the data corresponding to the required dates(2007-02-01 and 2007-02-02) have been read

data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date='1/2/2007' or Date='2/2/2007'", eol = "\n",sep=";",header=TRUE)

# Plot the histogram
hist(data$Global_active_power, main = "Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

# Copy to png device
dev.copy(png, file="plot1.png", width=480, height=480,units="px")

dev.off()