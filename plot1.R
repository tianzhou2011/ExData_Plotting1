rawfile <- file("household_power_consumption.txt","r")
cat(grep("(^Date)|(^[1|2]/2/2007)",readLines(rawfile),value=TRUE),sep="\n",file="filtered.txt")
close(rawfile)
data=read.csv2("filtered.txt",header=TRUE,stringsAsFactors=F)
png("plot1.png",width=480,height=480)
hist(as.numeric(data$Global_active_power),xlab="Global Active Power(killowatts)",ylab="Frequency",main="Global Active Power",col="Red")
dev.off()

file.remove("filtered.txt")


