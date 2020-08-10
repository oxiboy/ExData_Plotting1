#plot 1
#dowload the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",'datos.zip')
#unzip data
unzip('datos.zip')
data<-read.table("household_power_consumption.txt",sep = ";",na.strings = "?",header = T)
#taking the data that we need
input<-data[data$Date =='1/2/2007' | data$Date =='2/2/2007',]
hist(input$Global_active_power,main = "Global Activity Power",col = "blue",xlab = 'Gobal Activity Power(kilowatts)')
dev.copy(png,file='plot1.png')
dev.off()