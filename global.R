library(shiny)
library(shinydashboard)
library(reshape2)
library(DT)
library(dplyr)
library(dygraphs)
library(xts)
library(stringi)


#source("methods.R")
#source("linechart.R")
#source("dashboardWidgets.R")
#source("barchart.R")
#source("constants.R")
# source("test.R")



library(IIPR)
IIP.init()

Sparkconnection<-IIP.JDBCConnection("iipadmin","$I1i2p3$")
# data<-dbGetQuery(Sparkconnection,"select * from tbl_Vehicle_InputParams_V2 limit 10")
chiller_data<-dbGetQuery(Sparkconnection,"select * from TVM_10MIN_NEW")
chiller_info<-dbGetQuery(Sparkconnection,"select * from CHL_DETAILS")
# chiller_data = subset(chiller_data, as.Date(strptime(chiller_data$Time,format = "%Y-%m-%d %H:%M"))>as.Date("2015-01-01",format = "%Y-%m-%d") &
#                 as.Date(strptime(chiller_data$Time,format = "%Y-%m-%d %H:%M"))<as.Date("2015-07-01",format = "%Y-%m-%d") & chiller_data$XFLA > 0.1 )
            #  print(data.frame(temp$Time,temp$CHW_STD))
#chiller_data = subset(chiller_data, chiller_data$BMS_ikWTR<1 & chiller_data$BMS_ikWTR>0)


#print(head(chiller_data))
#print(names(chiller_data))

# chiller_data1 = subset(chiller_data, as.Date(chiller_data$Time) >= as.Date("2015-01-01",format = "%Y-%m-%d") & as.Date(chiller_data$Time) <= as.Date("2015-01-31",format = "%Y-%m-%d") )
# print ((chiller_data1$ChillerInputkWH))
#print (chiller_info)
dbDisconnect(Sparkconnection)


#library(DBI)
#library(rJava)
#library(RJDBC)
#hive_lib = paste0(Sys.getenv("HIVE_HOME"),"/lib/hive-jdbc-0.14.0-standalone.jar", sep="/")
#hadoop_lib = paste0(Sys.getenv("HADOOP_HOME"),"/share/hadoop/common/hadoop-common-2.4.1.jar")
#cp =c(hive_lib, hadoop_lib)
#.jinit(classpath = cp)
#drv <- JDBC("org.apache.hive.jdbc.HiveDriver",hive_lib,identifier.quote="'")

#IIP.hiveConnection <- function(username, password)
#{
#  connection <- dbConnect(drv, "jdbc:hive2://10.188.73.70:10001/Vale_final",username,password)
#  connection
#}


#IIP.sqlConnection<-function(username,password)
#{
#  .jinit()
#  options( java.parameters = "-Xmx8g" )
#  for(l in list.files(Sys.getenv("RJDBC_JARS"))){ .jaddClassPath(paste(Sys.getenv("RJDBC_JARS"),l,sep=""))}
#  sql_drv <- JDBC("com.mysql.jdbc.Driver",paste0(Sys.getenv("RJDBC_JARS"),"mysql-connector-java-5.1.31.jar"))
#  sql_con <- dbConnect(sql_drv, "jdbc:mysql://10.188.73.70:3306/vale",  username, password)
#  sql_con      
#}


#   connection <- IIP.hiveConnection("iipadmin","iipadmin")
#   sqlText <- paste("select transcurrentgear,parkingbrakeswitch,gpsx,gpsy,gpsz,acclx,accly,acclz,acclpedalpos,parkingbrakepos,slopegrade,engspeed,fuelrate,engine_boost_pressure,hydpressboomup,instant_fuel,instant_distance,engineoilpressure,engineoiltemp,enginecoolanttemp,tirepressurerr,tirepressurerl,tirepressurefr,tirepressurefl,hydraulicstemperature,fuellevel from vale_82_full_CompleteData limit 1")
#   data1 <- dbGetQuery(connection, sqlText)
#   sqlText <- paste0("select vehicle_id from vale_vehicle")
#   vehicleInfo <- dbGetQuery(connection, sqlText)
#   dbDisconnect(connection)

#   vehicleHealthThresholds <- getVehicleHealthThresholds(337)


#    vehicleInfo <- read.csv("/home/ec2-user/OneClickProvision_1.0.3/Vehicle_Info_Generic.csv")

