library(sqldf)

sql <- "SELECT * from file WHERE Date='1/2/2007' or Date='2/2/2007'"
myData <- read.csv2.sql("household_power_consumption.txt", sql)

myData$datetime <- as.POSIXct(paste(myData$Date, myData$Time),format="%d/%m/%Y %H:%M:%S")

png(filename="plot3.png",width=480,height=480)
par(mar = c(5,5,2,2))
plot(x=myData$datetime, y=myData$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")

points(x=myData$datetime,y=myData$Sub_metering_1,pch=".",type="o")
points(x=myData$datetime,y=myData$Sub_metering_2,pch=".",type="o",col="red")
points(x=myData$datetime,y=myData$Sub_metering_3,pch=".",type="o",col="blue")

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pch="_",col=c("black","red","blue"))

#dev.copy(png, file = "plot3.png")
dev.off()