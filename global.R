setwd("D:/Stock Analytics")
data = read.csv("s&p2016.csv",stringsAsFactors=F)
str(data)
# data$prev_close = c(data$Close[1],data$Close[1:nrow(data)])
# data$Advance = data$Close - data$prev_close
