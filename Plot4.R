library(tidyverse)
library(lubridate)
library(readr)

#Load data

base = read_delim("household_power_consumption.txt", 
                  ";", escape_double = FALSE, trim_ws = TRUE)

base = base %>% 
  mutate(date = as.Date(Date,"%d/%m/%Y"))  %>% 
  filter(date>="2007-02-01",date<="2007-02-02" ) 


base = base %>% mutate(
  date_entera = paste(Date,Time, sep=" "),
  date_entera_ = dmy_hms(date_entera))


par(mfrow = c(2, 2))

plot(base$date_entera_,base$Global_active_power, 
     type="line",
     xlab = "",
     ylab= "Global Active Power")


plot(base$date_entera_,base$Voltage, 
     type="line",
     xlab = "datetime",
     ylab= "Voltage")


plot(base$date_entera_,base$Sub_metering_1, 
     type="line",
     xlab = "",
     ylab= "Energy sub metering")

lines(base$date_entera_,base$Sub_metering_2, col="red")
lines(base$date_entera_,base$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col = c("black", "red", "blue"), cex = 0.5,lwd=1)

plot(base$date_entera_,base$Global_reactive_power, 
     type="line",
     xlab = "datetime",
     ylab= "Global_reactive_power")


dev.copy(png,'plot4.png')
dev.off()

