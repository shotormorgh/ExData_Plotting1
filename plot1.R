plot1 <- function(){
      
      ## Read the data file
      data <- read.table("household_power_consumption.txt",
                        na.strings = "?", 
                        header=TRUE,
                        sep=";")
      
      ## Make the date column be a Date class for easier subsetting
      data <- transform(data, Date = as.Date(Date, "%d/%m/%Y"))
      
      ## just grab rows for the two days we are interested in
      data <-data[data$Date == "2007-02-01" | data$Date =="2007-02-02",]
      
      ## Create a histogram
      hist(data2$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
      
      ##  Copy to a local PNG file
      dev.copy (png, file="./plot1.png")
      
      ## Close device (complete the file creation)
      dev.off()
      
      ## Return the data set
      data
}