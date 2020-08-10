#plot 2
#dowload the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",'datos.zip')
#unzip data
unzip('datos.zip')
data<-read.table("household_power_consumption.txt",sep = ";",na.strings = "?",header = T)
#taking the data that we need
input<-data[data$Date =='1/2/2007' | data$Date =='2/2/2007',]
input$timestap=paste(input$Date,input$Time)
input$timestap=strptime(input$timestap, "%d/%m/%Y %H:%M:%S")
#make the 4 plots
par(mfrow=c(2,2))
hist(input$Global_active_power,main = "Global Activity Power",col = "blue",xlab = 'Gobal Activity Power(kilowatts)')
plot(input$timestap,input$Global_active_power,type = 'l',xlab = 'Day',ylab = "Global Active Power (kilowatts)",
     col='red',main = "Global Active Power Vs Time")
plot(input$timestap,input$Sub_metering_1,type="n",xlab="Day",ylab="Energy sub metering")
with(input,lines(timestap,Sub_metering_1,col="blue"))
with(input,lines(timestap,Sub_metering_2,col="green"))
with(input,lines(timestap,Sub_metering_3,col="orange"))
title(main = "Global Active Power Vs Time")
legend("topright", lty=1, col=c("blue","green","orange"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(input$timestap,input$Global_reactive_power,xlab="Day",ylab="Global Reactive Power",type = "l")
title(main = "Global Reactive Power")
dev.copy(png,file='plot4.png')
dev.off()