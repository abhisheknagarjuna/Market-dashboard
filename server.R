shinyServer(function(input, output) {

  
  output$trinplot <- renderDygraph({
    print("Hello")
    library(dygraphs)
    lungDeaths <- cbind(mdeaths, fdeaths)
    dygraph(lungDeaths)
  })
    
    output$text1 <- renderText({ 
      "You have selected this"
    })
    
#     finalData <- xts(data$trin, as.POSIXct(data$time, format="%m/%d/%Y"))
#     #      finalData <- xts(plotData[,parameters], as.POSIXct(plotData$Time, format="%d-%m-%Y %H:%M"), tz = TZ)      
#     dygraph(finalData, main = "", xlab = "Date") %>% 
#       #       dygraph(finalData, main = "Chiller Playback", xlab = "Timestamp" ,height = "1000px") %>%
#       #           dySeries(parametersY2Axis, axis = 'y2') %>%
#       dyRangeSelector() 


  
})
