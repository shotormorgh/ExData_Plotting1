plot2 <- function(){
      
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
      
      ## Create a linear plot
      plot(data$Global_active_power~data$DateTime, xlab="",ylab="Global Active Power (kilowatts)", type="l")
      
      ##  Copy to a local PNG file
      dev.copy (png, file="./plot2.png")
      
      ## Close the device (complete the file creation)
      dev.off()
      
      ## Return the data set
      data
}