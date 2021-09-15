# # Clear plots
# dev.off()  # But only if there IS a plot

# Clear console
cat("\014")  # ctrl+L

# Clear Env.
rm(list = ls())

Data <- read.table("household_power_consumption.txt",sep=";", header = TRUE)
Data$Date <- as.Date(Data$Date,format = "%d/%m/%Y")

Selected_Dates <- as.Date(c("01/02/2007","02/02/2007"),format = "%d/%m/%Y")
Data <- Data[Data$Date %in% Selected_Dates,]
str(Data)

png("plot1.png",width=480,height=480)
hist(as.numeric(Data$Global_active_power),col="red",
     xlab="Global Active Power(kilowatts)",main = "Global Active Power")
dev.off()

