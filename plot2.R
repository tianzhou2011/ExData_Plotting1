rawfile <- file("household_power_consumption.txt","r")
cat(grep("(^Date)|(^[1|2]/2/2007)",readLines(rawfile),value=TRUE),sep="\n",file="filtered.txt")
close(rawfile)
data=read.csv2("filtered.txt",header=TRUE,stringsAsFactors=F)

x<-paste(data$Date,data$Time)
x<-as.POSIXct(strptime(x,"%d/%m/%Y %H:%M:%S"))
png("plot2.png",width=480,height=480)
plot(x,as.numeric(data$Global_active_power),type="l",ylab="Global Active Power(kilowatts)",xlab="")

dev.off()

file.remove("filtered.txt")

