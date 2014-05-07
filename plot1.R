library(sqldf)

sql <- "SELECT * from file WHERE Date='1/2/2007' or Date='2/2/2007'"
myData <- read.csv2.sql("household_power_consumption.txt", sql)

par(mar = c(5,5,2,2))
hist(myData$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

dev.copy(png, file = "plot1.png")
dev.off()