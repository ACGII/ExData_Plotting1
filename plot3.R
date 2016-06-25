library(dplyr)
library(data.table)
library(tidyr)
library(lubridate) 
library(magrittr)
#install.packages("xlsx", dependencies=TRUE)
library(chron)
library(ggplot2) 
#library(xlsx)

#plot3.R
## We will only be using data from the dates 2007-02-01 and 2007-02-02. 
##One alternative is to read the data from just those dates rather than
##reading in the entire dataset and subsetting to those dates.


plot3<-function(){
setwd("C:/Albert/Coursera/Exploratory Data Analysis/Project 1")
dataFile <- "household_power_consumption.txt"
hpc <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
hpcSubSet <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(hpcSubSet$Date, hpcSubSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sm1<-hpcSubSet$Sub_metering_1
sm2<-hpcSubSet$Sub_metering_2
sm3<-hpcSubSet$Sub_metering_3
png("plot3.png", width=480, height=480)
plot(datetime, sm1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime,sm2,lty=1,col="red")
lines(datetime,sm3,lty=1,col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
  lty=1, col=c("black","red", "blue"), bty="o", box.lty=1, box.lwd=1, box.col="black")



dev.off()
plot(datetime, sm1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime,sm2,col="red")
lines(datetime,sm3,col="blue") 
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
  lty=1, col=c("black","red", "blue"), bty="o", box.lty=1, box.lwd=1, box.col="black")


}