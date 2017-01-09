library(lubridate)
##Read the data set into the current working directory
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = c("?",NA))
##Convert the Date variable from Factor to Date class
data$Date <- as.Date(as.character(data$Date), format="%d/%m/%Y")

fromDate <- as.Date("2007-02-01", format="%Y-%m-%d")
toDate <- as.Date("2007-02-02", format="%Y-%m-%d")

##Extract the rows whose dates are either 2007-02-01 or 2007-02-02
jan_and_feb_data <- subset(data, Date>=fromDate & Date<=toDate)

datetime <- paste(as.character(jan_and_feb_data$Date),as.character(jan_and_feb_data$Time))

par(mfrow=c(2,2))

##Create a line graph of datetime and Global Active Power
with(jan_and_feb_data, plot(ymd_hms(datetime),Global_active_power, type="n", xlab = "datetime", ylab = "Global Active Power (kilowatts)"))
lines(ymd_hms(datetime),jan_and_feb_data$Global_active_power)

##Create a line graph of datetime and Voltage
with(jan_and_feb_data, plot(ymd_hms(datetime),Voltage, type="n", xlab = "datetime", ylab = "Voltage"))
lines(ymd_hms(datetime),jan_and_feb_data$Voltage)

##Create a line graph of datetime and Sub meetering
with(jan_and_feb_data, plot(ymd_hms(datetime),Sub_metering_1, type="n", xlab = "datetime", ylab = "Energy sub meeting"))
lines(ymd_hms(datetime),jan_and_feb_data$Sub_metering_1)
lines(ymd_hms(datetime),jan_and_feb_data$Sub_metering_2, col="red")
lines(ymd_hms(datetime),jan_and_feb_data$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_meetering_1","Sub_meetering_2","Sub_meetering_3"), col=c("black","red","blue"),lty=c(1,1,1))

##Create a line graph of datetime and Global Reactive Power
with(jan_and_feb_data, plot(ymd_hms(datetime),Global_reactive_power, type="n", xlab = "datetime", ylab = "Global_reactive_power"))
lines(ymd_hms(datetime),jan_and_feb_data$Global_reactive_power)

##Copy the graph from the screen device to a png file
dev.copy(png,file="plot4.png", width=480, height=480)

dev.off()
