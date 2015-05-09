#Read file from site and unzip
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="c:/DataScienceFiles/DataScience_Project/ex-data-household_power_consumption.zip")
unzip("c:/DataScienceFiles/DataScience_Project/ex-data-household_power_consumption.zip",overwrite=TRUE,unzip="internal")

#reading in data
myData <- read.table("./household_power_consumption.txt",header=T,sep=";",na.strings="?")

#converting to datetype
myData$Date <- as.Date(myData$Date, format = "%d/%m/%Y")

#subsetting data
myData <- subset(myData,myData$Date=="2007-02-01" | myData$Date=="2007-02-02")

#creating datetime value
myData$DateTime <- as.POSIXct(paste(myData$Date,myData$Time), format="%Y-%m-%d %H:%M:%S")

#creating png file
png(file="plot3.png",width=480,height=480)

#plotting chart
plot(myData$DateTime,myData$Sub_metering_1,
     type="n",
     #pch=20,
     xlab=NA,
     ylab="Energy sub metering")
lines(myData$DateTime,myData$Sub_metering_1)
lines(myData$DateTime,myData$Sub_metering_2,col="red")
lines(myData$DateTime,myData$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

#closing png file
dev.off()

     

