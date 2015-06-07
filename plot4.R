plot4 <- function(){
      
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
      png ("plot4.png")

      ## Create a 2 x 2 plot area
      par (mfrow=c(2,2))
      
      
      ## Add the plots
      with (data, {
            ## Create a active power  plot
            plot(data$Global_active_power~data$DateTime, cex.lab=0.75, xlab="",ylab="Global Active Power", type="l")

            ## Create a voltage  plot
            plot(data$Voltage~data$DateTime, xlab="datetime",ylab="Voltage", type="l", cex.lab=0.75)
            
            
            ## Create a submetering plot by adding different lines
            plot(data$Sub_metering_1~data$DateTime, xlab="", type="l", ylab="Energy sub metering")
            lines(data$Sub_metering_2~data$DateTime, xlab="", type="l", col="red")
            lines(data$Sub_metering_3~data$DateTime, xlab="", type="l", col="blue", cex.lab=0.75)      
            
            legend("topright", col=c("black", "red", "blue"), 
                   legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
                   lty=1, cex=0.5)      
 
            ## Create a voltage  plot
            plot(data$Global_reactive_power~data$DateTime, xlab="datetime",ylab="Global_reactive_power", type="l", cex.lab=0.75)
            
            
      })
      
      
      
      ##  Copy to a local PNG file
      ##dev.copy (png, file="./plot4.png")
      
      ## Close the device (complete the file creation)
      dev.off()
      
      ## Return the data set
      data
}