
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

plot(base$date_entera_,base$Global_active_power, 
     type="line",
     xlab = "",
     ylab= "Global Active Power (kilowatts)")

dev.copy(png,'plot2.png')
dev.off()