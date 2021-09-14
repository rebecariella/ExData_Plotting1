


library(tidyverse)
library(lubridate)
library(readr)

#Load data

base = read_delim("household_power_consumption.txt", 
                   ";", escape_double = FALSE, trim_ws = TRUE)

base = base %>% 
  mutate(date = as.Date(Date,"%d/%m/%Y"))  %>% 
  filter(date>="2007-02-01",date<="2007-02-02" ) 

hist(base$Global_active_power, 
     col="red",
     main="Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.copy(png,'plot1.png')
dev.off()