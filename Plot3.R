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


plot(base$date_entera_,base$Sub_metering_1, 
     type="line",
     xlab = "",
     ylab= "Energy sub metering",
     legend=T)
lines(base$date_entera_,base$Sub_metering_2, col="red")
lines(base$date_entera_,base$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       lwd = 1, col = c("black", "red", "blue"),cex=0.8)


dev.copy(png,'plot3.png')
dev.off()
