#because local system was in Portuguese days would appear in portuguese
Sys.setlocale("LC_TIME", "C")

#read the data
setwd("D:/Users/jcombadao/Google Drive/onlineclass/coursera/Data Science Specialization/Exploratory Data Analysis/week1")
electric_data <- read.csv(unz("exdata-data-household_power_consumption.zip","household_power_consumption.txt"),header = T,sep = ";",na.strings="?")

#transform the data as time
dates <- electric_data$Date
times <- electric_data$Time
x <- paste(dates, times)
electric_data$Time<-strptime(x, "%d/%m/%Y %H:%M:%S")

#transform the data as date
electric_data$Date<-as.Date(electric_data$Date, "%d/%m/%Y")

#subset the data to the two days of interest
data<-subset(electric_data,Date=="2007-02-01" | Date=="2007-02-02")



#plot 4
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

#graph 4.1
plot(data$Time,data$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="l")

#graph 4.2
plot(data$Time,data$Voltage,ylab="Voltage",xlab="datetime",type="l")

#graph 4.3
plot(data$Time,data$Sub_metering_1,ylab="Energy sub metering",xlab="",type="l")
lines(data$Time,data$Sub_metering_2,col="red")
lines(data$Time,data$Sub_metering_3,col="blue")
legend('topright',lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

#graph 4.4
plot(data$Time,data$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="l")

dev.off()
