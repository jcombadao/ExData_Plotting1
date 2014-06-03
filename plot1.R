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

#plot 1
png(filename = "plot1.png", width = 480, height = 480)

hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

