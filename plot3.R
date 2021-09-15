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

png("plot3.png",width=480,height=480)
plot(Data$DateTime,as.numeric(Data$Sub_metering_1),col="black",type = "l",
     ylab="Energy sub metering",xlab="" )
lines(Data$DateTime,as.numeric(Data$Sub_metering_2),col="red")
lines(Data$DateTime,as.numeric(Data$Sub_metering_3),col="blue")

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"),lty=c(1,1,1))

dev.off()

