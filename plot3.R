plot3 <- function(){
      
      ## Read the data file
      data <- read.table("household_power_consumption.txt",
                        na.strings = "?", 
                        header=TRUE,
                        sep=";")
      
      ## Make the date column be a Date class for easier subsetting
      data <- transform(data, Date = as.Date(Date, "%d/%m/%Y"))
      
      ## just grab rows for the two days we are interested in
      data <-data[data$Date == "2007-02-01" | data$Date =="2007-02-02",]
      
      ## Create a new column that has both date and time in it
      data$DateTime <- with(data, as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M"))
      
      ## Create the PNG device file
      png ("plot3.png")
      
      ## Create a plot by adding different lines
      plot(data$Sub_metering_1~data$DateTime, xlab="", type="l", ylab="Energy sub metering")
      lines(data$Sub_metering_2~data$DateTime, xlab="", type="l", col="red")
      lines(data$Sub_metering_3~data$DateTime, xlab="", type="l", col="blue")      
      
      legend("topright", col=c("black", "red", "blue"), 
             legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
             lty=1)      
      
      ##  Copy to a local PNG file
      ##dev.copy (png, file="./plot3.png")
      
      ## Close the device (complete the file creation)
      dev.off()
      
      ## Return the data set
      data
}