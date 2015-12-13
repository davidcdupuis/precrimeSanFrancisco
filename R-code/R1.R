#------------------------------------------------------------------------
#    This script allows us to create a visual representation of San Francisco
#------------------------------------------------------------------------
library(ggplot2)#already compiled in version R 3.1.3
library(ggmap)
library(sqldf)
library(RMySQL)

#--------------------------------   
#   Set the working directory
#-------------------------------- 
setwd("C:/Users/David Dupuis/Desktop/School/ESILV/Semestre 9/PI2-A5")

#------------------------------------
# Connect to database with data
#------------------------------------
mydb = dbConnect(MySQL(), user='root', password='', dbname='sanfranciscocrime', host='localhost')

#send request to MySQL

bayview = dbSendQuery(mydb, "Select * From train Where PdDistrict = 'BAYVIEW'")     
central = dbSendQuery(mydb, "Select * From train Where PdDistrict = 'CENTRAL'")     
ingleside = dbSendQuery(mydb, "Select * From train where PdDistrict ='INGLESIDE'")   
mission = dbSendQuery(mydb, "Select * From train Where PdDistrict = 'MISSION'")      
northern = dbSendQuery(mydb, "Select * From train Where PdDistrict = 'NORTHERN'")  
park = dbSendQuery(mydb, "Select * From train Where PdDistrict = 'PARK'")           
richmond = dbSendQuery(mydb, "Select * From train Where PdDistrict = 'richmond'")    
southern = dbSendQuery(mydb, "Select * From train WHERE PdDistrict = 'SOUTHERN'")   
taraval = dbSendQuery(mydb, "Select * From train Where PdDistrict = 'TARAVAL'")     
tenderloin = dbSendQuery(mydb, "Select * From train WHERE PdDistrict = 'TENDERLOIN'")

# retrieving the data from MySQL
bayview_data = fetch(bayview, n=-1)
central_data = fetch(central, n=-1)
ingleside_data = fetch(ingleside, n=-1)
mission_data = fetch(mission, n=-1)
northern_data = fetch(northern, n=-1) 
park_data = fetch(park, n=-1)
richmond_data = fetch(richmond, n=-1)
southern_data = fetch(southern, n=-1)
taraval_data = fetch(taraval, n=-1)
tenderloin_data = fetch(tenderloin, n=-1)

#------------------------------
#  We need to generate the San Francisco map
#------------------------------
sfMap <- get_map("San Francisco", zoom = 12, color = "bw")


#-------------------------------
#   Show San Francisco map with data
#--------------------------------
ggmap(sfMap) +
  geom_point(data=bayview_data,aes(x=bayview_data$X, y=bayview_data$Y), alpha=0.05, colour="darkred") +
  geom_point(data=central_data,aes(x=central_data$X, y=central_data$Y), alpha=0.05, colour="red") +
  geom_point(data=ingleside_data,aes(x=ingleside_data$X, y=ingleside_data$Y), alpha=0.05, colour="chocolate") +
  geom_point(data=mission_data,aes(x=mission_data$X, y=mission_data$Y), alpha=0.05, colour="green") +
  geom_point(data=northern_data,aes(x=northern_data$X, y=northern_data$Y), alpha=0.05, colour="blue") +
  geom_point(data=park_data,aes(x=park_data$X, y=park_data$Y), alpha=0.05, colour="darkgreen") +
  geom_point(data=richmond_data,aes(x=richmond_data$X, y=richmond_data$Y), alpha=0.05, colour="gold") +
  geom_point(data=southern_data,aes(x=southern_data$X, y=southern_data$Y), alpha=0.05, colour="orange") +
  geom_point(data=taraval_data,aes(x=taraval_data$X, y=taraval_data$Y), alpha=0.05, colour="darkblue") +
  geom_point(data=tenderloin_data,aes(x=tenderloin_data$X, y=tenderloin_data$Y), alpha=0.05, colour = "darkorchid") +
  #scale_colour_brewer(type="qual",palette="Paired") + 
  ggtitle("San Francisco Crimes") +
  theme_light(base_size=20) +
  theme(axis.line=element_blank(),
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks=element_blank(),
        axis.title.x=element_blank(),
        axis.title.y=element_blank())

