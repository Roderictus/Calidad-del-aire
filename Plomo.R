# Bajar datos de calidad del aire 
# Plomo 
#http://www.aire.cdmx.gob.mx/descargar.php?file=b3BlbmRhdGEvcmVkX21hbnVhbC9yZWRfbWFudWFsX3Bsb21vLmNzdg==
library(readxl)
library(tidyverse)
library(lubridate)


Plomo <-read.csv(file = "./red_manual_plomo.csv", header = TRUE, 
                 skip = 8, sep = ",")
print(Plomo)
head(Plomo)
Plomo$Date <- dmy(Plomo$Date)
table(Plomo$cve_station)
table(Plomo$cve_parameter)

ggplot(data = Plomo, aes(x = Date, y = value) + geom_line())

Plomo %>%  
  filter(Date >= "2010-01-01") %>%
  ggplot(aes(x=Date, y = value)) + 
  geom_line() +
  aes(col = fct_rev(cve_station)) +
  facet_grid(rows = vars(cve_station), cols = vars(cve_parameter))




Plomo %>% filter(Date >= "2015-01-01", cve_station == "CES", cve_parameter == "PbPM10") %>% 
  ggplot(aes(x=Date, y = value)) + 
  geom_dotplot() 

class(Plomo$cve_parameter)

