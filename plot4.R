# # Clear plots
# dev.off()  # But only if there IS a plot

# Clear console
cat("\014")  # ctrl+L

# Clear Env.
rm(list = ls())

Data <- read.table("household_power_consumption.txt",sep=";", header = TRUE)
Data$DateTime <- as.POSIXct(paste(Data$Date, Data$Time), format="%d/%m/%Y %H:%M:%S")
Data$Date <- as.Date(Data$Date,format = "%d/%m/%Y")

Selected_Dates <- as.Date(c("01/02/2007","02/02/2007"),format = "%d/%m/%Y")
Data <- Data[Data$Date %in% Selected_Dates,]

png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))

with(Data,plot(DateTime,as.numeric(Global_active_power),
               ylab="Global Active Power(kilowatts)",xlab="",type = "l"))


with(Data,plot(DateTime,as.numeric(Voltage),ylab="Voltage",xlab="datetime",type = "l"))


plot(Data$DateTime,as.numeric(Data$Sub_metering_1),col="black",type = "l",
     ylab="Energy sub metering",xlab="" )
lines(Data$DateTime,as.numeric(Data$Sub_metering_2),col="red")
lines(Data$DateTime,as.numeric(Data$Sub_metering_3),col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"),lty=c(1,1,1))


with(Data,plot(DateTime,as.numeric(Global_reactive_power),ylab="Global_reactive_power",
               xlab="datetime",type = "l"))

dev.off()

