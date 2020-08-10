#plot 3
#dowload the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",'datos.zip')
#unzip data
unzip('datos.zip')
data<-read.table("household_power_consumption.txt",sep = ";",na.strings = "?",header = T)
#taking the data that we need
input<-data[data$Date =='1/2/2007' | data$Date =='2/2/2007',]
input$timestap=paste(input$Date,input$Time)
input$timestap=strptime(input$timestap, "%d/%m/%Y %H:%M:%S")
#plot all of the graphics
plot(input$timestap,input$Sub_metering_1,type="n",xlab="Day",ylab="Energy sub metering")
with(input,lines(timestap,Sub_metering_1,col="blue"))
with(input,lines(timestap,Sub_metering_2,col="green"))
with(input,lines(timestap,Sub_metering_3,col="orange"))
title(main = "Global Active Power Vs Time")
legend("topright", lty=1, col=c("blue","green","orange"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file='plot3.png')
dev.off()