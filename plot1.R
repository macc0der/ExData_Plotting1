##Read the data set into the current working directory
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = c("?",NA))
##Convert the Date variable from Factor to Date class
data$Date <- as.Date(as.character(data$Date), format="%d/%m/%Y")

fromDate <- as.Date("2007-02-01", format="%Y-%m-%d")
toDate <- as.Date("2007-02-02", format="%Y-%m-%d")

##Extract the rows whose dates are either 2007-02-01 or 2007-02-02
jan_and_feb_data <- subset(data, Date>=fromDate & Date<=toDate)

##Create a histogram of Global Active Power
hist(jan_and_feb_data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

##Copy the graph from the screen device to a png file
dev.copy(png,file="plot1.png", width=480, height=480)

dev.off()
