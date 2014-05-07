library(sqldf)

sql <- "SELECT * from file WHERE Date='1/2/2007' or Date='2/2/2007'"
myData <- read.csv2.sql("household_power_consumption.txt", sql)

myData$datetime <- as.POSIXct(paste(myData$Date, myData$Time),format="%d/%m/%Y %H:%M:%S")

par(mar = c(5,5,2,2))
plot(x=myData$datetime, y=myData$Global_active_power, pch=".", type="o", xlab="", ylab="Global Active Power(kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()