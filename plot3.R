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



#plot 3
png(filename = "plot3.png", width = 480, height = 480)

plot(data$Time,data$Sub_metering_1,ylab="Energy sub metering",xlab="",type="l")
lines(data$Time,data$Sub_metering_2,col="red")
lines(data$Time,data$Sub_metering_3,col="blue")
legend('topright',lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.off()

