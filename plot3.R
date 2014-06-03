raw.data <- read.csv(
    unz("exdata-data-household_power_consumption.zip","household_power_consumption.txt"),
    sep=";",colClasses=c(
        "character","character","numeric","numeric","numeric"
        ,"numeric","numeric","numeric","numeric"),
    na.strings=c("?"))
index <- grep("^[12]/0?2/2007",raw.data$Date)
raw.data<- raw.data[index,]
raw.data$datetime <- strptime(paste(raw.data$Date,raw.data$Time),"%d/%m/%Y %H:%M:%S")
raw.data$Date <- NULL
raw.data$Time <- NULL
png(file="plot3.png",width=480,height=480,bg="transparent")
with(raw.data,plot(datetime,Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab=""))
with(raw.data,lines(datetime,Sub_metering_2,type="l",col="red"))
with(raw.data,lines(datetime,Sub_metering_3,type="l",col="blue"))
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"))
dev.off()