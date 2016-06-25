# Libraries
library(dplyr)
library(data.table)
library(tidyr)
library(lubridate) 
library(magrittr)
#install.packages("xlsx", dependencies=FALSE)
#library(xlsx)
library(chron)
library(ggplot2) 



#Plot1.R
## We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to 
#read the data from just those dates rather than reading in the entire dataset and
# subsetting to those dates

plot1<-function(){
setwd("C:/Albert/Coursera/Exploratory Data Analysis/Project 1")
dataFile <- "household_power_consumption.txt"
hpc <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
hpcSubSet <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]

png("plot1.png", 480, 480)
gap.ob<- hist( as.numeric(hpcSubSet$Global_active_power))
plot(gap.ob,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()
plot(gap.ob,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

}