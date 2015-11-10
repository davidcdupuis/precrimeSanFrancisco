library(weatherData)
library(plyr)

//fonctionne
 d3<- getWeatherForDate("KSFO", start_date="2004-01-01",
                         end_date = "2015-06-06",
                         opt_detailed = TRUE,
                         opt_all_columns = TRUE)

//fonctionne pas						 
d4<- getWeatherForDate("KCASANFR500", start_date="2004-01-01",
                       end_date = "2015-06-06",
                       station_type="id",
                       opt_detailed = TRUE,
                       opt_all_columns = TRUE)

//save in file					   
write.table(d3, file = "MyData.csv",row.names=FALSE, na="",col.names=TRUE, sep=";")