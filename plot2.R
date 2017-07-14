#Read raw plot_data
raw_data <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
raw_data$Date <- as.Date(raw_data$Date, format="%d/%m/%Y")

## Filter data for required dates
plot_data<-filter(raw_data,Date >= "2007-02-01" & Date <= "2007-02-02")
rm(raw_data)

##convert data formats
datetime <- paste(as.Date(plot_data$Date), plot_data$Time)
plot_data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(plot_data$Global_active_power~plot_data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()