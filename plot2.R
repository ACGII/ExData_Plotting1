library(dplyr)
library(data.table)
library(tidyr)
library(lubridate) 
library(magrittr)
#install.packages("xlsx", dependencies=TRUE)
library(chron)
library(ggplot2) 
#library(xlsx)
	
#plot2.R
## We will only be using data from the dates 2007-02-01 and 2007-02-02. 
##One alternative is to read the data from just those dates rather than 
##reading in the entire dataset and subsetting to those dates.
plot2<-function(){
setwd("C:/Albert/Coursera/Exploratory Data Analysis/Project 1")
dataFile <- "household_power_consumption.txt"
hpc <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
hpcSubSet <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(hpcSubSet$Date, hpcSubSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(hpcSubSet$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
}

