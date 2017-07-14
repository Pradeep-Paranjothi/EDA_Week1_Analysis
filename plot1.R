#Exploratory Data Analysis: Assignment1
# Load dataset into R
library(ggplot2)
library(dplyr)

#set working directory
setwd("C:/MyDocs/KM/OTHERS/Coursera/JHU_DataScience_Specialization/Course4_Exploratory Data Analysis/Week1/exdata_data_household_power_consumption")

#Read raw data
raw_data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
raw_data$Date <- as.Date(raw_data$Date, format="%d/%m/%Y")

## Filter data for required dates
plot_data<-filter(raw_data,Date >= "2007-02-01" & Date <= "2007-02-02")
rm(raw_data)


## Converting dates
datetime <- paste(as.Date(plot_data$Date), plot_data$Time)
plot_data$Datetime <- as.POSIXct(datetime)

## Plot 1 - Histogram
hist(plot_data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save plot to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

