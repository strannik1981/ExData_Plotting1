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
png(file="plot2.png",width=480,height=480,bg="transparent")
plot(raw.data$datetime,raw.data$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
