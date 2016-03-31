library(shiny)
library(shinydashboard)
library(reshape2)
library(DT)
library(dplyr)
library(dygraphs)
library(xts)
library(stringi)
library(ggplot2)
setwd("D:/Stock Analytics")
data = read.csv("sandp_complete_data.csv",stringsAsFactors=F)
#str(data)

#TRIN
data$trin = (data$Adv/data$Dec)/(data$Adv.Vol/data$Dec.Vol)

#A/D LINE
data$netadv = data$Adv - data$Dec
head(data$netadv)
data$netadv[is.na(data$netadv)] <-0

data$adline = c(data$netadv[1],rep(NULL,(nrow(data)-1)))
