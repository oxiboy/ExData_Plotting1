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
plot(input$timestap,input$Global_active_power,type = 'l',xlab = 'Day',ylab = "Global Active Power (kilowatts)",col='red')
title(main = "Global Active Power Vs Time")
dev.copy(png,file='plot2.png')
dev.off()