setwd("~/R/exploratory_data")
#read in data -- I am using the pre-filtered file as suggested in teh project README -- the raw data has only the 2 days in it.
power<- read.csv("~/R/exploratory_data/household_power_consumption_short.txt", sep=";")


#create the datetime field from the original Date and Time fields
power$datetime <- as.POSIXct(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")

#convert the numeric variables from Factor to numeric 
power$Global_active_power <- as.numeric(power$Global_active_power)
power$Global_reactive_power <- as.numeric(power$Global_reactive_power)
power$Voltage <- as.numeric(power$Voltage)
power$Global_intensity <- as.numeric(power$Global_intensity)
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)

str(power)

#plot 3 using base graphics
png(filename = "plot3.png", width=480, height=480)
with(power, plot(Sub_metering_1~datetime, , xlab="",  ylab="Energy sub metering", type = "n"))
lines(power$Sub_metering_1 ~ power$datetime, col="black")
lines(power$Sub_metering_2 ~ power$datetime, col="red")
lines(power$Sub_metering_3 ~ power$datetime, col="blue")
legend(
  "topright"
  , legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  , lty = c(1, 1, 1)
  , col = c("black", "red", "blue")
)
dev.off() 
#dev.print(png, file = "plot3.png", width = 480, height = 480)

