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

png("plot2.png",width=480,height=480)
with(Data,plot(Data$DateTime,as.numeric(Global_active_power),
     ylab="Global Active Power(kilowatts)",xlab="",type = "l"))
dev.off()

