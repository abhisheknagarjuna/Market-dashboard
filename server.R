# Market-dashboard


shinyServer(function(input, output, session) {
#   # 
#   #   #-----------------------------Vehicle Information---------------------------------- 
#   output$chiller_info <- renderUI({
#     ChillerID <-  input$Chiller_ID
#     
#     chillerdetails_final <- chiller_details[chiller_info$Chiller_ID == ChillerID,]
#     
#     
#     tags$table(style= "width : 100%",
#                tags$tr( 
#                  tags$td(p("Location : ")),
#                  tags$td(p(chillerdetails_final$Location))
#                ),
#                tags$tr(
#                  tags$td(p("Type of Chiller: ")),
#                  tags$td(p(chillerdetails_final$Type))
#                ),
#                tags$tr(
#                  tags$td(p("Capacity : ")),
#                  tags$td(p(chillerdetails_final$Capacity))
#                )
#     )
#     #     
#   })
#   #   
#   #    
#   #   #----------------------------Vehicle Health  ----------------------------------------------------------------------------------
#   # 
#   #  
#   #  
#   # #  lastSelectedVehicleId <- 0
#   # observe({
#   #   vehicleHealthVehicleId <- input$vehicelID
#   # #   if(vehicleHealthVehicleId != lastSelectedVehicleId)
#   # #     lastSelectedVehicleId <- vehicleHealthVehicleId
#   #      
#   # #   vehicleHealthStatusData <- getVehicleHealthStatusData(vehicleHealthVehicleId)
#   # #   vehicleHealthDetailsData <- getVehicleHealthDetailsData(vehicleHealthVehicleId)
#   # #   vehicleHealthThresholdsData <- getVehicleHealthThresholds(vehicleHealthVehicleId)
#   # 
#   #   Enginespeed <- vehicleHealthStatusData$engspeed
#   #   parkingbreakposition <- vehicleHealthStatusData$parkingbrakepos
#   # 
#   #   
#   #   fuelLevel <- round(mean(vehicleHealthDetailsData$fuellevel),2)
#   #   EngineOilPressure <- mean(vehicleHealthDetailsData$EngineOilPressure)
#   #   hydraulicsTemperature <- mean(vehicleHealthDetailsData$hydraulicstemperature)
#   #   tirePressureRR <- mean(vehicleHealthDetailsData$tirepressurerr)
#   #   tirePressureRL <- mean(vehicleHealthDetailsData$tirepressurerl)
#   #   tirePressureFR <- mean(vehicleHealthDetailsData$tirepressurefr)
#   #   tirePressureFL <- mean(vehicleHealthDetailsData$tirepressurefl)
#   # 
#   # 
#   #   if(Enginespeed > vehicleHealthThresholdsData$Enginespeed && parkingbreakposition != vehicleHealthThresholdsData$parkingbreakposition){
#   #     status <- c("Active","green","thumbs-o-up")
#   #   } else {
#   #     status <- c("Inactive", "red", "thumbs-o-down")
#   #   }
#   #   
#   #    
#   #   if (EngineOilPressure < vehicleHealthThresholdsData$EngineOilPressureGood) {
#   #     engineOil <- c("Good", "green")
#   #   } else if (EngineOilPressure < vehicleHealthThresholdsData$EngineOilPressureAvg) {
#   #     engineOil <- c("Average", "yellow")
#   #   } else {
#   #     engineOil <- c("Needs change", "red")
#   #   }
#   #   
#   #   if (hydraulicsTemperature < vehicleHealthThresholdsData$hydraulicsTemperatureGood) {
#   #     hydraulicsTemp <- c("Good", "green")
#   #   } else if (hydraulicsTemperature < vehicleHealthThresholdsData$hydraulicsTemperatureAvg) {
#   #     hydraulicsTemp <- c("Average", "yellow")
#   #   } else {
#   #     hydraulicsTemp <- c("High", "red")
#   #   }
#   #   
#   #   
#   #   if(tirePressureRR > vehicleHealthThresholdsData$tirePressureRR & tirePressureRL > vehicleHealthThresholdsData$tirePressureRL & vehicleHealthThresholdsData$tirePressureFR > tirePressureFR & tirePressureFL > vehicleHealthThresholdsData$tirePressureFL){
#   #     tirePressure <- c("Good","green")
#   #   } else{
#   #     tirePressure <- c("Low","red")
#   #   }
#   # 
#   #   vhDate <- substr(vehicleHealthStatusData$timestamp1,1,nchar(vehicleHealthStatusData$timestamp1)-2)
#   # 
#   #   #Vehicle Health Date
#   #   output$vehicleHealthDate <- renderInfoBox({
#   #     infoBox(
#   #       title = '',value = "As On Date",subtitle = vhDate,icon = icon("calendar"),
#   #       color = "teal"
#   #     )
#   #   })
#   # 
#   #   #Vehicle Status
#   #   output$statusBox <- renderInfoBox({ 
#   #     infoBox(
#   #       "Status", status[1], icon = icon(status[3]),
#   #       color = status[2]
#   #     )
#   #   })
#   # 
#   #   # Fuel Level  
#   #   output$fuelLevel <- renderFuelLevel({
#   #     fuelLevel <- list("FuelLevel"= fuelLevel,"Low" = vehicleHealthThresholdsData$FuelLevelLow, "Avg" =vehicleHealthThresholdsData$FuelLevelAvg)
#   #   })
#   #   
#   #   # Engine Oil PSI
#   #   output$EngineOilBox <- renderInfoBox({
#   #     infoBox(
#   #       "Engine Oil", engineOil[1], icon = icon("tint", lib="glyphicon"),
#   #       color = engineOil[2]
#   #     )
#   #   })
#   #   
#   #   # Hydraulics Temperature
#   #   output$HydraulicsTempBox <- renderInfoBox({
#   #     infoBox(
#   #       "Hydraulics Temp", hydraulicsTemp[1], icon = icon("steam"),
#   #       color = hydraulicsTemp[2]
#   #     )
#   #   })
#   #   
#   #   # Tire Pressure
#   #   output$TirepressureBox <- renderInfoBox({
#   #     infoBox(
#   #          "Tire Pressure", tirePressure[1], icon = icon("record",lib = "glyphicon"),
#   #           color = tirePressure[2]
#   #         )
#   #   })
#   # 
#   # 
#   # 
#   # 
#   # 
#   # # 
#   # # output$mmDashboard <- renderValueBox({
#   # #   infoBox(
#   # #      10, "Material moved",icon = icon("icon-truck",lib = "font-awesome")
#   # #   )
#   # # })
#   # # 
#   # # output$dtDashboard <- renderValueBox({
#   # #   valueBox(
#   # #     10, "Distance travelled",icon = icon("icon-road",lib = "font-awesome")
#   # #   )
#   # # })
#   # # 
#   # # 
#   # # output$fcDashboard <- renderValueBox({
#   # #   valueBox(
#   # #     10, "Fuel consumed",icon = icon("icon-tint",lib = "font-awesome")
#   # #   )
#   # # })
#   # # 
#   # # 
#   # # output$osDashboard <- renderValueBox({
#   # #   valueBox(
#   # #     10, "Over speeding",icon = icon("icon-road")
#   # #   )
#   # # })
#   # # 
#   # # 
#   # # output$fwDashboard <- renderValueBox({
#   # #   valueBox(
#   # #     10, "Free wheeling",icon = icon("icon-bullseye")
#   # #   )
#   # # })
#   # # 
#   # # output$athDashboard <- renderValueBox({
#   # #   valueBox(
#   # #     10, "Accelerator too high",icon = icon("icon-road")
#   # #   )
#   # # })
#   # # 
#   # # 
#   # # output$drivingparikingbreakonDashboard <- renderValueBox({
#   # #   valueBox(
#   # #     10, "Driving parking break on",icon = icon("icon-road")
#   # #   )
#   # # })
#   # 
#   # })
#   # 
#   # # ---------------------------------------- Vehicle Health End ------------------------------------------------------------
#   # 
#   # 
#   # 
#   # 
#   # # -------------------------------------------Shift Details Start ------------------------------------------------------------------------------------------
#   #   
#   #   initShiftDetailsVehicleId <- 0
#   #   initShiftDetailsDate <- Sys.Date()+1
#   # 
#   #   output$shift_details <- renderUI({
#   #     
#   #     vehicleID <- input$Chiller_ID
#   #     shift_date <- input$DateDetails
#   #     #shift_type <- input$shift_type
#   #     
#   #     #Converting to date format 
#   #     Shiftdate_to_date<-as.Date(shift_date, origin="1970-01-01")
#   #     
#   #     if(vehicleID != initShiftDetailsVehicleId || shift_date != initShiftDetailsDate) {
#   #       #shiftDetails <<- getShiftDetails(vehicleID, Shiftdate_to_date)
#   #       shiftDetails <<- tbl_df(shiftDetails)
#   #       initShiftDetailsVehicleId <<- vehicleID
#   #       initShiftDetailsDate <<- shift_date
#   #     }
#   #     
#   #     #Filtering the data based on the shift
#   # 
#   #   shiftDetails <- shiftDetails %>% filter(shift == shift_type)
#   #   
#   #   
#   #   materialMoved <- paste0(round(shiftDetails$materialmoved,digits=2), " Tons")
#   #   distanceTravelled <- paste0(round(shiftDetails$distance_travelled, digits = 2), " Km")
#   #   fuelConsumed <- paste0(round(shiftDetails$fuelconsumed,digits = 2), " Gallons" )
#   # 
#   #     tags$table(style= "width : 100%",
#   #       tags$tr( 
#   #         tags$td(p("Material Moved : ")),
#   #         tags$td(p(materialMoved))
#   #       ),
#   #       tags$tr( 
#   #         tags$td(p("Distance Travelled : ")),
#   #         tags$td(p(distanceTravelled))
#   #       ),
#   #       tags$tr(
#   #         tags$td(p("Fuel Consumed: ")),
#   #         tags$td(p(fuelConsumed))
#   #       )
#   #     )
#   #     
#   #   })
#   # 
#   # #----------------------------------------------Shift Details END -----------------------------------------------------------
#   #  
#   # 
#   # #---------------------------------------------Vehicle Utilization Start -----------------------------------------------------
#   # 
#   # 
#   # output$vehicleUtilization <- renderUI({
#   #   vehicleID <-  input$vehicelID
#   #   
#   #   today <- Sys.Date()
#   #   today <- as.Date("2015-08-03")
#   #   
#   #   last1Day <- today-1
#   #   last7Days <- today-7
#   # 
#   # 
#   # #   vehicleAvailabilityData<-getVehicleAvailabilityData(vehicleID,today,today-30)
#   # #   vehicleAvailabilityData <- tbl_df(vehicleAvailabilityData)
#   # #   vehicleAvailabilityData <- vehicleAvailabilityData %>% replace(is.na(.), 0)
#   # 
#   # #   last1Daydata <- vehicleAvailabilityData %>% filter( date1 >= last1Day & date1 < today)
#   # #   last7Daysdata <- vehicleAvailabilityData %>% filter( date1 >= last7Days & date1 < today)
#   # #   last30Daysdata <- vehicleAvailabilityData
#   # #   
#   #   last1dayutil <- round(mean(last1Daydata$percent_working_idle), digits =2)
#   #   last1dayidle <- 100-last1dayutil
#   #   last7daysutil <- round(mean(last7Daysdata$percent_working_idle), digits =2)
#   #   last7daysidle <- 100-last7daysutil
#   #   last30daysutil <- round(mean(last30Daysdata$percent_working_idle), digits =2)
#   #   last30daysidle <- 100-last30daysutil
#   #   
#   #   
#   #   last1dayHtml <- paste0("<div class='shiny-html-output col-sm-4'>Last 1 day</div><div class='progress'><div class='progress-bar progress-bar-success progress-bar-striped active' style='min-width: 2em; width:",last1dayutil,"%;'>",last1dayutil,"%  </div>  <div class='progress-bar progress-bar-warning progress-bar-striped' style='width: ",last1dayidle,"%'> ",last1dayidle,"%  </div> </div>")
#   #   last7daysHtml <- paste0("<div class='shiny-html-output col-sm-4'>Last 7 days</div><div class='progress'><div class='progress-bar progress-bar-success progress-bar-striped active' style='min-width: 2em; width:",last7daysutil,"%;'>",last7daysutil,"%  </div>  <div class='progress-bar progress-bar-warning progress-bar-striped' style='width: ",last7daysidle,"%'> ",last7daysidle,"%  </div> </div>")
#   #   last30daysHtml <- paste0("<div class='shiny-html-output col-sm-4'>Last 30 days</div><div class='progress'><div class='progress-bar progress-bar-success progress-bar-striped active' style='min-width: 2em; width:",last30daysutil,"%;'>",last30daysutil,"%  </div>  <div class='progress-bar progress-bar-warning progress-bar-striped' style='width: ",last30daysidle,"%'> ",last30daysidle,"%  </div> </div>")
#   #   
#   #   displayHtml <- paste0(last1dayHtml, last7daysHtml, last30daysHtml)
#   #   
#   #  #  p<-"<div class='shiny-html-output col-sm-4'>Last 1 day</div><div class='progress'><div class='progress-bar progress-bar-success progress-bar-striped' style='min-width: 2em; width: 2%;'>    0%  </div>  <div class='progress-bar progress-bar-warning progress-bar-striped' style='width: 25%'> 25%  </div> </div><div class='shiny-html-output col-sm-4'>Last 7 days</div><div class='progress'><div class='progress-bar progress-bar-success progress-bar-striped' style='min-width: 2em; width: 2%;'>    0%  </div>  <div class='progress-bar progress-bar-warning progress-bar-striped' style='width: 25%'> 25%  </div> </div><div class='shiny-html-output col-sm-4'>Last 30 days</div><div class='progress'><div class='progress-bar progress-bar-success progress-bar-striped' style='min-width: 2em; width: 2%;'>    0%  </div>  <div class='progress-bar progress-bar-warning progress-bar-striped' style='width: 25%'> 25%  </div> </div>"
#   #   HTML(displayHtml)
#   # })
#   # 
#   # 
#   # 
#   # 
#   # 
#   # 
#   # #----------------------------------------------Vehicle Utilization End ---------------------------------------------------------
#   # 
#   # 
#   # 
#   # 
#   # 
#   # #---------------------------------------------Fuel Utilization Start -----------------------------------------------------= 
#   # 
#   # output$fuelUtilization <- renderUI({
#   #   vehicleID <-  input$vehicelID
#   #   
#   #   today <- Sys.Date()
#   #   today <- as.Date("2015-08-03")
#   #   last1Day <- today-1
#   #   last7Days <- today-7
#   # 
#   # #   vehicleFuelConsumptionData<-getfuelConsumptionData(vehicleID,today,today-30)
#   # #   vehicleFuelConsumptionData <- tbl_df(vehicleFuelConsumptionData)
#   # #   vehicleFuelConsumptionData <- vehicleFuelConsumptionData %>% replace(is.na(.), 0)
#   # # 
#   # #   last1Daydata <- vehicleFuelConsumptionData %>% filter( date1 >= last1Day & date1 < today)
#   # #   last7Daysdata <- vehicleFuelConsumptionData %>% filter( date1 >= last7Days & date1 < today)
#   # #   last30Daysdata <- vehicleFuelConsumptionData
#   # 
#   # 
#   #   last1dayutil <- round(mean(last1Daydata$percent_working_idle), digits =2)
#   #   last1dayidle <- 100-last1dayutil
#   #   last7daysutil <- round(mean(last7Daysdata$percent_working_idle), digits =2)
#   #   last7daysidle <- 100-last7daysutil
#   #   last30daysutil <- round(mean(last30Daysdata$percent_working_idle), digits =2)
#   #   last30daysidle <- 100-last30daysutil
#   #   
#   #   
#   #   last1dayHtml <- paste0("<div class='shiny-html-output col-sm-4'>Last 1 day</div><div class='progress'><div class='progress-bar progress-bar-success progress-bar-striped active' style='min-width: 2em; width:",last1dayutil,"%;'>",last1dayutil,"%  </div>  <div class='progress-bar progress-bar-warning progress-bar-striped' style='width: ",last1dayidle,"%'> ",last1dayidle,"%  </div> </div>")
#   #   last7daysHtml <- paste0("<div class='shiny-html-output col-sm-4'>Last 7 days</div><div class='progress'><div class='progress-bar progress-bar-success progress-bar-striped active' style='min-width: 2em; width:",last7daysutil,"%;'>",last7daysutil,"%  </div>  <div class='progress-bar progress-bar-warning progress-bar-striped' style='width: ",last7daysidle,"%'> ",last7daysidle,"%  </div> </div>")
#   #   last30daysHtml <- paste0("<div class='shiny-html-output col-sm-4'>Last 30 days</div><div class='progress'><div class='progress-bar progress-bar-success progress-bar-striped active' style='min-width: 2em; width:",last30daysutil,"%;'>",last30daysutil,"%  </div>  <div class='progress-bar progress-bar-warning progress-bar-striped' style='width: ",last30daysidle,"%'> ",last30daysidle,"%  </div> </div>")
#   #   
#   #   displayHtml <- paste0(last1dayHtml, last7daysHtml, last30daysHtml)
#   #   
#   #   #  p<-"<div class='shiny-html-output col-sm-4'>Last 1 day</div><div class='progress'><div class='progress-bar progress-bar-success progress-bar-striped' style='min-width: 2em; width: 2%;'>    0%  </div>  <div class='progress-bar progress-bar-warning progress-bar-striped' style='width: 25%'> 25%  </div> </div><div class='shiny-html-output col-sm-4'>Last 7 days</div><div class='progress'><div class='progress-bar progress-bar-success progress-bar-striped' style='min-width: 2em; width: 2%;'>    0%  </div>  <div class='progress-bar progress-bar-warning progress-bar-striped' style='width: 25%'> 25%  </div> </div><div class='shiny-html-output col-sm-4'>Last 30 days</div><div class='progress'><div class='progress-bar progress-bar-success progress-bar-striped' style='min-width: 2em; width: 2%;'>    0%  </div>  <div class='progress-bar progress-bar-warning progress-bar-striped' style='width: 25%'> 25%  </div> </div>"
#   #   HTML(displayHtml)
#   # })
#   # 
#   #  
#   # #----------------------------------------------Fuel Utilization End ---------------------------------------------------------
#   # 
#   # 
#   # 
#   # 
#   # 
#   # #------------------------------------------------Incidents  Start--------------------------------------------------------------------
#   #  
#   # output$incidents <- renderUI({
#   #   
#   #   vehicleID <-  input$vehicelID
#   #   
#   #   incidentsDetails <- getIncidentsDetails(vehicleID)
#   # 
#   #   overSpeeding <- sum(incidentsDetails$overspeeding)
#   #   freeWheeling <- sum(incidentsDetails$freewheeling)
#   #   acceleratorTooHigh <- 0
#   #   drivingParkingBreakOn <- 0
#   #   
#   #   
#   #   tags$table(style= "width : 100%",
#   #     tags$tr( 
#   #       tags$td(p("Over Speeding : ")),
#   #       tags$td(p(overSpeeding))
#   #     ),
#   #     tags$tr( 
#   #       tags$td(p("Free Wheeling : ")),
#   #       tags$td(p(freeWheeling))
#   #     ),
#   #     tags$tr(
#   #       tags$td(p("Accelerator too high : ")),
#   #       tags$td(p(acceleratorTooHigh))
#   #     ),
#   #     tags$tr(
#   #       tags$td(p("Driving parking break on : ")),
#   #       tags$td(p(drivingParkingBreakOn))
#   #     )
#   #   ) 
#   #   
#   # })
#   # 
#   # #---------------------------------------------- Incidents End ------------------------------------------------------------
#   #  
#   # 
#   # 
#   # #------------------------------------------------ Material Moved Start --------------------------------------------------------------------
#   # 
#   # output$materialMoved <- renderBarChartDashboardWidget({
#   #   #materialMovedData <-  getMaterialMovedData(input$vehicelID)
#   # #mmdata <- getTargets(input$vehicelID)
#   #   Target <- c()
#   #   if(nrow(materialMovedData) > 0){
#   #     for (i in 1:nrow(materialMovedData)){
#   #       Target <- append(Target,mmdata$materialMoved)
#   #     }
#   #     materialMovedData <- data.frame(materialMovedData,Target)
#   #   } else{
#   #     materialMovedData
#   #   }
#   #   
#   # })
#   # 
#   # 
#   # #------------------------------------------------ Material Moved End --------------------------------------------------------------------
#   # 
#   # 
#   # 
#   # #------------------------------------------------ Distance Travelled Start --------------------------------------------------------------------
#   # 
#   # output$distanceTravelled <- renderBarChartDashboardWidget({
#   #   
#   #   today <- Sys.Date()
#   #   today <- as.Date("2015-08-29")
#   #   dtdata <- getTargets(input$vehicelID)
#   #   #distanceTravelledData <-  getReportsBarchartData(input$vehicelID,today-7, today)
#   #   groupData <- tbl_df(distanceTravelledData[,c('distance_travelled','date1')]) %>%  group_by(date1) %>%
#   #                       summarize(DistanceTravelled = sum(distance_travelled))
#   #   Target <- c()
#   #   if(nrow(groupData) > 0){
#   #     for (i in 1:nrow(groupData)){
#   #       Target <- append(Target,dtdata$distanceTravelled)
#   #     }
#   #     groupData <- data.frame(groupData,Target)
#   #   } else{
#   #     groupData
#   #   }
#   #   
#   # })
#   # 
#   # 
#   # 
#   # 
#   # #------------------------------------------------ Distance Traveled End --------------------------------------------------------------------
#   # 
#   # 
#   # 
#   # 
#   # 
#   ################################################################################################################################################# 
#   # 
#   # #--------------------------------------Plots UI Start--------------------------------------------------------------------
#   # 
#   # output$plotSelectTime <- renderUI({
#   #   if(input$plotsShiftType == 'DS'){
#   #     radioButtons("plotsTime", "Time",
#   #                  list("07:00" = "07","08:00" = "08","09:00" = "09","10:00" = "10","11:00" = "11","12:00" = "12","13:00" = "13","14:00" = "14","15:00" = "15","16:00" = "16","17:00" = "17","18:00" = "18")
#   #     )
#   #   }
#   #   else{
#   #     radioButtons("plotsTime", "Time",
#   #                  list("19:00" = "19","20:00" = "20","21:00" = "21","22:00" = "22","23:00" = "23","00:00" = "00","01:00" = "01","02:00" = "02","03:00" = "03","04:00" = "04","05:00" = "05","06:00" = "06")
#   #     )
#   #   }
#   # })
#   # 
#   # 
#   # 
#   # 
#   output$inputParams1 <- renderUI({
#     parametersY1 <- input$parametersY1Axis
#     parametersY2 <- input$parametersY2Axis
#     #   # Added new parameter that is pulled from mean_boom_pressure Table
#     # #   initialParamaters <- c(colnames(data1), AvgBoomPressure)
#     initialParamaters <- c(colnames(chiller_data))   
#     #   # Removing paramaters selected for Y2-axis
#     params <- setdiff(initialParamaters, parametersY2)
#     #   # Making sure parameters are not re-ordered - Ex: Normal case - if you select ("accly","acclx") after ploting, it
#     #   # changes to "acclx","accly". As there is a change in parameters shiny plots the same again.
#     #   # To make sure that doesnt happen we  add the selected parameters at the begining of the choices hence 
#     #   # updating choices every time.
#     paramsNotSelected <- setdiff(params,parametersY1)
#     parmsToDisplayInChoices <- c(parametersY1,paramsNotSelected)
#     #   
#     selectizeInput(inputId="parametersY1Axis", 
#                    #          label = "Parameters for Axis Y1",
#                    label = "Y Axis Parameter for Plot1",
#                    choices = parmsToDisplayInChoices,
#                    multiple = TRUE, 
#                    #          selected =parametersY1,
#                    selected ="ActualiKWTR",
#                    options = list(placeholder = 'Please select an option for Y-1'))
#   })
#   # 
#   # 
#   output$inputParams2 <- renderUI({
#     parametersY2 <- input$parametersY2Axis
#     parametersY1 <- input$parametersY1Axis   
#     # 
#     #   # Added new parameter that is pulled from mean_boom_pressure Table
#     # #   initialParamaters <- c(colnames(data1), AvgBoomPressure)
#     initialParamaters <- c(colnames(chiller_data))
#     #   # Removing paramaters selected for Y1-axis
#     params <- setdiff(initialParamaters, parametersY1)
#     #   # Making sure parameters are not re-ordered - Ex: Normal case - if you select ("accly","acclx") after ploting, it
#     #   # changes to "acclx","accly". As there is a change in parameters shiny plots the same again.
#     #   # To make sure that doesnt happen we  add the selected parameters at the begining of the choices hence 
#     #   # updating choices every time.
#     paramsNotSelected <- setdiff(params,parametersY2)
#     # 
#     parmsToDisplayInChoices <- c(parametersY2,paramsNotSelected)
#     # 
#     selectizeInput(inputId="parametersY2Axis", 
#                    label = "Y Axis Parameter for Plot2",
#                    choices = parmsToDisplayInChoices,
#                    multiple = TRUE,
#                    #               selected = parametersY2,
#                    selected = "XFLA",
#                    options = list(placeholder = 'Please select an option for Y-2'))
#   })
#   
#   ################################## Second tab ################################
#   
#   
#   output$inputParams1_2 <- renderUI({
#     parametersY1 <- input$parametersY1Axis
#     parametersY2 <- input$parametersY2Axis
#     #   # Added new parameter that is pulled from mean_boom_pressure Table
#     # #   initialParamaters <- c(colnames(data1), AvgBoomPressure)
#     initialParamaters <- c(colnames(chiller_data))   
#     #   # Removing paramaters selected for Y2-axis
#     params <- setdiff(initialParamaters, parametersY2)
#     #   # Making sure parameters are not re-ordered - Ex: Normal case - if you select ("accly","acclx") after ploting, it
#     #   # changes to "acclx","accly". As there is a change in parameters shiny plots the same again.
#     #   # To make sure that doesnt happen we  add the selected parameters at the begining of the choices hence 
#     #   # updating choices every time.
#     paramsNotSelected <- setdiff(params,parametersY1)
#     parmsToDisplayInChoices <- c(parametersY1,paramsNotSelected)
#     #   
#     selectizeInput(inputId="parametersY1Axis", 
#                    #          label = "Parameters for Axis Y1",
#                    label = "Y Axis Parameter for Plot1",
#                    choices = parmsToDisplayInChoices,
#                    multiple = TRUE, 
#                    #          selected =parametersY1,
#                    selected ="CHW_STD",
#                    options = list(placeholder = 'Please select an option for Y-1'))
#   })
#   # 
#   # 
#   output$inputParams2_2 <- renderUI({
#     parametersY2 <- input$parametersY2Axis
#     parametersY1 <- input$parametersY1Axis   
#     # 
#     #   # Added new parameter that is pulled from mean_boom_pressure Table
#     # #   initialParamaters <- c(colnames(data1), AvgBoomPressure)
#     initialParamaters <- c(colnames(chiller_data))
#     #   # Removing paramaters selected for Y1-axis
#     params <- setdiff(initialParamaters, parametersY1)
#     #   # Making sure parameters are not re-ordered - Ex: Normal case - if you select ("accly","acclx") after ploting, it
#     #   # changes to "acclx","accly". As there is a change in parameters shiny plots the same again.
#     #   # To make sure that doesnt happen we  add the selected parameters at the begining of the choices hence 
#     #   # updating choices every time.
#     paramsNotSelected <- setdiff(params,parametersY2)
#     # 
#     parmsToDisplayInChoices <- c(parametersY2,paramsNotSelected)
#     # 
#     selectizeInput(inputId="parametersY2Axis", 
#                    label = "Y Axis Parameter for Plot2",
#                    choices = parmsToDisplayInChoices,
#                    multiple = TRUE,
#                    #               selected = parametersY2,
#                    selected = "CDW_STD",
#                    options = list(placeholder = 'Please select an option for Y-2'))
#   })
#   
#   ##############################  Third tab ###################################
#   
#   output$inputParams1_3 <- renderUI({
#     parametersY1 <- input$parametersY1Axis
#     parametersY2 <- input$parametersY2Axis
#     #   # Added new parameter that is pulled from mean_boom_pressure Table
#     # #   initialParamaters <- c(colnames(data1), AvgBoomPressure)
#     initialParamaters <- c(colnames(chiller_data))   
#     #   # Removing paramaters selected for Y2-axis
#     params <- setdiff(initialParamaters, parametersY2)
#     #   # Making sure parameters are not re-ordered - Ex: Normal case - if you select ("accly","acclx") after ploting, it
#     #   # changes to "acclx","accly". As there is a change in parameters shiny plots the same again.
#     #   # To make sure that doesnt happen we  add the selected parameters at the begining of the choices hence 
#     #   # updating choices every time.
#     paramsNotSelected <- setdiff(params,parametersY1)
#     parmsToDisplayInChoices <- c(parametersY1,paramsNotSelected)
#     #   
#     selectizeInput(inputId="parametersY1Axis", 
#                    #          label = "Parameters for Axis Y1",
#                    label = "Y Axis Parameter for Plot1",
#                    choices = parmsToDisplayInChoices,
#                    multiple = TRUE, 
#                    #          selected =parametersY1,
#                    selected ="CHWDeltaT",
#                    options = list(placeholder = 'Please select an option for Y-1'))
#   })
#   # 
#   # 
#   output$inputParams2_3 <- renderUI({
#     parametersY2 <- input$parametersY2Axis
#     parametersY1 <- input$parametersY1Axis   
#     # 
#     #   # Added new parameter that is pulled from mean_boom_pressure Table
#     # #   initialParamaters <- c(colnames(data1), AvgBoomPressure)
#     initialParamaters <- c(colnames(chiller_data))
#     #   # Removing paramaters selected for Y1-axis
#     params <- setdiff(initialParamaters, parametersY1)
#     #   # Making sure parameters are not re-ordered - Ex: Normal case - if you select ("accly","acclx") after ploting, it
#     #   # changes to "acclx","accly". As there is a change in parameters shiny plots the same again.
#     #   # To make sure that doesnt happen we  add the selected parameters at the begining of the choices hence 
#     #   # updating choices every time.
#     paramsNotSelected <- setdiff(params,parametersY2)
#     # 
#     parmsToDisplayInChoices <- c(parametersY2,paramsNotSelected)
#     # 
#     selectizeInput(inputId="parametersY2Axis", 
#                    label = "Y Axis Parameter for Plot2",
#                    choices = parmsToDisplayInChoices,
#                    multiple = TRUE,
#                    #               selected = parametersY2,
#                    selected = "CDWDeltaT",
#                    options = list(placeholder = 'Please select an option for Y-2'))
#   })
#   
#   
#   ##############################  Fourth tab ###################################
#   
#   output$inputParams1_4 <- renderUI({
#     parametersY1 <- input$parametersY1Axis
#     parametersY2 <- input$parametersY2Axis
#     #   # Added new parameter that is pulled from mean_boom_pressure Table
#     # #   initialParamaters <- c(colnames(data1), AvgBoomPressure)
#     initialParamaters <- c(colnames(chiller_data))   
#     #   # Removing paramaters selected for Y2-axis
#     params <- setdiff(initialParamaters, parametersY2)
#     #   # Making sure parameters are not re-ordered - Ex: Normal case - if you select ("accly","acclx") after ploting, it
#     #   # changes to "acclx","accly". As there is a change in parameters shiny plots the same again.
#     #   # To make sure that doesnt happen we  add the selected parameters at the begining of the choices hence 
#     #   # updating choices every time.
#     paramsNotSelected <- setdiff(params,parametersY1)
#     parmsToDisplayInChoices <- c(parametersY1,paramsNotSelected)
#     #   
#     selectizeInput(inputId="parametersY1Axis", 
#                    #          label = "Parameters for Axis Y1",
#                    label = "Y Axis Parameter for Plot1",
#                    choices = parmsToDisplayInChoices,
#                    multiple = TRUE, 
#                    #          selected =parametersY1,
#                    selected ="CTeff",
#                    options = list(placeholder = 'Please select an option for Y-1'))
#   })
#   # 
#   # 
#   # output$inputParams2_4 <- renderUI({
#   #   parametersY2 <- input$parametersY2Axis
#   #   parametersY1 <- input$parametersY1Axis   
#   #   # 
#   #   #   # Added new parameter that is pulled from mean_boom_pressure Table
#   #   # #   initialParamaters <- c(colnames(data1), AvgBoomPressure)
#   #   initialParamaters <- c(colnames(chiller_data))
#   #   #   # Removing paramaters selected for Y1-axis
#   #   params <- setdiff(initialParamaters, parametersY1)
#   #   #   # Making sure parameters are not re-ordered - Ex: Normal case - if you select ("accly","acclx") after ploting, it
#   #   #   # changes to "acclx","accly". As there is a change in parameters shiny plots the same again.
#   #   #   # To make sure that doesnt happen we  add the selected parameters at the begining of the choices hence 
#   #   #   # updating choices every time.
#   #   paramsNotSelected <- setdiff(params,parametersY2)
#   #   # 
#   #   parmsToDisplayInChoices <- c(parametersY2,paramsNotSelected)
#   #   # 
#   #   selectizeInput(inputId="parametersY2Axis", 
#   #                  label = "Y Axis Parameter for Plot2",
#   #                  choices = parmsToDisplayInChoices,
#   #                  multiple = TRUE,
#   #                  #               selected = parametersY2,
#   #                  selected = "XFLA",
#   #                  options = list(placeholder = 'Please select an option for Y-2'))
#   # })
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   output$inputParams1_5 <- renderUI({
#     parametersY1 <- input$parametersY1Axis
#     parametersY2 <- input$parametersY2Axis
#     #   # Added new parameter that is pulled from mean_boom_pressure Table
#     # #   initialParamaters <- c(colnames(data1), AvgBoomPressure)
#     initialParamaters <- c(colnames(chiller_data))   
#     #   # Removing paramaters selected for Y2-axis
#     params <- setdiff(initialParamaters, parametersY2)
#     #   # Making sure parameters are not re-ordered - Ex: Normal case - if you select ("accly","acclx") after ploting, it
#     #   # changes to "acclx","accly". As there is a change in parameters shiny plots the same again.
#     #   # To make sure that doesnt happen we  add the selected parameters at the begining of the choices hence 
#     #   # updating choices every time.
#     paramsNotSelected <- setdiff(params,parametersY1)
#     parmsToDisplayInChoices <- c(parametersY1,paramsNotSelected)
#     #   
#     selectizeInput(inputId="parametersY1Axis", 
#                    label = "Parameters for Axis Y1",
#                    choices = parmsToDisplayInChoices,
#                    multiple = TRUE,selected =parametersY1,
#                    options = list(placeholder = 'Please select an option for Y-1'))
#   })
#   # 
#   # 
#   output$inputParams2_5 <- renderUI({
#     parametersY2 <- input$parametersY2Axis
#     parametersY1 <- input$parametersY1Axis
#     # 
#     #   # Added new parameter that is pulled from mean_boom_pressure Table
#     # #   initialParamaters <- c(colnames(data1), AvgBoomPressure)
#     initialParamaters <- c(colnames(chiller_data))
#     #   # Removing paramaters selected for Y1-axis
#     params <- setdiff(initialParamaters, parametersY1)
#     #   # Making sure parameters are not re-ordered - Ex: Normal case - if you select ("accly","acclx") after ploting, it
#     #   # changes to "acclx","accly". As there is a change in parameters shiny plots the same again.
#     #   # To make sure that doesnt happen we  add the selected parameters at the begining of the choices hence 
#     #   # updating choices every time.
#     paramsNotSelected <- setdiff(params,parametersY2)
#     # 
#     parmsToDisplayInChoices <- c(parametersY2,paramsNotSelected)
#     # 
#     selectizeInput(inputId="parametersY2Axis", 
#                    label = "Parameters for Axis Y2",
#                    choices = parmsToDisplayInChoices,
#                    multiple = TRUE,selected = parametersY2,
#                    options = list(placeholder = 'Please select an option for Y-2'))
#   })
#   # 
#   # # ------------------------------------- Plots UI End --------------------------------------------------------------------
#   # # 
#   # # #------------------------------------- Main Plots -----------------------------------------------------------
#   # # 
#   # # lastDate <- Sys.Date()+1
#   # # lastVehicleId <- 0
#   # # lastShift <- 'AA'
#   # # 
#   # # 
#   # # lastDateEvents <- Sys.Date()+1
#   # # lastVehicleIdEvents <- 0
#   # # lastShiftEvents <- 'AA'
#   # # 
#   # # output$main_plot <- renderLineChart({
#   # #   validate(
#   # #       need(input$parametersY1Axis != "" || input$parametersY2Axis != "", label = "Parameters")
#   # #   )
#   # #  
#   # # 
#   # #       date<-input$plotsDate
#   # #       plotsShiftType <- input$plotsShiftType
#   # #       vehicleId<-input$plots_vehicelID
#   # #       parametersY1Axis<-input$parametersY1Axis
#   # #       parametersY2Axis<-input$parametersY2Axis
#   # #       eventparameters <- input$plotEvents
#   # #       plotsTime <- input$plotsTime
#   # # 
#   # # 
#   # #       #Converting to date format 
#   # #       to_date<-as.Date(date, origin="1970-01-01")
#   # #       
#   # #      if(vehicleId != lastVehicleId || to_date != lastDate || plotsShiftType != lastShift) {
#   # #      #Get the plot data
#   # #        if(length(parametersY1Axis) > 0 || length(parametersY2Axis) > 0){
#   # #           plotData <<- getPlotData(to_date,vehicleId,plotsShiftType)
#   # #           plotData <<- tbl_df(plotData)
#   # #           avgBoomPressData <<- getAvgBoomPressure(to_date,vehicleId,plotsShiftType)
#   # #           avgBoomPressData <<- tbl_df(avgBoomPressData)
#   # #           
#   # #           lastVehicleId <<- vehicleId
#   # #           lastDate <<- to_date
#   # #           lastShift <<- plotsShiftType
#   # #        } 
#   # #      }
#   # #   
#   # #     if(vehicleId != lastVehicleIdEvents || to_date != lastDateEvents || plotsShiftType != lastShiftEvents) {
#   # #       eventsData <<- list()
#   # #       if(length(eventparameters) > 0){
#   # #         eventsData <<- getEventsDataForLHD(to_date,vehicleId,plotsShiftType)
#   # #         eventsData <<- tbl_df(eventsData)
#   # #       
#   # #         lastVehicleIdEvents <<- vehicleId
#   # #         lastDateEvents <<- to_date
#   # #         lastShiftEvents <<- plotsShiftType
#   # #       }
#   # #     }
#   # #   
#   # # aplotData <- plotData
#   # #   plotData <- filter(plotData, (stri_sub(timestamp1, 12, 13) == plotsTime))
#   # #   avgBoomPressData <- filter(avgBoomPressData, (stri_sub(timestamp1, 12, 13) == plotsTime))
#   # #   
#   # #   if(length(eventsData) >0){
#   # #     eventsData <- filter(eventsData, (stri_sub(timestamp1, 12, 13) == plotsTime))
#   # #   }
#   # # 
#   # # 
#   # # 
#   # #   
#   # #   eventsDataEngineStartStop <- list()
#   # #   eventsDataVehicleStartStop <- list()
#   # #   eventsDataLoadCycle <- list()
#   # #   eventsDataHaulCycle <- list()
#   # #   eventsDataUnloadCycle <- list()
#   # #   eventsDataShiftCycle <- list()
#   # #       
#   # #   
#   # #   if(length(eventparameters) > 0)
#   # #     for(i in 1:length(eventparameters)){
#   # #       switch(eventparameters[i],
#   # #           
#   # # #           'ESS' = {
#   # # #                 eventsDataEngineStartStop <- eventsData %>%
#   # # #                                                 select(timestamp1 , event_id) %>%
#   # # #                                                 filter(event_id == 1 | event_id == 2)
#   # # #                 eventsDataEngineStartStop$event_id[eventsDataEngineStartStop$event_id=="1"] <- 1
#   # # #                 eventsDataEngineStartStop$event_id[eventsDataEngineStartStop$event_id=="2"] <- 0    
#   # # #                 colnames(eventsDataEngineStartStop) <- c("eventsDataEngineStartStopTimestamp","Engine Start-Stop")
#   # # #                },
#   # # #           
#   # # #           'VSS' = {
#   # # #                   eventsDataVehicleStartStop <- eventsData %>%
#   # # #                                                     select(timestamp1 , event_id) %>%
#   # # #                                                     filter(event_id == 3 | event_id == 4)
#   # # #                     eventsDataVehicleStartStop$event_id[eventsDataVehicleStartStop$event_id=="3"] <- 1
#   # # #                     eventsDataVehicleStartStop$event_id[eventsDataVehicleStartStop$event_id=="4"] <- 0    
#   # # #                     colnames(eventsDataVehicleStartStop) <- c("eventsDataVehicleStartStopTimestamp","Vehicle Start Stop")
#   # # #                 },
#   # #       
#   # #           'LHDCycle' = {
#   # #                    eventsDataLoadCycle <- eventsData %>%
#   # #                                             select(timestamp1 , loadcycle) 
#   # #                    colnames(eventsDataLoadCycle) <- c("eventsDataLoadCycleTimestamp","Load Cycle")
#   # #              }, 
#   # # 
#   # # #           'HC' = {
#   # # #                   eventsDataHaulCycle <- eventsData %>%
#   # # #                                               select(timestamp1 , event_id) %>%
#   # # #                                               filter(event_id == 13 | event_id == 7)
#   # # #                   eventsDataHaulCycle$event_id[eventsDataHaulCycle$event_id=="13"] <- 1
#   # # #                   eventsDataHaulCycle$event_id[eventsDataHaulCycle$event_id=="7"] <- 0    
#   # # #                   colnames(eventsDataHaulCycle) <- c("eventsDataHaulCycleTimestamp","Haul Cycle")
#   # # #           }, 
#   # # #      
#   # # #           'UC' = {
#   # # #                    eventsDataUnloadCycle <- eventsData %>%
#   # # #                                            select(timestamp1 , event_id) %>%
#   # # #                                            filter(event_id == 7 | event_id == 8)
#   # # #                    eventsDataUnloadCycle$event_id[eventsDataUnloadCycle$event_id=="7"] <- 1
#   # # #                    eventsDataUnloadCycle$event_id[eventsDataUnloadCycle$event_id=="8"] <- 0    
#   # # #                    colnames(eventsDataUnloadCycle) <- c("eventsDataUnloadCycleTimestamp","Unload Cycle")
#   # # #             }
#   # # #           ,
#   # # #       
#   # # #           'SC' = {
#   # # #                   eventsDataShiftCycle <- eventsData %>%
#   # # #                                             select(timestamp1 , event_id) %>%
#   # # #                                             filter(event_id == 9 | event_id == 10)
#   # # #                   eventsDataShiftCycle$event_id[eventsDataShiftCycle$event_id=="9"] <- 1
#   # # #                   eventsDataShiftCycle$event_id[eventsDataShiftCycle$event_id=="10"] <- 0    
#   # # #                   colnames(eventsDataShiftCycle) <- c("eventsDataShiftCycleTimestamp","Shift Cycle")
#   # # #              }
#   # #         )
#   # #       
#   # #       }
#   # #   
#   # # 
#   # #       parameters  <- c(parametersY1Axis,"timestamp1",parametersY2Axis)
#   # #       paramstoJStopointtoXaxis <- setdiff(c(parametersY1Axis, parametersY2Axis),AvgBoomPressure)
#   # #       
#   # #       # Creating Empty DataFrame for Validation
#   # #       avgBoomPressDataInput <- data.frame(x= numeric(0))
#   # # 
#   # #       if ( AvgBoomPressure  %in% parameters ){
#   # #         avgBoomPressData <- avgBoomPressData %>% replace(is.na(.), 0)
#   # #         avgBoomPressDataInput <- avgBoomPressData
#   # #         colnames(avgBoomPressDataInput) <- c("avgBoomPressureTimestamp" ,AvgBoomPressure )
#   # #       }
#   # #   
#   # #       parameters <- setdiff(parameters, AvgBoomPressure)
#   # # 
#   # #     # As AvgBoomPressure added to the Parameter list, We need to make sure we pass the data only if one of the parameters
#   # #     # of plotData are selected else pass empty string.       
#   # #       
#   # #   # Creating Empty DataFrame for Validation
#   # #   plotDataTOJS <- data.frame(x= numeric(0))
#   # # 
#   # # 
#   # #       if(length(parameters) > 1)
#   # #         plotDataTOJS <- plotData[,unique(parameters)]
#   # # 
#   # # 
#   # # output$dygraphplot <- renderDygraph({
#   # #   
#   # # #   abc <- head(aplotData)
#   # # #   print(abc$timestamp1)
#   # # # 
#   # # #   abc <- xts(abc[,c('hydpressboomup')], as.POSIXct(abc$timestamp1, format="%Y-%m-%d %H:%M:%S"),tzone = TZ)
#   # # #   print(abc)
#   # # # 
#   # # 
#   # #     TZ="America/New_York"
#   # #     abc <- xts(aplotData[,c('hydpressboomup')], as.POSIXct(aplotData$timestamp1, format="%Y-%m-%d %H:%M:%S"), tz = TZ)
#   # #     print(head(abc))
#   # #     dygraph(abc, main = "Vehicle Playback") %>% dyOptions(useDataTimezone = TRUE)
#   # # 
#   # # })
#   # # 
#   # # 
#   # #     list("plotData" = plotDataTOJS, "YAxis2" = parametersY2Axis, "paramstoJStopointtoXaxis" = paramstoJStopointtoXaxis,
#   # #            "avgBoomPressData" = avgBoomPressDataInput,
#   # #            "eventDataEngineSS" = eventsDataEngineStartStop, "eventDataVehicleSS" = eventsDataVehicleStartStop,
#   # #             "eventDataLC" = eventsDataLoadCycle, "eventDataHC" = eventsDataHaulCycle,"eventDataULC" = eventsDataUnloadCycle,
#   # #             "eventDataSC" = eventsDataShiftCycle )
#   # # })
#   # # 
#   # # 
#   # # 
#   # # 
#   # # 
#   # # 
#   # # 
#   # # 
#   # # 
#   # # # output$dygraphplot <- renderDygraph({
#   # # #   
#   # # #    index(lungDeaths) <- cbind(ldeaths, mdeaths, fdeaths)
#   # # # #   dygraph(lungDeaths, main = "Deaths from Lung Disease (UK)") %>%
#   # # # #     dyOptions(colors = RColorBrewer::brewer.pal(3, "Set2"))
#   # # #   
#   # # # })
#   # # 
#   # #  #------------------------------------------------ Main Plot END-------------------------------------   
#   # #  
#   # 
#   # 
#   # 
#   # 
#   ################################################################################################################################################ 
#   # 
#   # #------------------------------------- Main Plots  Testing-----------------------------------------------------------
#   # 
#   lastDate <- Sys.Date()+1
#   lastChillerId <- 0
#   # lastShift <- 'AA'
#   # 
#   # 
#   lastDateEvents <- Sys.Date()+1
#   # lastVehicleIdEvents <- 0
#   # lastShiftEvents <- 'AA'
#   # 
#   output$dygraphplot1 <- renderDygraph({
#     validate(
#       need(input$parametersY1Axis != "" || input$parametersY2Axis != "", label = "Parameters")
#     )
#     #   
#     #   
#     datefrom<-input$plotsDateFrom
#     dateto<-input$plotsDateTo
#     
#     #   plotsShiftType <- input$plotsShiftType
#     chillerId<-input$plots_chillerID
#     parametersY1Axis<-input$parametersY1Axis
#     #   parametersY2Axis<-input$parametersY2Axis
#     #   eventparameters <- input$plotEvents
#     #   plotsTime <- input$plotsTime
#     #   
#     #   
#     #   #Converting to date format 
#     from_date<-as.Date(datefrom, origin="2014-01-01")   
#     to_date<-as.Date(dateto, origin="2014-01-01")   
#     #   
#     if(chillerId != lastChillerId || to_date != lasttoDate || from_date != lastfromDate) {
#       #     #Get the plot data
#       plotData <<- list()
#       if(length(parametersY1Axis) > 0 ){
#         #       plotData <<- getPlotData(to_date,chillerId,plotsShiftType)   
#         #        print(chillerId)
#         #        print(from_date)
#         #        print(to_date)
#         #        print(str(chiller_data))
#         plotData <<- subset(chiller_data,Chiller_ID == chillerId & as.Date(Time)>= from_date & as.Date(Time) <= to_date)
#         #        print (as.Date(chiller_data$Time))
#         #        print (from_date)
#         #        print (to_date)
#         #       print(plotData)       
#         #        plotdata <<- subset(chiller_data, Time = to_date)  
#         #        print(plotdata)
#         #plotData <<- tbl_df(plotdata)
#         lastChillerId <<- chillerId
#         lasttoDate <<- to_date
#         lastfromDate <<- from_date
#         
#         #       lastShift <<- plotsShiftType
#       }
#     }
#     #   
#     #   if(chillerId != lastChillericleIdEvents || to_date != lastDateEvents || plotsShiftType != lastShiftEvents) {
#     #     eventsData <<- list()
#     #     if(length(eventparameters) > 0){
#     #       eventsData <<- getEventsDataForLHD(to_date,vehicleId,plotsShiftType)
#     #       eventsData <<- tbl_df(eventsData)
#     #       
#     #       lastVehicleIdEvents <<- vehicleId
#     #       lastDateEvents <<- to_date
#     #       lastShiftEvents <<- plotsShiftType
#     #     }
#     #   }
#     #   
#     # 
#     #   if(length(eventparameters) > 0)
#     #     for(i in 1:length(eventparameters)){
#     #       switch(eventparameters[i],
#     #              'LHDCycle' = {
#     #                eventsDataLoadCycle <- eventsData %>%
#     #                  select(loadcycle)
#     #                colnames(eventsDataLoadCycle) <- c("LHDCycle")
#     #              }
#     #       )
#     #       plotData <- cbind(plotData,eventsDataLoadCycle)
#     #     }
#     # # print(head(plotData)) 
#     # # print(eventparameters)
#     #   parameters  <- c(parametersY1Axis,parametersY2Axis,eventparameters)
#     parameters  <- c(parametersY1Axis)
#     # # print(parameters)
#     # 
#     #     
#     # #       abc <- head(plotData)
#     # #       print(abc$timestamp1)
#     # #       TZ="America/New_York"
#     # #       abc <- xts(abc[,c('hydpressboomup')], as.POSIXct(abc$timestamp1, format="%Y-%m-%d %H:%M:%S"),tzone = TZ)
#     # #       print(abc)
#     # 
#     # #     print(parametersY2Axis)
#     print("check")
#     print(str(plotData))
#     TZ="IST"
#     if(nrow(plotData) > 0){
#       finalData <- xts(plotData[,parameters], as.POSIXct(plotData$Time, format="%Y-%m-%d %H:%M"), tz = TZ)
#       #      finalData <- xts(plotData[,parameters], as.POSIXct(plotData$Time, format="%d-%m-%Y %H:%M"), tz = TZ)      
#       dygraph(finalData, main = "", xlab = "Timestamp",height = "1000px") %>% 
#         #       dygraph(finalData, main = "Chiller Playback", xlab = "Timestamp" ,height = "1000px") %>% 
#         dyLegend(width = 1000)   %>%
#         #           dySeries(parametersY2Axis, axis = 'y2') %>%
#         dyRangeSelector() %>%
#         # #         if ( 'LHDCycle'  %in% eventparameters ){
#         # #           dySeries("LHDCycle", stepPlot = TRUE) %>%
#         # #         }
#         dyHighlight(highlightSeriesOpts = list(strokeWidth = 2),hideOnMouseOut = FALSE) %>%
#         dyOptions(useDataTimezone = TRUE,colors = RColorBrewer::brewer.pal(3, "Dark2")) %>%
#         dyAxis("y", label = "iKW/TR", independentTicks = TRUE, valueRange = c(0, 1.1)) 
#       #           dyAxis("y", label = "iKW/TR", independentTicks = TRUE, valueRange = c(40, 60)                  
#       #           dyAxis("y2", label = "Y2 Parameters")
#       #     
#     }   
#     #### var_name = input$var
#     # print(var_name)
#     #### finalData <- xts(tvm_10min_new[,var_name], as.POSIXct(tvm_10min_new$Date, format="%Y-%m-%d %H:%M:%S"))
#     ####   dygraph(finalData) %>% 
#     ####     dyRangeSelector()
#   })
#   
#   output$dygraphplot3 <- renderDygraph({
#     validate(
#       need(input$parametersY1Axis != "" || input$parametersY2Axis != "", label = "Parameters")
#     )
#     #   
#     #   
#     datefrom<-input$plotsDateFrom
#     dateto<-input$plotsDateTo
#     
#     #   plotsShiftType <- input$plotsShiftType
#     chillerId<-input$plots_chillerID
#     parametersY2Axis<-input$parametersY2Axis
#     #   parametersY2Axis<-input$parametersY2Axis
#     #   eventparameters <- input$plotEvents
#     #   plotsTime <- input$plotsTime
#     #   
#     #   
#     #   #Converting to date format 
#     from_date<-as.Date(datefrom, origin="2015-01-01")   
#     to_date<-as.Date(dateto, origin="2015-01-01")   
#     #   
#     if(chillerId != lastChillerId || to_date != lasttoDate || from_date != lastfromDate) {
#       #     #Get the plot data
#       plotData <<- list()
#       if(length(parametersY2Axis) > 0 ){
#         #       plotData <<- getPlotData(to_date,chillerId,plotsShiftType)   
#         plotData <<- subset(chiller_data,Chiller_ID == chillerId & as.Date(Time) >= from_date & as.Date(Time) <= to_date)
#         #        print (as.Date(chiller_data$Time))
#         #        print (from_date)
#         #        print (to_date)
#         #       print(plotData)       
#         #        plotdata <<- subset(chiller_data, Time = to_date)  
#         #        print(plotdata)
#         #plotData <<- tbl_df(plotdata)
#         lastChillerId <<- chillerId
#         lasttoDate <<- to_date
#         lastfromDate <<- from_date
#         #       lastShift <<- plotsShiftType
#       }
#     }
#     #   
#     #   if(chillerId != lastChillericleIdEvents || to_date != lastDateEvents || plotsShiftType != lastShiftEvents) {
#     #     eventsData <<- list()
#     #     if(length(eventparameters) > 0){
#     #       eventsData <<- getEventsDataForLHD(to_date,vehicleId,plotsShiftType)
#     #       eventsData <<- tbl_df(eventsData)
#     #       
#     #       lastVehicleIdEvents <<- vehicleId
#     #       lastDateEvents <<- to_date
#     #       lastShiftEvents <<- plotsShiftType
#     #     }
#     #   }
#     #   
#     # 
#     #   if(length(eventparameters) > 0)
#     #     for(i in 1:length(eventparameters)){
#     #       switch(eventparameters[i],
#     #              'LHDCycle' = {
#     #                eventsDataLoadCycle <- eventsData %>%
#     #                  select(loadcycle)
#     #                colnames(eventsDataLoadCycle) <- c("LHDCycle")
#     #              }
#     #       )
#     #       plotData <- cbind(plotData,eventsDataLoadCycle)
#     #     }
#     # # print(head(plotData)) 
#     # # print(eventparameters)
#     #   parameters  <- c(parametersY1Axis,parametersY2Axis,eventparameters)
#     parameters  <- c(parametersY2Axis)
#     # # print(parameters)
#     # 
#     #     
#     # #       abc <- head(plotData)
#     # #       print(abc$timestamp1)
#     # #       TZ="America/New_York"
#     # #       abc <- xts(abc[,c('hydpressboomup')], as.POSIXct(abc$timestamp1, format="%Y-%m-%d %H:%M:%S"),tzone = TZ)
#     # #       print(abc)
#     # 
#     # #     print(parametersY2Axis)
#     TZ="IST"
#     if(nrow(plotData) > 0){
#       finalData <- xts(plotData[,parameters], as.POSIXct(plotData$Time, format="%Y-%m-%d %H:%M"), tz = TZ)
#       #      finalData <- xts(plotData[,parameters], as.POSIXct(plotData$Time, format="%d-%m-%Y %H:%M"), tz = TZ)      
#       dygraph(finalData, main = "", xlab = "Timestamp",height = "1000px") %>% 
#         #       dygraph(finalData, main = "Chiller Playback", xlab = "Timestamp" ,height = "1000px") %>% 
#         dyLegend(width = 1000)   %>%
#         #           dySeries(parametersY2Axis, axis = 'y2') %>%
#         dyRangeSelector() %>%
#         # #         if ( 'LHDCycle'  %in% eventparameters ){
#         # #           dySeries("LHDCycle", stepPlot = TRUE) %>%
#         # #         }
#         dyHighlight(highlightSeriesOpts = list(strokeWidth = 2),hideOnMouseOut = FALSE) %>%
#         dyOptions(useDataTimezone = TRUE,colors = RColorBrewer::brewer.pal(3, "Dark2")) %>%
#         dyAxis("y", label = "% Load", independentTicks = TRUE, valueRange = c(0, 110) ) 
#       #           dyAxis("y2", label = "Y2 Parameters")
#       #     
#     }   
#     #### var_name = input$var
#     # print(var_name)
#     #### finalData <- xts(tvm_10min_new[,var_name], as.POSIXct(tvm_10min_new$Date, format="%Y-%m-%d %H:%M:%S"))
#     ####   dygraph(finalData) %>% 
#     ####     dyRangeSelector()
#   })
#   
#   ####################Sheet2###########################################
#   output$dygraphplot1_2 <- renderDygraph({
#     validate(
#       need(input$parametersY1Axis != "" || input$parametersY2Axis != "", label = "Parameters")
#     )
#     #   
#     #   
#     datefrom<-input$plotsDateFrom_2
#     dateto<-input$plotsDateTo_2
#     
#     #   plotsShiftType <- input$plotsShiftType
#     chillerId<-input$plots_chillerID_2
#     parametersY1Axis<-input$parametersY1Axis
#     #   parametersY2Axis<-input$parametersY2Axis
#     #   eventparameters <- input$plotEvents
#     #   plotsTime <- input$plotsTime
#     #   
#     #   
#     #   #Converting to date format 
#     from_date<-as.Date(datefrom, origin="2015-01-01")   
#     to_date<-as.Date(dateto, origin="2015-01-01")   
#     #   
#     if(chillerId != lastChillerId || to_date != lasttoDate || from_date != lastfromDate) {
#       #     #Get the plot data
#       plotData <<- list()
#       if(length(parametersY1Axis) > 0 ){
#         #       plotData <<- getPlotData(to_date,chillerId,plotsShiftType)   
#         plotData <<- subset(chiller_data,Chiller_ID == chillerId & as.Date(Time) >= from_date & as.Date(Time) <= to_date)
#         #        print (as.Date(chiller_data$Time))
#         #        print (from_date)
#         #        print (to_date)
#         #       print(plotData)       
#         #        plotdata <<- subset(chiller_data, Time = to_date)  
#         #        print(plotdata)
#         #plotData <<- tbl_df(plotdata)
#         lastChillerId <<- chillerId
#         lasttoDate <<- to_date
#         lastfromDate <<- from_date
#         
#         #       lastShift <<- plotsShiftType
#       }
#     }
#     #   
#     #   if(chillerId != lastChillericleIdEvents || to_date != lastDateEvents || plotsShiftType != lastShiftEvents) {
#     #     eventsData <<- list()
#     #     if(length(eventparameters) > 0){
#     #       eventsData <<- getEventsDataForLHD(to_date,vehicleId,plotsShiftType)
#     #       eventsData <<- tbl_df(eventsData)
#     #       
#     #       lastVehicleIdEvents <<- vehicleId
#     #       lastDateEvents <<- to_date
#     #       lastShiftEvents <<- plotsShiftType
#     #     }
#     #   }
#     #   
#     # 
#     #   if(length(eventparameters) > 0)
#     #     for(i in 1:length(eventparameters)){
#     #       switch(eventparameters[i],
#     #              'LHDCycle' = {
#     #                eventsDataLoadCycle <- eventsData %>%
#     #                  select(loadcycle)
#     #                colnames(eventsDataLoadCycle) <- c("LHDCycle")
#     #              }
#     #       )
#     #       plotData <- cbind(plotData,eventsDataLoadCycle)
#     #     }
#     # # print(head(plotData)) 
#     # # print(eventparameters)
#     #   parameters  <- c(parametersY1Axis,parametersY2Axis,eventparameters)
#     parameters  <- c(parametersY1Axis)
#     # # print(parameters)
#     # 
#     #     
#     # #       abc <- head(plotData)
#     # #       print(abc$timestamp1)
#     # #       TZ="America/New_York"
#     # #       abc <- xts(abc[,c('hydpressboomup')], as.POSIXct(abc$timestamp1, format="%Y-%m-%d %H:%M:%S"),tzone = TZ)
#     # #       print(abc)
#     # 
#     # #     print(parametersY2Axis)
#     TZ="IST"
#     if(nrow(plotData) > 0){
#       finalData <- xts(plotData[,parameters], as.POSIXct(plotData$Time, format="%Y-%m-%d %H:%M"), tz = TZ)
#       #      finalData <- xts(plotData[,parameters], as.POSIXct(plotData$Time, format="%d-%m-%Y %H:%M"), tz = TZ)      
#       dygraph(finalData, main = "", xlab = "Timestamp",height = "1000px") %>% 
#         #       dygraph(finalData, main = "Chiller Playback", xlab = "Timestamp" ,height = "1000px") %>% 
#         dyLegend(width = 1000)   %>%
#         #           dySeries(parametersY2Axis, axis = 'y2') %>%
#         dyRangeSelector() %>%
#         # #         if ( 'LHDCycle'  %in% eventparameters ){
#         # #           dySeries("LHDCycle", stepPlot = TRUE) %>%
#         # #         }
#         dyHighlight(highlightSeriesOpts = list(strokeWidth = 2),hideOnMouseOut = FALSE) %>%
#         dyOptions(useDataTimezone = TRUE,colors = RColorBrewer::brewer.pal(3, "Dark2")) %>%
#         dyAxis("y", label = "CHWSTD", independentTicks = TRUE, valueRange = c(0, 11)) 
#       #           dyAxis("y", label = "iKW/TR", independentTicks = TRUE, valueRange = c(40, 60)                  
#       #           dyAxis("y2", label = "Y2 Parameters")
#       #     
#     }   
#     #### var_name = input$var
#     # print(var_name)
#     #### finalData <- xts(tvm_10min_new[,var_name], as.POSIXct(tvm_10min_new$Date, format="%Y-%m-%d %H:%M:%S"))
#     ####   dygraph(finalData) %>% 
#     ####     dyRangeSelector()
#   })
#   
#   output$dygraphplot3_2 <- renderDygraph({
#     validate(
#       need(input$parametersY1Axis != "" || input$parametersY2Axis != "", label = "Parameters")
#     )
#     #   
#     #   
#     datefrom<-input$plotsDateFrom_2
#     dateto<-input$plotsDateTo_2
#     
#     #   plotsShiftType <- input$plotsShiftType
#     chillerId<-input$plots_chillerID_2
#     parametersY2Axis<-input$parametersY2Axis
#     #   parametersY2Axis<-input$parametersY2Axis
#     #   eventparameters <- input$plotEvents
#     #   plotsTime <- input$plotsTime
#     #   
#     #   
#     #   #Converting to date format 
#     from_date<-as.Date(datefrom, origin="2015-01-01")   
#     to_date<-as.Date(dateto, origin="2015-01-01")   
#     #   
#     if(chillerId != lastChillerId || to_date != lasttoDate || from_date != lastfromDate) {
#       #     #Get the plot data
#       plotData <<- list()
#       if(length(parametersY2Axis) > 0 ){
#         #       plotData <<- getPlotData(to_date,chillerId,plotsShiftType)   
#         plotData <<- subset(chiller_data,Chiller_ID == chillerId & as.Date(Time) >= from_date & as.Date(Time) <= to_date)
#         #        print (as.Date(chiller_data$Time))
#         #        print (from_date)
#         #        print (to_date)
#         #       print(plotData)       
#         #        plotdata <<- subset(chiller_data, Time = to_date)  
#         #        print(plotdata)
#         #plotData <<- tbl_df(plotdata)
#         lastChillerId <<- chillerId
#         lasttoDate <<- to_date
#         lastfromDate <<- from_date
#         #       lastShift <<- plotsShiftType
#       }
#     }
#     #   
#     #   if(chillerId != lastChillericleIdEvents || to_date != lastDateEvents || plotsShiftType != lastShiftEvents) {
#     #     eventsData <<- list()
#     #     if(length(eventparameters) > 0){
#     #       eventsData <<- getEventsDataForLHD(to_date,vehicleId,plotsShiftType)
#     #       eventsData <<- tbl_df(eventsData)
#     #       
#     #       lastVehicleIdEvents <<- vehicleId
#     #       lastDateEvents <<- to_date
#     #       lastShiftEvents <<- plotsShiftType
#     #     }
#     #   }
#     #   
#     # 
#     #   if(length(eventparameters) > 0)
#     #     for(i in 1:length(eventparameters)){
#     #       switch(eventparameters[i],
#     #              'LHDCycle' = {
#     #                eventsDataLoadCycle <- eventsData %>%
#     #                  select(loadcycle)
#     #                colnames(eventsDataLoadCycle) <- c("LHDCycle")
#     #              }
#     #       )
#     #       plotData <- cbind(plotData,eventsDataLoadCycle)
#     #     }
#     # # print(head(plotData)) 
#     # # print(eventparameters)
#     #   parameters  <- c(parametersY1Axis,parametersY2Axis,eventparameters)
#     parameters  <- c(parametersY2Axis)
#     # # print(parameters)
#     # 
#     #     
#     # #       abc <- head(plotData)
#     # #       print(abc$timestamp1)
#     # #       TZ="America/New_York"
#     # #       abc <- xts(abc[,c('hydpressboomup')], as.POSIXct(abc$timestamp1, format="%Y-%m-%d %H:%M:%S"),tzone = TZ)
#     # #       print(abc)
#     # 
#     # #     print(parametersY2Axis)
#     TZ="IST"
#     if(nrow(plotData) > 0){
#       finalData <- xts(plotData[,parameters], as.POSIXct(plotData$Time, format="%Y-%m-%d %H:%M"), tz = TZ)
#       #      finalData <- xts(plotData[,parameters], as.POSIXct(plotData$Time, format="%d-%m-%Y %H:%M"), tz = TZ)      
#       dygraph(finalData, main = "", xlab = "Timestamp",height = "1000px") %>% 
#         #       dygraph(finalData, main = "Chiller Playback", xlab = "Timestamp" ,height = "1000px") %>% 
#         dyLegend(width = 1000)   %>%
#         #           dySeries(parametersY2Axis, axis = 'y2') %>%
#         dyRangeSelector() %>%
#         # #         if ( 'LHDCycle'  %in% eventparameters ){
#         # #           dySeries("LHDCycle", stepPlot = TRUE) %>%
#         # #         }
#         dyHighlight(highlightSeriesOpts = list(strokeWidth = 2),hideOnMouseOut = FALSE) %>%
#         dyOptions(useDataTimezone = TRUE,colors = RColorBrewer::brewer.pal(3, "Dark2")) %>%
#         dyAxis("y", label = "CDWSTD", independentTicks = TRUE, valueRange = c(0, 11) ) 
#       #           dyAxis("y2", label = "Y2 Parameters")
#       #     
#     }   
#     #### var_name = input$var
#     # print(var_name)
#     #### finalData <- xts(tvm_10min_new[,var_name], as.POSIXct(tvm_10min_new$Date, format="%Y-%m-%d %H:%M:%S"))
#     ####   dygraph(finalData) %>% 
#     ####     dyRangeSelector()
#   })
#   
#   ################################### Sheet 3 #########################
#   
#   output$dygraphplot1_3 <- renderDygraph({
#     validate(
#       need(input$parametersY1Axis != "" || input$parametersY2Axis != "", label = "Parameters")
#     )
#     #   
#     #   
#     datefrom<-input$plotsDateFrom_3
#     dateto<-input$plotsDateTo_3
#     
#     #   plotsShiftType <- input$plotsShiftType
#     chillerId<-input$plots_chillerID_3
#     parametersY1Axis<-input$parametersY1Axis
#     #   parametersY2Axis<-input$parametersY2Axis
#     #   eventparameters <- input$plotEvents
#     #   plotsTime <- input$plotsTime
#     #   
#     #   
#     #   #Converting to date format 
#     from_date<-as.Date(datefrom, origin="2015-01-01")   
#     to_date<-as.Date(dateto, origin="2015-01-01")   
#     #   
#     if(chillerId != lastChillerId || to_date != lasttoDate || from_date != lastfromDate) {
#       #     #Get the plot data
#       plotData <<- list()
#       if(length(parametersY1Axis) > 0 ){
#         #       plotData <<- getPlotData(to_date,chillerId,plotsShiftType)   
#         plotData <<- subset(chiller_data,Chiller_ID == chillerId & as.Date(Time) >= from_date & as.Date(Time) <= to_date)
#         #        print (as.Date(chiller_data$Time))
#         #        print (from_date)
#         #        print (to_date)
#         #       print(plotData)       
#         #        plotdata <<- subset(chiller_data, Time = to_date)  
#         #        print(plotdata)
#         #plotData <<- tbl_df(plotdata)
#         lastChillerId <<- chillerId
#         lasttoDate <<- to_date
#         lastfromDate <<- from_date
#         
#         #       lastShift <<- plotsShiftType
#       }
#     }
#     #   
#     #   if(chillerId != lastChillericleIdEvents || to_date != lastDateEvents || plotsShiftType != lastShiftEvents) {
#     #     eventsData <<- list()
#     #     if(length(eventparameters) > 0){
#     #       eventsData <<- getEventsDataForLHD(to_date,vehicleId,plotsShiftType)
#     #       eventsData <<- tbl_df(eventsData)
#     #       
#     #       lastVehicleIdEvents <<- vehicleId
#     #       lastDateEvents <<- to_date
#     #       lastShiftEvents <<- plotsShiftType
#     #     }
#     #   }
#     #   
#     # 
#     #   if(length(eventparameters) > 0)
#     #     for(i in 1:length(eventparameters)){
#     #       switch(eventparameters[i],
#     #              'LHDCycle' = {
#     #                eventsDataLoadCycle <- eventsData %>%
#     #                  select(loadcycle)
#     #                colnames(eventsDataLoadCycle) <- c("LHDCycle")
#     #              }
#     #       )
#     #       plotData <- cbind(plotData,eventsDataLoadCycle)
#     #     }
#     # # print(head(plotData)) 
#     # # print(eventparameters)
#     #   parameters  <- c(parametersY1Axis,parametersY2Axis,eventparameters)
#     parameters  <- c(parametersY1Axis)
#     # # print(parameters)
#     # 
#     #     
#     # #       abc <- head(plotData)
#     # #       print(abc$timestamp1)
#     # #       TZ="America/New_York"
#     # #       abc <- xts(abc[,c('hydpressboomup')], as.POSIXct(abc$timestamp1, format="%Y-%m-%d %H:%M:%S"),tzone = TZ)
#     # #       print(abc)
#     # 
#     # #     print(parametersY2Axis)
#     TZ="IST"
#     if(nrow(plotData) > 0){
#       finalData <- xts(plotData[,parameters], as.POSIXct(plotData$Time, format="%Y-%m-%d %H:%M"), tz = TZ)
#       #      finalData <- xts(plotData[,parameters], as.POSIXct(plotData$Time, format="%d-%m-%Y %H:%M"), tz = TZ)      
#       dygraph(finalData, main = "", xlab = "Timestamp",height = "1000px") %>% 
#         #       dygraph(finalData, main = "Chiller Playback", xlab = "Timestamp" ,height = "1000px") %>% 
#         dyLegend(width = 1000)   %>%
#         #           dySeries(parametersY2Axis, axis = 'y2') %>%
#         dyRangeSelector() %>%
#         # #         if ( 'LHDCycle'  %in% eventparameters ){
#         # #           dySeries("LHDCycle", stepPlot = TRUE) %>%
#         # #         }
#         dyHighlight(highlightSeriesOpts = list(strokeWidth = 2),hideOnMouseOut = FALSE) %>%
#         dyOptions(useDataTimezone = TRUE,colors = RColorBrewer::brewer.pal(3, "Dark2")) %>%
#         dyAxis("y", label = "CHW Delta T", independentTicks = TRUE, valueRange = c(0, 32)) 
#       #           dyAxis("y", label = "iKW/TR", independentTicks = TRUE, valueRange = c(40, 60)                  
#       #           dyAxis("y2", label = "Y2 Parameters")
#       #     
#     }   
#     #### var_name = input$var
#     # print(var_name)
#     #### finalData <- xts(tvm_10min_new[,var_name], as.POSIXct(tvm_10min_new$Date, format="%Y-%m-%d %H:%M:%S"))
#     ####   dygraph(finalData) %>% 
#     ####     dyRangeSelector()
#   })
#   
#   output$dygraphplot3_3 <- renderDygraph({
#     validate(
#       need(input$parametersY1Axis != "" || input$parametersY2Axis != "", label = "Parameters")
#     )
#     #   
#     #   
#     datefrom<-input$plotsDateFrom_3
#     dateto<-input$plotsDateTo_3
#     
#     #   plotsShiftType <- input$plotsShiftType
#     chillerId<-input$plots_chillerID_3
#     parametersY2Axis<-input$parametersY2Axis
#     #   parametersY2Axis<-input$parametersY2Axis
#     #   eventparameters <- input$plotEvents
#     #   plotsTime <- input$plotsTime
#     #   
#     #   
#     #   #Converting to date format 
#     from_date<-as.Date(datefrom, origin="2015-01-01")   
#     to_date<-as.Date(dateto, origin="2015-01-01")   
#     #   
#     if(chillerId != lastChillerId || to_date != lasttoDate || from_date != lastfromDate) {
#       #     #Get the plot data
#       plotData <<- list()
#       if(length(parametersY2Axis) > 0 ){
#         #       plotData <<- getPlotData(to_date,chillerId,plotsShiftType)   
#         plotData <<- subset(chiller_data,Chiller_ID == chillerId & as.Date(Time) >= from_date & as.Date(Time) <= to_date)
#         #        print (as.Date(chiller_data$Time))
#         #        print (from_date)
#         #        print (to_date)
#         #       print(plotData)       
#         #        plotdata <<- subset(chiller_data, Time = to_date)  
#         #        print(plotdata)
#         #plotData <<- tbl_df(plotdata)
#         lastChillerId <<- chillerId
#         lasttoDate <<- to_date
#         lastfromDate <<- from_date
#         #       lastShift <<- plotsShiftType
#       }
#     }
#     #   
#     #   if(chillerId != lastChillericleIdEvents || to_date != lastDateEvents || plotsShiftType != lastShiftEvents) {
#     #     eventsData <<- list()
#     #     if(length(eventparameters) > 0){
#     #       eventsData <<- getEventsDataForLHD(to_date,vehicleId,plotsShiftType)
#     #       eventsData <<- tbl_df(eventsData)
#     #       
#     #       lastVehicleIdEvents <<- vehicleId
#     #       lastDateEvents <<- to_date
#     #       lastShiftEvents <<- plotsShiftType
#     #     }
#     #   }
#     #   
#     # 
#     #   if(length(eventparameters) > 0)
#     #     for(i in 1:length(eventparameters)){
#     #       switch(eventparameters[i],
#     #              'LHDCycle' = {
#     #                eventsDataLoadCycle <- eventsData %>%
#     #                  select(loadcycle)
#     #                colnames(eventsDataLoadCycle) <- c("LHDCycle")
#     #              }
#     #       )
#     #       plotData <- cbind(plotData,eventsDataLoadCycle)
#     #     }
#     # # print(head(plotData)) 
#     # # print(eventparameters)
#     #   parameters  <- c(parametersY1Axis,parametersY2Axis,eventparameters)
#     parameters  <- c(parametersY2Axis)
#     # # print(parameters)
#     # 
#     #     
#     # #       abc <- head(plotData)
#     # #       print(abc$timestamp1)
#     # #       TZ="America/New_York"
#     # #       abc <- xts(abc[,c('hydpressboomup')], as.POSIXct(abc$timestamp1, format="%Y-%m-%d %H:%M:%S"),tzone = TZ)
#     # #       print(abc)
#     # 
#     # #     print(parametersY2Axis)
#     TZ="IST"
#     if(nrow(plotData) > 0){
#       finalData <- xts(plotData[,parameters], as.POSIXct(plotData$Time, format="%Y-%m-%d %H:%M"), tz = TZ)
#       #      finalData <- xts(plotData[,parameters], as.POSIXct(plotData$Time, format="%d-%m-%Y %H:%M"), tz = TZ)      
#       dygraph(finalData, main = "", xlab = "Timestamp",height = "1000px") %>% 
#         #       dygraph(finalData, main = "Chiller Playback", xlab = "Timestamp" ,height = "1000px") %>% 
#         dyLegend(width = 1000)   %>%
#         #           dySeries(parametersY2Axis, axis = 'y2') %>%
#         dyRangeSelector() %>%
#         # #         if ( 'LHDCycle'  %in% eventparameters ){
#         # #           dySeries("LHDCycle", stepPlot = TRUE) %>%
#         # #         }
#         dyHighlight(highlightSeriesOpts = list(strokeWidth = 2),hideOnMouseOut = FALSE) %>%
#         dyOptions(useDataTimezone = TRUE,colors = RColorBrewer::brewer.pal(3, "Dark2")) %>%
#         dyAxis("y", label = "CDW Delta T", independentTicks = TRUE, valueRange = c(0, 32) ) 
#       #           dyAxis("y2", label = "Y2 Parameters")
#       #     
#     }   
#     #### var_name = input$var
#     # print(var_name)
#     #### finalData <- xts(tvm_10min_new[,var_name], as.POSIXct(tvm_10min_new$Date, format="%Y-%m-%d %H:%M:%S"))
#     ####   dygraph(finalData) %>% 
#     ####     dyRangeSelector()
#   })
#   
#   ################################### Sheet 4 #########################
#   
#   output$dygraphplot1_4 <- renderDygraph({
#     validate(
#       need(input$parametersY1Axis != "" || input$parametersY2Axis != "", label = "Parameters")
#     )
#     #   
#     #   
#     datefrom<-input$plotsDateFrom_4
#     dateto<-input$plotsDateTo_4
#     
#     #   plotsShiftType <- input$plotsShiftType
#     chillerId<-input$plots_chillerID_4
#     parametersY1Axis<-input$parametersY1Axis
#     #   parametersY2Axis<-input$parametersY2Axis
#     #   eventparameters <- input$plotEvents
#     #   plotsTime <- input$plotsTime
#     #   
#     #   
#     #   #Converting to date format 
#     from_date<-as.Date(datefrom, origin="2015-01-01")   
#     to_date<-as.Date(dateto, origin="2015-01-01")   
#     #   
#     if(chillerId != lastChillerId || to_date != lasttoDate || from_date != lastfromDate) {
#       #     #Get the plot data
#       plotData <<- list()
#       if(length(parametersY1Axis) > 0 ){
#         #       plotData <<- getPlotData(to_date,chillerId,plotsShiftType)   
#         plotData <<- subset(chiller_data,Chiller_ID == chillerId & as.Date(Time) >= from_date & as.Date(Time) <= to_date)
#         #        print (as.Date(chiller_data$Time))
#         #        print (from_date)
#         #        print (to_date)
#         #       print(plotData)       
#         #        plotdata <<- subset(chiller_data, Time = to_date)  
#         #        print(plotdata)
#         #plotData <<- tbl_df(plotdata)
#         lastChillerId <<- chillerId
#         lasttoDate <<- to_date
#         lastfromDate <<- from_date
#         
#         #       lastShift <<- plotsShiftType
#       }
#     }
#     #   
#     #   if(chillerId != lastChillericleIdEvents || to_date != lastDateEvents || plotsShiftType != lastShiftEvents) {
#     #     eventsData <<- list()
#     #     if(length(eventparameters) > 0){
#     #       eventsData <<- getEventsDataForLHD(to_date,vehicleId,plotsShiftType)
#     #       eventsData <<- tbl_df(eventsData)
#     #       
#     #       lastVehicleIdEvents <<- vehicleId
#     #       lastDateEvents <<- to_date
#     #       lastShiftEvents <<- plotsShiftType
#     #     }
#     #   }
#     #   
#     # 
#     #   if(length(eventparameters) > 0)
#     #     for(i in 1:length(eventparameters)){
#     #       switch(eventparameters[i],
#     #              'LHDCycle' = {
#     #                eventsDataLoadCycle <- eventsData %>%
#     #                  select(loadcycle)
#     #                colnames(eventsDataLoadCycle) <- c("LHDCycle")
#     #              }
#     #       )
#     #       plotData <- cbind(plotData,eventsDataLoadCycle)
#     #     }
#     # # print(head(plotData)) 
#     # # print(eventparameters)
#     #   parameters  <- c(parametersY1Axis,parametersY2Axis,eventparameters)
#     parameters  <- c(parametersY1Axis)
#     # # print(parameters)
#     # 
#     #     
#     # #       abc <- head(plotData)
#     # #       print(abc$timestamp1)
#     # #       TZ="America/New_York"
#     # #       abc <- xts(abc[,c('hydpressboomup')], as.POSIXct(abc$timestamp1, format="%Y-%m-%d %H:%M:%S"),tzone = TZ)
#     # #       print(abc)
#     # 
#     # #     print(parametersY2Axis)
#     TZ="IST"
#     if(nrow(plotData) > 0){
#       finalData <- xts(plotData[,parameters], as.POSIXct(plotData$Time, format="%Y-%m-%d %H:%M"), tz = TZ)
#       #      finalData <- xts(plotData[,parameters], as.POSIXct(plotData$Time, format="%d-%m-%Y %H:%M"), tz = TZ)      
#       dygraph(finalData, main = "", xlab = "Timestamp",height = "1000px") %>% 
#         #       dygraph(finalData, main = "Chiller Playback", xlab = "Timestamp" ,height = "1000px") %>% 
#         dyLegend(width = 1000)   %>%
#         #           dySeries(parametersY2Axis, axis = 'y2') %>%
#         dyRangeSelector() %>%
#         # #         if ( 'LHDCycle'  %in% eventparameters ){
#         # #           dySeries("LHDCycle", stepPlot = TRUE) %>%
#         # #         }
#         dyHighlight(highlightSeriesOpts = list(strokeWidth = 2),hideOnMouseOut = FALSE) %>%
#         dyOptions(useDataTimezone = TRUE,colors = RColorBrewer::brewer.pal(3, "Dark2")) %>%
#         dyAxis("y", label = "Cooling Tower Eff.", independentTicks = TRUE, valueRange = c(0, 2)) 
#       #           dyAxis("y", label = "iKW/TR", independentTicks = TRUE, valueRange = c(40, 60)                  
#       #           dyAxis("y2", label = "Y2 Parameters")
#       #     
#     }   
#     #### var_name = input$var
#     # print(var_name)
#     #### finalData <- xts(tvm_10min_new[,var_name], as.POSIXct(tvm_10min_new$Date, format="%Y-%m-%d %H:%M:%S"))
#     ####   dygraph(finalData) %>% 
#     ####     dyRangeSelector()
#   })
#   
#   # output$dygraphplot3_4 <- renderDygraph({
#   #   validate(
#   #     need(input$parametersY1Axis != "" || input$parametersY2Axis != "", label = "Parameters")
#   #   )
#   #   #   
#   #   #   
#   #   datefrom<-input$plotsDateFrom_4
#   #   dateto<-input$plotsDateTo_4
#   #   
#   #   #   plotsShiftType <- input$plotsShiftType
#   #   chillerId<-input$plots_chillerID_4
#   #   parametersY2Axis<-input$parametersY2Axis
#   #   #   parametersY2Axis<-input$parametersY2Axis
#   #   #   eventparameters <- input$plotEvents
#   #   #   plotsTime <- input$plotsTime
#   #   #   
#   #   #   
#   #   #   #Converting to date format 
#   #   from_date<-as.Date(datefrom, origin="2015-01-01")   
#   #   to_date<-as.Date(dateto, origin="2015-01-01")   
#   #   #   
#   #   if(chillerId != lastChillerId || to_date != lasttoDate || from_date != lastfromDate) {
#   #     #     #Get the plot data
#   #     plotData <<- list()
#   #     if(length(parametersY2Axis) > 0 ){
#   #       #       plotData <<- getPlotData(to_date,chillerId,plotsShiftType)   
#   #       plotData <<- subset(chiller_data,Chiller_ID == chillerId & as.Date(Time) >= from_date & as.Date(Time) <= to_date)
#   #       #        print (as.Date(chiller_data$Time))
#   #       #        print (from_date)
#   #       #        print (to_date)
#   #       #       print(plotData)       
#   #       #        plotdata <<- subset(chiller_data, Time = to_date)  
#   #       #        print(plotdata)
#   #       #plotData <<- tbl_df(plotdata)
#   #       lastChillerId <<- chillerId
#   #       lasttoDate <<- to_date
#   #       lastfromDate <<- from_date
#   #       #       lastShift <<- plotsShiftType
#   #     }
#   #   }
#   #   #   
#   #   #   if(chillerId != lastChillericleIdEvents || to_date != lastDateEvents || plotsShiftType != lastShiftEvents) {
#   #   #     eventsData <<- list()
#   #   #     if(length(eventparameters) > 0){
#   #   #       eventsData <<- getEventsDataForLHD(to_date,vehicleId,plotsShiftType)
#   #   #       eventsData <<- tbl_df(eventsData)
#   #   #       
#   #   #       lastVehicleIdEvents <<- vehicleId
#   #   #       lastDateEvents <<- to_date
#   #   #       lastShiftEvents <<- plotsShiftType
#   #   #     }
#   #   #   }
#   #   #   
#   #   # 
#   #   #   if(length(eventparameters) > 0)
#   #   #     for(i in 1:length(eventparameters)){
#   #   #       switch(eventparameters[i],
#   #   #              'LHDCycle' = {
#   #   #                eventsDataLoadCycle <- eventsData %>%
#   #   #                  select(loadcycle)
#   #   #                colnames(eventsDataLoadCycle) <- c("LHDCycle")
#   #   #              }
#   #   #       )
#   #   #       plotData <- cbind(plotData,eventsDataLoadCycle)
#   #   #     }
#   #   # # print(head(plotData)) 
#   #   # # print(eventparameters)
#   #   #   parameters  <- c(parametersY1Axis,parametersY2Axis,eventparameters)
#   #   parameters  <- c(parametersY2Axis)
#   #   # # print(parameters)
#   #   # 
#   #   #     
#   #   # #       abc <- head(plotData)
#   #   # #       print(abc$timestamp1)
#   #   # #       TZ="America/New_York"
#   #   # #       abc <- xts(abc[,c('hydpressboomup')], as.POSIXct(abc$timestamp1, format="%Y-%m-%d %H:%M:%S"),tzone = TZ)
#   #   # #       print(abc)
#   #   # 
#   #   # #     print(parametersY2Axis)
#   #   TZ="IST"
#   #   if(nrow(plotData) > 0){
#   #     finalData <- xts(plotData[,parameters], as.POSIXct(plotData$Time, format="%Y-%m-%d %H:%M"), tz = TZ)
#   #     #      finalData <- xts(plotData[,parameters], as.POSIXct(plotData$Time, format="%d-%m-%Y %H:%M"), tz = TZ)      
#   #     dygraph(finalData, main = "", xlab = "Timestamp",height = "1000px") %>% 
#   #       #       dygraph(finalData, main = "Chiller Playback", xlab = "Timestamp" ,height = "1000px") %>% 
#   #       dyLegend(width = 1000)   %>%
#   #       #           dySeries(parametersY2Axis, axis = 'y2') %>%
#   #       dyRangeSelector() %>%
#   #       # #         if ( 'LHDCycle'  %in% eventparameters ){
#   #       # #           dySeries("LHDCycle", stepPlot = TRUE) %>%
#   #       # #         }
#   #       dyHighlight(highlightSeriesOpts = list(strokeWidth = 2),hideOnMouseOut = FALSE) %>%
#   #       dyOptions(useDataTimezone = TRUE,colors = RColorBrewer::brewer.pal(3, "Dark2")) %>%
#   #       dyAxis("y", label = "% Load", independentTicks = TRUE, valueRange = c(0, 1.1) ) 
#   #     #           dyAxis("y2", label = "Y2 Parameters")
#   #     #     
#   #   }   
#   #   #### var_name = input$var
#   #   # print(var_name)
#   #   #### finalData <- xts(tvm_10min_new[,var_name], as.POSIXct(tvm_10min_new$Date, format="%Y-%m-%d %H:%M:%S"))
#   #   ####   dygraph(finalData) %>% 
#   #   ####     dyRangeSelector()
#   # })
#   
#   
#   
#   
#   
#   
#   
#   
#   ##-------------------------------------------------Plots Sheet - 5 -----------------------------------------------
#   
#   
#   output$dygraphplot1_5 <- renderDygraph({
#     validate(
#       need(input$parametersY1Axis != "" || input$parametersY2Axis != "", label = "Parameters")
#     )
#     #   
#     #   
#     datefrom<-input$plotsDateFrom_5
#     dateto<-input$plotsDateTo_5
#     
#     #   plotsShiftType <- input$plotsShiftType
#     chillerId<-input$plots_chillerID_5
#     parametersY1Axis<-input$parametersY1Axis
#     #   parametersY2Axis<-input$parametersY2Axis
#     #   eventparameters <- input$plotEvents
#     #   plotsTime <- input$plotsTime
#     #   
#     #   
#     #   #Converting to date format 
#     from_date<-as.Date(datefrom, origin="2015-01-01")   
#     to_date<-as.Date(dateto, origin="2015-01-01")   
#     #   
#     if(chillerId != lastChillerId || to_date != lasttoDate || from_date != lastfromDate) {
#       #     #Get the plot data
#       plotData <<- list()
#       if(length(parametersY1Axis) > 0 ){
#         #       plotData <<- getPlotData(to_date,chillerId,plotsShiftType)   
#         plotData <<- subset(chiller_data,Chiller_ID == chillerId & as.Date(Time) >= from_date & as.Date(Time) <= to_date)
#         #        print (as.Date(chiller_data$Time))
#         #        print (from_date)
#         #        print (to_date)
#         #       print(plotData)       
#         #        plotdata <<- subset(chiller_data, Time = to_date)  
#         #        print(plotdata)
#         #plotData <<- tbl_df(plotdata)
#         lastChillerId <<- chillerId
#         lasttoDate <<- to_date
#         lastfromDate <<- from_date
#         
#         #       lastShift <<- plotsShiftType
#       }
#     }
#     #   
#     #   if(chillerId != lastChillericleIdEvents || to_date != lastDateEvents || plotsShiftType != lastShiftEvents) {
#     #     eventsData <<- list()
#     #     if(length(eventparameters) > 0){
#     #       eventsData <<- getEventsDataForLHD(to_date,vehicleId,plotsShiftType)
#     #       eventsData <<- tbl_df(eventsData)
#     #       
#     #       lastVehicleIdEvents <<- vehicleId
#     #       lastDateEvents <<- to_date
#     #       lastShiftEvents <<- plotsShiftType
#     #     }
#     #   }
#     #   
#     # 
#     #   if(length(eventparameters) > 0)
#     #     for(i in 1:length(eventparameters)){
#     #       switch(eventparameters[i],
#     #              'LHDCycle' = {
#     #                eventsDataLoadCycle <- eventsData %>%
#     #                  select(loadcycle)
#     #                colnames(eventsDataLoadCycle) <- c("LHDCycle")
#     #              }
#     #       )
#     #       plotData <- cbind(plotData,eventsDataLoadCycle)
#     #     }
#     # # print(head(plotData)) 
#     # # print(eventparameters)
#     #   parameters  <- c(parametersY1Axis,parametersY2Axis,eventparameters)
#     parameters  <- c(parametersY1Axis)
#     # # print(parameters)
#     # 
#     #     
#     # #       abc <- head(plotData)
#     # #       print(abc$timestamp1)
#     # #       TZ="America/New_York"
#     # #       abc <- xts(abc[,c('hydpressboomup')], as.POSIXct(abc$timestamp1, format="%Y-%m-%d %H:%M:%S"),tzone = TZ)
#     # #       print(abc)
#     # 
#     # #     print(parametersY2Axis)
#     TZ="IST"
#     if(nrow(plotData) > 0){
#       finalData <- xts(plotData[,parameters], as.POSIXct(plotData$Time, format="%Y-%m-%d %H:%M"), tz = TZ)
#       #      finalData <- xts(plotData[,parameters], as.POSIXct(plotData$Time, format="%d-%m-%Y %H:%M"), tz = TZ)      
#       dygraph(finalData, main = "", xlab = "Timestamp",height = "1000px") %>% 
#         #       dygraph(finalData, main = "Chiller Playback", xlab = "Timestamp" ,height = "1000px") %>% 
#         dyLegend(width = 1000)   %>%
#         #           dySeries(parametersY2Axis, axis = 'y2') %>%
#         dyRangeSelector() %>%
#         # #         if ( 'LHDCycle'  %in% eventparameters ){
#         # #           dySeries("LHDCycle", stepPlot = TRUE) %>%
#         # #         }
#         dyHighlight(highlightSeriesOpts = list(strokeWidth = 2),hideOnMouseOut = FALSE) %>%
#         dyOptions(useDataTimezone = TRUE,colors = RColorBrewer::brewer.pal(3, "Dark2")) %>%
#         dyAxis("y", label = " ", independentTicks = TRUE) 
#       #           dyAxis("y", label = "iKW/TR", independentTicks = TRUE, valueRange = c(40, 60)                  
#       #           dyAxis("y2", label = "Y2 Parameters")
#       #     
#     }   
#     #### var_name = input$var
#     # print(var_name)
#     #### finalData <- xts(tvm_10min_new[,var_name], as.POSIXct(tvm_10min_new$Date, format="%Y-%m-%d %H:%M:%S"))
#     ####   dygraph(finalData) %>% 
#     ####     dyRangeSelector()
#   })
#   
#   output$dygraphplot3_5 <- renderDygraph({
#     validate(
#       need(input$parametersY1Axis != "" || input$parametersY2Axis != "", label = "Parameters")
#     )
#     #   
#     #   
#     datefrom<-input$plotsDateFrom_5
#     dateto<-input$plotsDateTo_5
#     
#     #   plotsShiftType <- input$plotsShiftType
#     chillerId<-input$plots_chillerID_5
#     parametersY2Axis<-input$parametersY2Axis
#     #   parametersY2Axis<-input$parametersY2Axis
#     #   eventparameters <- input$plotEvents
#     #   plotsTime <- input$plotsTime
#     #   
#     #   
#     #   #Converting to date format 
#     from_date<-as.Date(datefrom, origin="2015-01-01")   
#     to_date<-as.Date(dateto, origin="2015-01-01")   
#     #   
#     if(chillerId != lastChillerId || to_date != lasttoDate || from_date != lastfromDate) {
#       #     #Get the plot data
#       plotData <<- list()
#       if(length(parametersY2Axis) > 0 ){
#         #       plotData <<- getPlotData(to_date,chillerId,plotsShiftType)   
#         plotData <<- subset(chiller_data,Chiller_ID == chillerId & as.Date(Time) >= from_date & as.Date(Time) <= to_date)
#         #        print (as.Date(chiller_data$Time))
#         #        print (from_date)
#         #        print (to_date)
#         #       print(plotData)       
#         #        plotdata <<- subset(chiller_data, Time = to_date)  
#         #        print(plotdata)
#         #plotData <<- tbl_df(plotdata)
#         lastChillerId <<- chillerId
#         lasttoDate <<- to_date
#         lastfromDate <<- from_date
#         #       lastShift <<- plotsShiftType
#       }
#     }
#     #   
#     #   if(chillerId != lastChillericleIdEvents || to_date != lastDateEvents || plotsShiftType != lastShiftEvents) {
#     #     eventsData <<- list()
#     #     if(length(eventparameters) > 0){
#     #       eventsData <<- getEventsDataForLHD(to_date,vehicleId,plotsShiftType)
#     #       eventsData <<- tbl_df(eventsData)
#     #       
#     #       lastVehicleIdEvents <<- vehicleId
#     #       lastDateEvents <<- to_date
#     #       lastShiftEvents <<- plotsShiftType
#     #     }
#     #   }
#     #   
#     # 
#     #   if(length(eventparameters) > 0)
#     #     for(i in 1:length(eventparameters)){
#     #       switch(eventparameters[i],
#     #              'LHDCycle' = {
#     #                eventsDataLoadCycle <- eventsData %>%
#     #                  select(loadcycle)
#     #                colnames(eventsDataLoadCycle) <- c("LHDCycle")
#     #              }
#     #       )
#     #       plotData <- cbind(plotData,eventsDataLoadCycle)
#     #     }
#     # # print(head(plotData)) 
#     # # print(eventparameters)
#     #   parameters  <- c(parametersY1Axis,parametersY2Axis,eventparameters)
#     parameters  <- c(parametersY2Axis)
#     # # print(parameters)
#     # 
#     #     
#     # #       abc <- head(plotData)
#     # #       print(abc$timestamp1)
#     # #       TZ="America/New_York"
#     # #       abc <- xts(abc[,c('hydpressboomup')], as.POSIXct(abc$timestamp1, format="%Y-%m-%d %H:%M:%S"),tzone = TZ)
#     # #       print(abc)
#     # 
#     # #     print(parametersY2Axis)
#     TZ="IST"
#     if(nrow(plotData) > 0){
#       finalData <- xts(plotData[,parameters], as.POSIXct(plotData$Time, format="%Y-%m-%d %H:%M"), tz = TZ)
#       #      finalData <- xts(plotData[,parameters], as.POSIXct(plotData$Time, format="%d-%m-%Y %H:%M"), tz = TZ)      
#       dygraph(finalData, main = "", xlab = "Timestamp",height = "1000px") %>% 
#         #       dygraph(finalData, main = "Chiller Playback", xlab = "Timestamp" ,height = "1000px") %>% 
#         dyLegend(width = 1000)   %>%
#         #           dySeries(parametersY2Axis, axis = 'y2') %>%
#         dyRangeSelector() %>%
#         # #         if ( 'LHDCycle'  %in% eventparameters ){
#         # #           dySeries("LHDCycle", stepPlot = TRUE) %>%
#         # #         }
#         dyHighlight(highlightSeriesOpts = list(strokeWidth = 2),hideOnMouseOut = FALSE) %>%
#         dyOptions(useDataTimezone = TRUE,colors = RColorBrewer::brewer.pal(3, "Set1")) %>%
#         dyAxis("y", label = " ", independentTicks = TRUE ) 
#       #           dyAxis("y2", label = "Y2 Parameters")
#       #     
#     }   
#     #### var_name = input$var
#     # print(var_name)
#     #### finalData <- xts(tvm_10min_new[,var_name], as.POSIXct(tvm_10min_new$Date, format="%Y-%m-%d %H:%M:%S"))
#     ####   dygraph(finalData) %>% 
#     ####     dyRangeSelector()
#   })
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   
#   ##-------------------------------------------------Plots Sheet - 2  END-----------------------------------------------
#   
#   
#   
#   #   
#   # 
#   # 
#   # 
#   # #------------------------------------------------ Main Plot END Testing-------------------------------------   
#   # 
#   # 
#   # 
#   # 
#   # 
#   # 
#   # 
#   # 
#   # 
#   # 
#   # 
#   # 
#   # 
#   # 
#   # 
#   # 
#   # 
#   # 
#   # 
#   # 
#   # 
#   # 
#   # 
#   # 
#   # 
#   # 
#   # 
#   # 
#   # #------------------------------------------------- REPORTS Start -------------------------------------------------------
#   # 
#   # #---------------------------------------------- Individual Repots Start ------------------------------------------------------------------
#   # 
#   # 
#   # # Table
#   # machineReportName <- 0
#   #  output$iReportsTable <-  DT::renderDataTable({
#   # 
#   #    switch(input$ireportName,
#   #           'Utilization' = {
#   #             sqlText <- paste0("SELECT vehicle_id,date1 as Date,shift,working_hour,idle_hours,totalenginehour,percent_working_idle,percent_working_10hr_target,distance_travelled FROM vale_simple")
#   #           },
#   #           'Utilization Advance' = {
#   #             sqlText <- paste0("SELECT vehicle_id,date1 as Date,shift,working_hours_loaded,working_hours_unloaded,total_working_hours,idle_hours_loaded,idle_hours_unloaded,total_idle_hours,total_engine_hours,percent_working_idle,percent_working_10_hr_target FROM vale_adv")
#   #           },
#   #           'Fuel Utilization' = {
#   #             sqlText <- paste0("SELECT vehicle_id,date1 as Date,shift,working_fuel_loaded,working_fuel_unloaded,total_working_fuel,idle_fuel_loaded,idle_fuel_unloaded, total_idle_fuel,total_fuel,percent_working_idle,distance_travelled,ave_fuel FROM vale_fuel")
#   #           }
#   #    )
#   #    
#   #    if( input$ireportName != machineReportName){
#   # 
#   #       iReportstableData <<- getReportsitableData(sqlText)
#   #       machineReportName <<- input$ireportName
#   #    }
#   #    
#   #    switch(input$ireportName,
#   #           'Utilization' = {
#   #             colnames(iReportstableData) <- c('VehicleId','Date','Shift','Working Hours','Idle Hours','Total Engine Hours','% Working vs Idle','% Working in 10 Hours Target','Distance Travelled')
#   #             tableTitle <- "Shows Basic Vehicle Utilization Details"
#   #           },
#   #           'Utilization Advance' = {
#   #             colnames(iReportstableData) <- c('VehicleId','Date','Shift','Working Hours - Loaded','Working Hours - Unloaded','Total Working Hours','Idle Hours - Loaded','Idle Hours - Unloaded','Total Idle Hours','Total Engine Hours','% Working vs Idle','% Working in 10 Hours Target')
#   #             tableTitle <- "Shows Advanced Vehicle Utilization Details"
#   #           },
#   #           'Fuel Utilization' = {
#   #             colnames(iReportstableData) <- c('VehicleId','Date','Shift','Working Fuel - Loaded','Working Fule - Unloaded','Total Working Hours','Idel Fuel - Loaded','Idle Fuel - Unloaded','Total Idle Fuel','Total Fuel','% Working vs Idle','Distance Travelled','Avg Fuel')
#   #             tableTitle <- "Shows Fuel Utilization Details"
#   #           }
#   #    )
#   #     vehicleIdMachine <- input$iReportsTableVehicelID
#   #     iReportstableData[,-c(1,2,3)] <- round(iReportstableData[,-c(1,2,3)],2)
#   #     iReportstableData <- tbl_df(iReportstableData) %>% replace(is.na(.),0) %>% filter(VehicleId == vehicleIdMachine)
#   # 
#   # # myMat <- as.matrix(a)
#   # # names(dimnames(myMat)) <- c("Names.of.Rows", "")
#   # #       iReportstableData <- cbind('Sl. No' = rownames(iReportstableData), iReportstableData)   
#   # #       rownames(iReportstableData) <- NULL
#   # 
#   #    
#   #    datatable(iReportstableData,extensions = c('Responsive','TableTools'),
#   #              caption = htmltools::tags$caption(
#   #                style = 'text-align: center;', htmltools::em(tableTitle)
#   #              ),
#   # #              options = list(
#   # #                searchHighlight = TRUE,
#   # #                lengthMenu = list(c(10, 25, 50, -1), c('10', '25', '50','All')),pageLength = 10,
#   # #                dom = 'T<"clear">lfrtip',
#   # #                tableTools = list(
#   # #                  sSwfPath = copySWF(),
#   # #                  aButtons = list('copy', 'print', list(
#   # #                    sExtends = 'collection',
#   # #                    sButtonText = 'Save',
#   # #                    aButtons = c('csv', 'xls')
#   # #                  )))
#   # #              )
#   # #    )
#   #             
#   #              options = list(searchHighlight = TRUE,lengthMenu = list(c(10, 25, 50, -1), c('10', '25', '50','All')),
#   #                             pageLength = 10,dom = 'T<"clear">lfrtip',tableTools = list(sSwfPath = copySWF()) ))
#   #    
#   # #    },filter = 'bottom',extensions = list(FixedColumns = list(leftColumns = 4)),
#   # #    options = list(searchHighlight = TRUE,pageLength = 10,dom = 'T<"clear">lfrtip',tableTools = list(sSwfPath = copySWF()) , scrollX = TRUE,scrollCollapse = TRUE)
#   # #       
#   # })
#   # 
#   # 
#   # # Bar Chart
#   # 
#   # lastiReportsToDate <- Sys.Date()+1
#   # lastiReportsFromDate <- Sys.Date()
#   # lastiReportsVehicleId <- 0
#   # 
#   # output$ireportplot <- renderbarchart({
#   #   
#   #     validate(
#   #         need(input$ireportParameters != "" , label = "Parameters")
#   #     )
#   #   
#   #     fromDate<-input$iReportsFromDate
#   #     toDate <- input$iReportsToDate
#   #     vehicleId<-input$iReportsVehicelID
#   #     shiftType <- input$iReportsShiftType
#   #     iReportParameters<-input$ireportParameters
#   #     
#   # 
#   #     #Converting to date format 
#   #     fromDate<-as.Date(fromDate, origin="1970-01-01")
#   #     toDate<-as.Date(toDate, origin="1970-01-01")
#   # 
#   #    if(vehicleId != lastiReportsVehicleId || toDate != lastiReportsToDate || fromDate != lastiReportsFromDate) {
#   #      #Get the plot data
#   #       iReportsdata <<- getReportsBarchartData(vehicleId, fromDate,toDate)
#   # #       iReportsDataLoadCycle <<- getReportsBarchartDataLoadCycle(vehicleId, fromDate,toDate)
#   #       lastiReportsVehicleId <<- vehicleId
#   #       lastiReportsToDate <<- toDate
#   #       lastiReportsFromDate <<- fromDate
#   #    }
#   # 
#   # #    iReportsdata <- cbind(iReportsdata,iReportsDataLoadCycle)
#   #    iReportsdata <- iReportsdata[iReportsdata$shift==shiftType,]
#   #    iReportsdata <- tbl_df(iReportsdata) %>% replace(is.na(.),0)
#   #     parameters  <- c(iReportParameters,"date1")
#   # 
#   #     iReportsdata[,unique(parameters)]
#   # })
#   # 
#   # #---------------------------------------- Individual Reports End -----------------------------------------------------
#   # 
#   # 
#   # #---------------------------------------- Comprehensive Reports Start ----------------------------------------------------
#   # 
#   # 
#   # 
#   # # Fleet Summary Report
#   # 
#   # lastcReportsToDate <- Sys.Date()+1
#   # lastcReportsFromDate <- Sys.Date()
#   # 
#   # 
#   # output$creportplot <- renderbarchartfleetsummary({
#   #   
#   #     validate(
#   #       need(input$creportParameters != "" , label = "Parameters")
#   #     )
#   #   
#   # #         cReportsDate<-input$cReportsDateRange
#   #         cReportsFromDate <- as.Date(input$cReportsFromDate)
#   #         cReportsToDate <- as.Date(input$cReportsToDate)
#   #         cReportsShiftType <- input$creportShifyTpye
#   #         cReportParameters<-input$creportParameters
#   # 
#   #           
#   #         if(cReportsToDate != lastiReportsToDate || cReportsFromDate != lastiReportsFromDate) {
#   #           #Get the plot data
#   #           cReportsdata <<- getReportsBarchartFleetSummaryData(cReportsFromDate, cReportsToDate)
#   #           cReportsdata <<- tbl_df(cReportsdata) %>% replace(is.na(.), 0)
#   #           cReportsdataLoadCycle <<- getReportsBarchartFleetSummaryDataLoadCycle(cReportsFromDate, cReportsToDate)
#   #           lastiReportsToDate <<- cReportsToDate
#   #           lastiReportsFromDate <<- cReportsFromDate
#   #         }
#   # 
#   #         cReportsdata <- cbind(cReportsdata,cReportsdataLoadCycle)
#   #         cReportsdatafilteredbyDate <- cReportsdata %>% filter(shift == cReportsShiftType)
#   #   
#   #         resultBarchartfleetsummaryData <- dcast(cReportsdatafilteredbyDate, date1+shift ~ vehicle_id,value.var=cReportParameters)
#   #         resultBarchartfleetsummaryData <- tbl_df(resultBarchartfleetsummaryData) %>% replace(is.na(.),0)
#   #   
#   #     # Change the parameter Name
#   #       
#   #   switch(cReportParameters,
#   #          'working_hour' = {
#   #            cReportParameters = "Working Hours"
#   #          },
#   #          'idle_hours' = {
#   #            cReportParameters = "Idle Hours"
#   #          },
#   #          'total_hour' = {
#   #            cReportParameters = "Total Hours"
#   #          },
#   #          'freewheeling' = {
#   #            cReportParameters = "Free Wheeling"
#   #          },
#   #          'materialmoved' = {
#   #            cReportParameters = "Material Moved"
#   #          },
#   #          'overspeeding' = {
#   #            cReportParameters = "Over Speeding"
#   #          },
#   #          'fuelconsumed' = {
#   #            cReportParameters = "Fuel Consumed"
#   #          },
#   #          'distance_travelled' = {
#   #            cReportParameters = "Distance Travelled"
#   #          }
#   #       )
#   #  
#   #     
#   #         list( "resultData" = resultBarchartfleetsummaryData, "label" = cReportParameters)
#   # })
#   # 
#   # 
#   # # Table
#   # flag <- 0
#   # 
#   #   output$cReportsTable <- renderDataTable({
#   #    if(is.null(input$creportName)){
#   #      return()
#   #    }
#   #    
#   #    
#   #     if(flag == 0){
#   #       ctableData <<- getReportsCtableData()
#   # #       ctableDataLoadCycle <<- getReportsCtableDataLoadCycle()
#   # #       ctableData <<- tbl_df(ctableData) %>% replace(is.na(.), 0)
#   #       flag <<- 1
#   #     }
#   #       
#   # #       ctableData <- cbind(ctableData,ctableDataLoadCycle)
#   # 
#   #       vehicles <- unique(ctableData[,1])
#   #       resultTable <- dcast(ctableData, date + shift ~ vehicle_id,value.var=input$creportName)
#   #       resultTable[with(resultTable,order(date, shift)),]
#   #       resultTable[is.na(resultTable)] <-0
#   #       redcode <- "#f9c1c0"
#   #       yellowcode <- "#f9e498"
#   #       greencode <- "#a4f4a4"
#   # 
#   #       fleetReportsTableThresholds <- getFleetReportsTableThresholds()
#   # 
#   #       whLow <- fleetReportsTableThresholds$workingHourLow
#   #       whAvg <- fleetReportsTableThresholds$workingHourAvg
#   #       ihLow <- fleetReportsTableThresholds$idleHoursLow
#   #       ihAvg <- fleetReportsTableThresholds$idleHoursAvg
#   #       thLow <- fleetReportsTableThresholds$totalHoursLow
#   #       thAvg <- fleetReportsTableThresholds$totalHoursAvg
#   #       fwLow <- fleetReportsTableThresholds$freeWheelingLow
#   #       fwAvg <- fleetReportsTableThresholds$freeWheelingAvg
#   #       mmLow <- fleetReportsTableThresholds$materialMovedLow
#   #       mmAvg <- fleetReportsTableThresholds$materialMovedAvg
#   #       lcLow <- fleetReportsTableThresholds$loadCycleLow
#   #       lcAvg <- fleetReportsTableThresholds$loadCycleAvg
#   #       osLow <- fleetReportsTableThresholds$overSpeedingLow
#   #       osAvg <- fleetReportsTableThresholds$overSpeedingAvg
#   #       fcLow <- fleetReportsTableThresholds$fuelConsumedLow
#   #       fcAvg <- fleetReportsTableThresholds$fuelConsumedAvg
#   #       dtLow <- fleetReportsTableThresholds$distanceTravelledLow
#   #       dtAvg <- fleetReportsTableThresholds$distanceTravelledAvg
#   #     
#   # 
#   #    switch(input$creportName,
#   #           'working_hour' = {
#   #             datatable(resultTable,
#   #                       caption = htmltools::tags$caption(
#   #                       style = 'text-align: center;', htmltools::em('Shows summary of all the vehicles for the selected parameter.')
#   #                       ),
#   #                       options = list(searchHighlight = TRUE,dom = 'T<"clear">lfrtip',tableTools = list(sSwfPath = copySWF())) ) %>% 
#   #                       formatRound(as.character(as.vector(vehicles)),2) %>% 
#   #                       formatStyle(as.character(as.vector(vehicles)),
#   #                           backgroundColor = styleInterval(c(whLow,whAvg), c(redcode, yellowcode,greencode)),
#   #                           textAlign = "center", fontSize = "16px")
#   #           },
#   #           'idle_hours' = {
#   #             datatable(resultTable,
#   #                       caption = htmltools::tags$caption(
#   #                         style = 'text-align: center;', htmltools::em('Shows summary of all the vehicles for the selected parameter.')
#   #                       ),
#   #                       options = list(searchHighlight = TRUE,dom = 'T<"clear">lfrtip',tableTools = list(sSwfPath = copySWF())) ) %>% 
#   #                       formatRound(as.character(as.vector(vehicles)),2) %>% 
#   #                       formatStyle(as.character(as.vector(vehicles)),
#   #                           backgroundColor = styleInterval(c(ihAvg, ihLow), c(greencode, yellowcode,redcode)),
#   #                           textAlign = "center", fontSize = "16px")
#   #           },
#   #           'total_hour' = {
#   #             datatable(resultTable,
#   #                       caption = htmltools::tags$caption(
#   #                         style = 'text-align: center;', htmltools::em('Shows summary of all the vehicles for the selected parameter.')
#   #                       ),
#   #                       options = list(searchHighlight = TRUE,dom = 'T<"clear">lfrtip',tableTools = list(sSwfPath = copySWF())) ) %>% 
#   #                       formatRound(as.character(as.vector(vehicles)),2) %>% 
#   #                       formatStyle(as.character(as.vector(vehicles)),
#   #                           backgroundColor = styleInterval(c(thLow,thAvg), c(redcode, yellowcode,greencode)),
#   #                           textAlign = "center", fontSize = "16px")
#   #           },
#   #           'freewheeling' = {
#   #             datatable(resultTable,
#   #                       caption = htmltools::tags$caption(
#   #                         style = 'text-align: center;', htmltools::em('Shows summary of all the vehicles for the selected parameter.')
#   #                       ),
#   #                       options = list(searchHighlight = TRUE,dom = 'T<"clear">lfrtip',tableTools = list(sSwfPath = copySWF())) ) %>% 
#   #                       formatStyle(as.character(as.vector(vehicles)),
#   #                                                    backgroundColor = styleInterval(c(fwLow,fwAvg), c(greencode, yellowcode,redcode)),
#   #                                                    textAlign = "center", fontSize = "16px"
#   #             )
#   #           },
#   #           'materialmoved' = {
#   #             datatable(resultTable,
#   #                       caption = htmltools::tags$caption(
#   #                         style = 'text-align: center;', htmltools::em('Shows summary of all the vehicles for the selected parameter.')
#   #                       ),
#   #                       options = list(searchHighlight = TRUE,dom = 'T<"clear">lfrtip',tableTools = list(sSwfPath = copySWF())) ) %>% 
#   #                       formatStyle(as.character(as.vector(vehicles)),
#   #                                                    backgroundColor = styleInterval(c(mmLow,mmAvg), c(redcode, yellowcode,greencode)),
#   #                                                    textAlign = "center", fontSize = "16px"
#   #             )
#   #           },
#   #           'load_cycle' = {
#   #             datatable(resultTable,
#   #                       caption = htmltools::tags$caption(
#   #                         style = 'text-align: center;', htmltools::em('Shows summary of all the vehicles for the selected parameter.')
#   #                       ),
#   #                       options = list(searchHighlight = TRUE,dom = 'T<"clear">lfrtip',tableTools = list(sSwfPath = copySWF())) ) %>% 
#   #                       formatStyle(as.character(as.vector(vehicles)),
#   #                                                     backgroundColor = styleInterval(c(lcLow,lcAvg), c(redcode, yellowcode,greencode)),
#   #                                                     textAlign = "center", fontSize = "16px"
#   #             )
#   #           },
#   #           'overspeeding' = {
#   #             datatable(resultTable,
#   #                       caption = htmltools::tags$caption(
#   #                         style = 'text-align: center;', htmltools::em('Shows summary of all the vehicles for the selected parameter.')
#   #                       ),
#   #                       options = list(searchHighlight = TRUE,dom = 'T<"clear">lfrtip',tableTools = list(sSwfPath = copySWF())) ) %>% 
#   #                       formatStyle(as.character(as.vector(vehicles)),
#   #                                                    backgroundColor = styleInterval(c(osLow,osAvg), c(greencode, yellowcode,redcode)),
#   #                                                    textAlign = "center", fontSize = "16px"
#   #             )
#   #           },
#   #           'fuelconsumed' = {
#   #             datatable(resultTable,
#   #                       caption = htmltools::tags$caption(
#   #                         style = 'text-align: center;', htmltools::em('Shows summary of all the vehicles for the selected parameter.')
#   #                       ),
#   #                       options = list(searchHighlight = TRUE,dom = 'T<"clear">lfrtip',tableTools = list(sSwfPath = copySWF())) ) %>% 
#   #                       formatRound(as.character(as.vector(vehicles)),2) %>%
#   #                       formatStyle(as.character(as.vector(vehicles)),
#   #                           backgroundColor = styleInterval(c(fcLow,fcAvg), c(greencode, yellowcode,redcode)),
#   #                           textAlign = "center", fontSize = "16px"
#   #               )
#   #           },
#   #           'distance_travelled' = {
#   #             datatable(resultTable,
#   #                       caption = htmltools::tags$caption(
#   #                         style = 'text-align: center;', htmltools::em('Shows summary of all the vehicles for the selected parameter.')
#   #                       ),
#   #                       options = list(searchHighlight = TRUE,dom = 'T<"clear">lfrtip',tableTools = list(sSwfPath = copySWF())) ) %>% 
#   #                       formatRound(as.character(as.vector(vehicles)),2) %>% 
#   #                       formatStyle(as.character(as.vector(vehicles)),
#   #                           backgroundColor = styleInterval(c(dtLow,dtAvg), c(redcode, yellowcode,greencode)),
#   #                           textAlign = "center", fontSize = "16px"
#   #               )
#   #           },
#   #       {
#   #         datatable(resultTable)
#   #       }
#   # 
#   #    )
#   # 
#   #  })
#   # 
#   # 
#   # # ------------------------------------- Comprehensive Reports End -----------------------------------------------------------------
#   # 
#   # 
#   # # -------------------------------------- Reports END --------------------------------------------------------------
#   # 
#   # 
#   # 
#   # # ----------------------------------------------------- Bucket Analysis Start Machine -----------------------------------------------------------------------------------
#   # 
#   # # lastVehicleIdBA <- 0
#   # # lastShiftBA <- 'AA'
#   # # lastDateBA <- Sys.Date()+1
#   # # 
#   # # output$bucketAnalysisbarplot <- renderBarChartBucketAnalysis({
#   # #   
#   # #   validate(
#   # #     need(input$bucketAnalysisEventParam != "" , label = "Parameters")
#   # #   )
#   # #   
#   # #   vehicleIdBucketAnalysisMachine <- input$bucketAnalysis_vehicelID
#   # #   dateBucketAnalysisMachine <- as.Date(input$bucketAnalysisDate, origin="1970-01-01")
#   # #   shiftBucketAnalysisMachine <- input$bucketAnalysisShiftType
#   # #   eventParamBucketAnalysisMachine <- input$bucketAnalysisEventParam
#   # # 
#   # # 
#   # #   if(vehicleIdBucketAnalysisMachine != lastVehicleIdBA || dateBucketAnalysisMachine != lastDateBA || shiftBucketAnalysisMachine != lastShiftBA) {
#   # #     eventsDataBABarPlot <<- list()
#   # #     if(length(eventParamBucketAnalysisMachine) > 0){
#   # #       #Get the plot data
#   # #       eventsDataBABarPlot <<- getEventsData(dateBucketAnalysisMachine,vehicleIdBucketAnalysisMachine,shiftBucketAnalysisMachine)
#   # #       eventsDataBABarPlot <<- tbl_df(eventsDataBABarPlot)
#   # #       lastVehicleIdBA <<- vehicleIdBucketAnalysisMachine
#   # #       lastDateBA <<- dateBucketAnalysisMachine
#   # #       lastShiftBA <<- shiftBucketAnalysisMachine
#   # #     }
#   # #   }
#   # # 
#   # #   if(length(eventParamBucketAnalysisMachine) > 0 && nrow(eventsDataBABarPlot) > 0){
#   # #     
#   # #     loadStart <- eventsDataBABarPlot  %>% filter(event_id == 5) %>% select(timestamp1)
#   # #     totalLoadStarts <- nrow(loadStart)
#   # #     
#   # #     if(totalLoadStarts > 0){
#   # #       loadEnd <- eventsDataBABarPlot  %>% filter(event_id == 13) %>% select(timestamp1)
#   # #       loadEnd <- loadEnd[1:totalLoadStarts,]
#   # #       colnames(loadStart) <- c("llStartTime")
#   # #       colnames(loadEnd) <- c("llEndTime")
#   # #       
#   # #       
#   # #       haulStart <- eventsDataBABarPlot  %>% filter(event_id == 13) %>% select(timestamp1)
#   # #       haulEnd <- eventsDataBABarPlot  %>% filter(event_id == 7) %>% select(timestamp1)
#   # #       haulStart <- haulStart[1:totalLoadStarts,]
#   # #       haulEnd <- haulEnd[1:totalLoadStarts,]
#   # #       colnames(haulStart) <- c("hhStartTime")
#   # #       colnames(haulEnd) <- c("hhEndTime")
#   # #       
#   # #       dumpStart <- eventsDataBABarPlot  %>% filter(event_id == 7) %>% select(timestamp1)
#   # #       dumpEnd <- eventsDataBABarPlot  %>% filter(event_id == 8) %>% select(timestamp1)
#   # #       dumpStart <- dumpStart[1:totalLoadStarts,]
#   # #       dumpEnd <- dumpEnd[1:totalLoadStarts,]
#   # #       colnames(dumpStart) <- c("ddStartTime")
#   # #       colnames(dumpEnd) <- c("ddEndTime")  
#   # #       
#   # #       
#   # #       LHDData <- cbind(loadStart,loadEnd,haulStart,haulEnd,dumpStart,dumpEnd)
#   # #       
#   # #       LHDDataWithCycleTime <- LHDData %>% mutate(LoadEvent = as.numeric(as.difftime(as.POSIXlt(llEndTime) - as.POSIXlt(llStartTime)),units = "secs"),
#   # #                                                  HaulEvent = as.numeric(as.difftime(as.POSIXlt(hhEndTime) - as.POSIXlt(hhStartTime)),units = "secs"),
#   # #                                                  DumpEvent = as.numeric(as.difftime(as.POSIXlt(ddEndTime) - as.POSIXlt(ddStartTime)),units = "secs"),
#   # #                                                  BucketNumber = row_number(llStartTime)) %>% 
#   # #                                           select(LoadEvent,HaulEvent,DumpEvent,BucketNumber)
#   # #       
#   # # 
#   # #       parameters  <- c(eventParamBucketAnalysisMachine,"BucketNumber")
#   # #       LHDDataWithCycleTime[,unique(parameters)]
#   # #     } else{
#   # #         LoadEvent <- c()
#   # #         data.frame(LoadEvent)
#   # #       }
#   # #     } else{
#   # #       LoadEvent <- c()
#   # #       data.frame(LoadEvent)
#   # #   }
#   # # 
#   # # 
#   # # 
#   # # 
#   # # 
#   # # 
#   # # })
#   # 
#   # 
#   # lastVehicleIdBA <- 0
#   # lastShiftBA <- 'AA'
#   # lastDateBA <- Sys.Date()+1
#   # 
#   # output$bucketAnalysisbarplot <- renderBarChartBucketAnalysis({
#   # 
#   #   validate(
#   #     need(input$bucketAnalysisEventParam != "" , label = "Parameters")
#   #   )
#   #   
#   #   vehicleIdBucketAnalysisMachine <- input$bucketAnalysis_vehicelID
#   #   dateBucketAnalysisMachine <- as.Date(input$bucketAnalysisDate, origin="1970-01-01")
#   #   shiftBucketAnalysisMachine <- input$bucketAnalysisShiftType
#   #   eventParamBucketAnalysisMachine <- input$bucketAnalysisEventParam
#   #   
#   #   
#   #   if(vehicleIdBucketAnalysisMachine != lastVehicleIdBA || dateBucketAnalysisMachine != lastDateBA || shiftBucketAnalysisMachine != lastShiftBA) {
#   #     eventsDataBABarPlot <<- list()
#   #     if(length(eventParamBucketAnalysisMachine) > 0){
#   #       #Get the plot data
#   #       eventsDataBABarPlot <<- getEventsDataForLHD(dateBucketAnalysisMachine,vehicleIdBucketAnalysisMachine,shiftBucketAnalysisMachine)
#   #       eventsDataBABarPlot <<- tbl_df(eventsDataBABarPlot)
#   #       lastVehicleIdBA <<- vehicleIdBucketAnalysisMachine
#   #       lastDateBA <<- dateBucketAnalysisMachine
#   #       lastShiftBA <<- shiftBucketAnalysisMachine
#   #     }
#   #   }
#   # #   print(nrow(eventsDataBABarPlot) )
#   #   if(length(eventParamBucketAnalysisMachine) > 0 && nrow(eventsDataBABarPlot) > 0){
#   #  
#   #     loadStart <- c()
#   #     loadEnd <- c()
#   #     haulStart <- c()
#   #     haulEnd <- c()
#   #     dumpStart <- c()
#   #     dumpEnd <- c()
#   #     vehicleId <- c()
#   # 
#   #     noOfRows <- length(eventsDataBABarPlot$loadcycle)
#   # 
#   #     i <- 1
#   #     while (i < noOfRows){
#   #       if(eventsDataBABarPlot$loadcycle[i] == 3000){
#   #         loadStart <- append(loadStart,eventsDataBABarPlot$timestamp1[i])
#   # #         print(paste0(i," : ",eventsDataBABarPlot$timestamp1[i]," : ",eventsDataBABarPlot$loadcycle[i], " : Load Start"))
#   #         while(TRUE){
#   #           if (i > noOfRows){
#   #             break
#   #           } else if(eventsDataBABarPlot$loadcycle[i] != 3000 && (eventsDataBABarPlot$loadcycle[i] == 0 || eventsDataBABarPlot$loadcycle[i] == 2000 )){
#   # #             print(paste0(i," : ",eventsDataBABarPlot$timestamp1[i]," : ",eventsDataBABarPlot$loadcycle[i], " : Load End/Haul Start"))
#   #             loadEnd <- append(loadEnd,eventsDataBABarPlot$timestamp1[i-1])
#   #             haulStart <- append(haulStart,eventsDataBABarPlot$timestamp1[i+1])
#   #             i <- i+1
#   #             break
#   #           }
#   #           i <- i+1
#   #         }
#   #         while(TRUE){
#   #           if (i > noOfRows){
#   #             break
#   #           } else if(eventsDataBABarPlot$loadcycle[i] != 2000 && (eventsDataBABarPlot$loadcycle[i] == 0 || eventsDataBABarPlot$loadcycle[i] == 1000)){
#   # #             print(paste0(i," : ",eventsDataBABarPlot$timestamp1[i]," : ",eventsDataBABarPlot$loadcycle[i], " : Dump Start"))
#   #             haulEnd <- append(haulEnd,eventsDataBABarPlot$timestamp1[i-1])
#   #             dumpStart <- append(dumpStart,eventsDataBABarPlot$timestamp1[i+1])
#   #             i <- i+1
#   #             break
#   #           }
#   #           i <- i+1
#   #         }
#   #         while(TRUE){
#   #           if (i > noOfRows){
#   #             break
#   #           } else if(eventsDataBABarPlot$loadcycle[i] != 1000 && (eventsDataBABarPlot$loadcycle[i] == 0 || eventsDataBABarPlot$loadcycle[i] == 3000)){
#   # #             print(paste0(i," : ",eventsDataBABarPlot$timestamp1[i]," : ",eventsDataBABarPlot$loadcycle[i]))
#   #             dumpEnd <- append(dumpEnd,eventsDataBABarPlot$timestamp1[i-1])
#   #             i <- i+1
#   #             break
#   #           }
#   #           i <- i+1
#   #         }
#   #       }
#   #       i <- i+1
#   #     }
#   # 
#   #     if((length(loadStart) == length(loadEnd)) && (length(loadEnd) == length(haulStart)) && (length(haulStart) == length(haulEnd)) && (length(haulEnd) == length(dumpStart)) && (length(dumpStart) == length(dumpEnd))){
#   #       LHDData <- data.frame(loadStart,loadEnd,haulStart,haulEnd,dumpStart,dumpEnd)
#   #     } else{
#   #       totalCycles <- length(dumpEnd)
#   #       loadStart <- loadStart[1:totalCycles]
#   #       loadEnd <- loadEnd[1:totalCycles]
#   #       haulStart <- haulStart[1:totalCycles]
#   #       haulEnd <- haulEnd[1:totalCycles]
#   #       dumpStart <- dumpStart[1:totalCycles]
#   #       
#   #       LHDData <- data.frame(loadStart,loadEnd,haulStart,haulEnd,dumpStart,dumpEnd)
#   #     }
#   #     
#   #     if(nrow(LHDData) > 0){
#   #       LHDDataWithCycleTime <- LHDData %>% mutate(LoadEvent = as.numeric(as.difftime(as.POSIXlt(loadEnd) - as.POSIXlt(loadStart)),units = "secs"),
#   #                                                  HaulEvent = as.numeric(as.difftime(as.POSIXlt(haulEnd) - as.POSIXlt(haulStart)),units = "secs"),
#   #                                                  DumpEvent = as.numeric(as.difftime(as.POSIXlt(dumpEnd) - as.POSIXlt(dumpStart)),units = "secs"),
#   #                                                  BucketNumber = row_number(loadStart)) %>% 
#   #                                                  select(LoadEvent,HaulEvent,DumpEvent,BucketNumber)
#   #     observe({
#   #       output$NoOfBucketsMachine <- renderUI({ tags$h4(paste0("# of Buckets : ", nrow(LHDDataWithCycleTime))) })
#   #     })   
#   #       
#   #         parameters  <- c(eventParamBucketAnalysisMachine,"BucketNumber")
#   #         LHDDataWithCycleTime[,unique(parameters)]
#   #     } else{
#   #       LoadEvent <- c()
#   #       data.frame(LoadEvent)
#   #     }
#   #   } else{
#   #     LoadEvent <- c()
#   #     data.frame(LoadEvent)
#   #   }
#   # })
#   # 
#   # #------------Bucket Analysis table ------
#   # 
#   # customizeDataTableColumnNames <- reactive({
#   #   
#   #   sketch <<- htmltools::withTags(table(
#   #     class = 'display',
#   #     thead(
#   #       tr(
#   #         th(rowspan = 2, 'Bucket #'),
#   #         th(colspan = 3, 'LOAD EVENT'),
#   #         th(colspan = 3, 'HAUL EVENT'),
#   #         th(colspan = 3, 'DUMP EVENT')
#   #       ),
#   #       tr(
#   #         lapply(rep(c('Start Time', 'End Time', 'Cycle Time'), 3), th)
#   #       )
#   #     )
#   #   ))
#   # })
#   # 
#   # 
#   # output$bucketAnalysistableplot <- DT::renderDataTable({
#   # 
#   #   dateBA<-input$bucketAnalysisDate
#   #   vehicleIdBA<-input$bucketAnalysis_vehicelID
#   #   shiftTypeBA <- input$bucketAnalysisShiftType
#   #   
#   #   redcode <- "#f9c1c0"
#   #   yellowcode <- "#f9e498"
#   #   greencode <- "#a4f4a4"
#   #   beigecode <- "#F5F5DC"
#   #   
#   #   eventsDataBATable <- getEventsDataForLHD(dateBA,vehicleIdBA,shiftTypeBA)
#   #   eventsDataBATable <- tbl_df(eventsDataBATable)
#   #   
#   #   if(nrow(eventsDataBATable) > 0){
#   #     
#   #     loadStart <- c()
#   #     loadEnd <- c()
#   #     haulStart <- c()
#   #     haulEnd <- c()
#   #     dumpStart <- c()
#   #     dumpEnd <- c()
#   #     vehicleId <- c()
#   #     
#   #     noOfRows <- length(eventsDataBATable$loadcycle)
#   #     
#   #     i <- 1
#   #     while (i < noOfRows){
#   #       if(eventsDataBATable$loadcycle[i] == 3000){
#   #         loadStart <- append(loadStart,eventsDataBATable$timestamp1[i])
#   #         #         print(paste0(i," : ",eventsDataBATable$timestamp1[i]," : ",eventsDataBATable$loadcycle[i], " : Load Start"))
#   #         while(TRUE){
#   #           if (i > noOfRows){
#   #             break
#   #           } else if(eventsDataBATable$loadcycle[i] != 3000 && (eventsDataBATable$loadcycle[i] == 0 || eventsDataBATable$loadcycle[i] == 2000 )){
#   #             #             print(paste0(i," : ",eventsDataBATable$timestamp1[i]," : ",eventsDataBATable$loadcycle[i], " : Load End/Haul Start"))
#   #             loadEnd <- append(loadEnd,eventsDataBATable$timestamp1[i-1])
#   #             haulStart <- append(haulStart,eventsDataBATable$timestamp1[i+1])
#   #             i <- i+1
#   #             break
#   #           }
#   #           i <- i+1
#   #         }
#   #         while(TRUE){
#   #           if (i > noOfRows){
#   #             break
#   #           } else if(eventsDataBATable$loadcycle[i] != 2000 && (eventsDataBATable$loadcycle[i] == 0 || eventsDataBATable$loadcycle[i] == 1000)){
#   #             #             print(paste0(i," : ",eventsDataBATable$timestamp1[i]," : ",eventsDataBATable$loadcycle[i], " : Dump Start"))
#   #             haulEnd <- append(haulEnd,eventsDataBATable$timestamp1[i-1])
#   #             dumpStart <- append(dumpStart,eventsDataBATable$timestamp1[i+1])
#   #             i <- i+1
#   #             break
#   #           }
#   #           i <- i+1
#   #         }
#   #         while(TRUE){
#   #           if (i > noOfRows){
#   #             break
#   #           } else if(eventsDataBATable$loadcycle[i] != 1000 && (eventsDataBATable$loadcycle[i] == 0 || eventsDataBATable$loadcycle[i] == 3000)){
#   #             #             print(paste0(i," : ",eventsDataBATable$timestamp1[i]," : ",eventsDataBATable$loadcycle[i]))
#   #             dumpEnd <- append(dumpEnd,eventsDataBATable$timestamp1[i-1])
#   #             i <- i+1
#   #             break
#   #           }
#   #           i <- i+1
#   #         }
#   #       }
#   #       i <- i+1
#   #     }
#   #     
#   #     if((length(loadStart) == length(loadEnd)) && (length(loadEnd) == length(haulStart)) && (length(haulStart) == length(haulEnd)) && (length(haulEnd) == length(dumpStart)) && (length(dumpStart) == length(dumpEnd))){
#   #       LHDData <- data.frame(loadStart,loadEnd,haulStart,haulEnd,dumpStart,dumpEnd)
#   #     } else{
#   #       totalCycles <- length(dumpEnd)
#   #       loadStart <- loadStart[1:totalCycles]
#   #       loadEnd <- loadEnd[1:totalCycles]
#   #       haulStart <- haulStart[1:totalCycles]
#   #       haulEnd <- haulEnd[1:totalCycles]
#   #       dumpStart <- dumpStart[1:totalCycles]
#   #       
#   #       LHDData <- data.frame(loadStart,loadEnd,haulStart,haulEnd,dumpStart,dumpEnd)
#   #     }
#   #     
#   #     if(nrow(LHDData) > 0){
#   #       LHDDataWithCycleTime <- LHDData %>% mutate(LoadEvent = as.numeric(as.difftime(as.POSIXlt(loadEnd) - as.POSIXlt(loadStart)),units = "secs"),
#   #                                                  HaulEvent = as.numeric(as.difftime(as.POSIXlt(haulEnd) - as.POSIXlt(haulStart)),units = "secs"),
#   #                                                  DumpEvent = as.numeric(as.difftime(as.POSIXlt(dumpEnd) - as.POSIXlt(dumpStart)),units = "secs"),
#   #                                                  BucketNumber = row_number(loadStart)) %>% 
#   #         select(LoadEvent,HaulEvent,DumpEvent,BucketNumber)
#   #       
#   #       # Displaying No of Buckets
#   #       observe({
#   #         output$NoOfBucketsMachine <- renderUI({ tags$h4(paste0("# of Buckets : ", nrow(LHDDataWithCycleTime))) })
#   #       })
#   #       
#   #       dataToDisplay <- LHDDataWithCycleTime %>% mutate( lStartTime = format(as.POSIXlt(loadStart), "%H:%M:%S"),
#   #                                                         lEndTime = format(as.POSIXlt(loadEnd), "%H:%M:%S"),
#   #                                                         hStartTime = format(as.POSIXlt(haulStart), "%H:%M:%S"),
#   #                                                         hEndTime = format(as.POSIXlt(haulEnd), "%H:%M:%S"),
#   #                                                         dStartTime = format(as.POSIXlt(dumpStart), "%H:%M:%S"),
#   #                                                         dEndTime = format(as.POSIXlt(dumpEnd), "%H:%M:%S"),
#   #                                                         lCycleTime = format(.POSIXct(LoadEvent,tz="GMT"), "%H:%M:%S"),
#   #                                                         hCycleTime = format(.POSIXct(HaulEvent,tz="GMT"), "%H:%M:%S"),
#   #                                                         dCycleTime = format(.POSIXct(DumpEvent,tz="GMT"), "%H:%M:%S") ) %>% 
#   #                                                         select(lStartTime,lEndTime,lCycleTime,hStartTime,hEndTime,hCycleTime,dStartTime,dEndTime,dCycleTime)
#   #       
#   #       datatable(dataToDisplay,colnames = c('Bucket #' = 1),container = customizeDataTableColumnNames(),extensions = c('Responsive','TableTools'),
#   #                 caption = htmltools::tags$caption(
#   #                   style = 'text-align: center;', htmltools::em('Shows Start Time, End Time and Cycle Time in HH:MM:SS format')
#   #                 ),
#   #                 options = list(searchHighlight = TRUE,lengthMenu = list(c(10, 25, 50, -1), c('10', '25', '50','All')),pageLength = 10,dom = 'T<"clear">lfrtip',tableTools = list(sSwfPath = copySWF()) )) %>% 
#   #         formatStyle('lStartTime',   backgroundColor = beigecode) %>%
#   #         formatStyle('lEndTime',   backgroundColor = beigecode) %>%
#   #         formatStyle('lCycleTime',backgroundColor = greencode) %>%
#   #         formatStyle('hStartTime',  backgroundColor = yellowcode) %>%
#   #         formatStyle('hEndTime',   backgroundColor = yellowcode) %>%
#   #         formatStyle('hCycleTime', backgroundColor = greencode) %>%
#   #         formatStyle('dStartTime',   backgroundColor = redcode) %>%
#   #         formatStyle('dEndTime',   backgroundColor = redcode) %>%
#   #         formatStyle('dCycleTime',,backgroundColor = greencode)
#   #       
#   #     } else{
#   #       noData <- c("NoDataAvailable")
#   #       data.frame(noData)
#   #     }
#   #   } else{
#   #     noData <- c("NoDataAvailable")
#   #     data.frame(noData)
#   #   }
#   # 
#   #   
#   # })
#   # 
#   # 
#   # #--------------------------------------------------------- Bucket Analysis Machine End ------------------------------------------------------------------------------
#   # 
#   # 
#   # 
#   # 
#   # #---------------------------------------------------------- Bucket Analysis Fleet Start -----------------------------------------------------------------
#   # 
#   # 
#   # #---------------For Bar Chart
#   # 
#   # lastShiftBAFleet <- 'AA'
#   # lastDateBAFleet <- Sys.Date()+1
#   # 
#   # output$bucketAnalysisBarplotFleet <- renderBarChartBucketAnalysis({
#   # 
#   #   validate(
#   #     need(input$bucketAnalysisFleetEventParam != "" , label = "Parameters")
#   #   )
#   #   
#   #   dateBucketAnalysisFleet <- as.Date(input$bucketAnalysisDateFleet, origin="1970-01-01")
#   #   shiftBucketAnalysisFleet <- input$bucketAnalysisShiftTypeFleet
#   # 
#   #   if( dateBucketAnalysisFleet != lastDateBAFleet || shiftBucketAnalysisFleet != lastShiftBAFleet) {
#   #       #Get the plot data
#   #       eventsDataBABarPlotFleet <<- getEventsDataBAFleetForLHD(dateBucketAnalysisFleet,shiftBucketAnalysisFleet)
#   #       eventsDataBABarPlotFleet <<- tbl_df(eventsDataBABarPlotFleet)
#   #       lastDateBAFleet <<- dateBucketAnalysisFleet
#   #       lastShiftBAFleet <<- shiftBucketAnalysisFleet
#   #   }
#   #       if(nrow(eventsDataBABarPlotFleet) > 0){
#   #         
#   #         loadStart <- c()
#   #         loadEnd <- c()
#   #         haulStart <- c()
#   #         haulEnd <- c()
#   #         dumpStart <- c()
#   #         dumpEnd <- c()
#   #         vehicleId <- c()
#   #         
#   #         noOfRows <- length(eventsDataBABarPlotFleet$loadcycle)
#   #         
#   #         i <- 1
#   #         while (i < noOfRows){
#   #           if(eventsDataBABarPlotFleet$loadcycle[i] == 3000){
#   #             loadStart <- append(loadStart,eventsDataBABarPlotFleet$timestamp1[i])
#   #             vehicleId <- append(vehicleId,eventsDataBABarPlotFleet$vehicle_id[i])
#   #              while(TRUE){
#   #               if (i > noOfRows){
#   #                 break
#   #               } else if(eventsDataBABarPlotFleet$loadcycle[i] != 3000 && (eventsDataBABarPlotFleet$loadcycle[i] == 0 || eventsDataBABarPlotFleet$loadcycle[i] == 2000 )){
#   #                  loadEnd <- append(loadEnd,eventsDataBABarPlotFleet$timestamp1[i-1])
#   #                 haulStart <- append(haulStart,eventsDataBABarPlotFleet$timestamp1[i+1])
#   #                 i <- i+1
#   #                 break
#   #               }
#   #               i <- i+1
#   #             }
#   #             while(TRUE){
#   #               if (i > noOfRows){
#   #                 break
#   #               } else if(eventsDataBABarPlotFleet$loadcycle[i] != 2000 && (eventsDataBABarPlotFleet$loadcycle[i] == 0 || eventsDataBABarPlotFleet$loadcycle[i] == 1000)){
#   #                  haulEnd <- append(haulEnd,eventsDataBABarPlotFleet$timestamp1[i-1])
#   #                 dumpStart <- append(dumpStart,eventsDataBABarPlotFleet$timestamp1[i+1])
#   #                 i <- i+1
#   #                 break
#   #               }
#   #               i <- i+1
#   #             }
#   #             while(TRUE){
#   #               if (i > noOfRows){
#   #                 break
#   #               } else if(eventsDataBABarPlotFleet$loadcycle[i] != 1000 && (eventsDataBABarPlotFleet$loadcycle[i] == 0 || eventsDataBABarPlotFleet$loadcycle[i] == 3000)){
#   #                 dumpEnd <- append(dumpEnd,eventsDataBABarPlotFleet$timestamp1[i-1])
#   #                 i <- i+1
#   #                 break
#   #               }
#   #               i <- i+1
#   #             }
#   #           }
#   #           i <- i+1
#   #         }
#   #         
#   #         if((length(loadStart) == length(loadEnd)) && (length(loadEnd) == length(haulStart)) && (length(haulStart) == length(haulEnd)) && (length(haulEnd) == length(dumpStart)) && (length(dumpStart) == length(dumpEnd))){
#   #           LHDData <- data.frame(vehicleId,loadStart,loadEnd,haulStart,haulEnd,dumpStart,dumpEnd)
#   #         } else{
#   #           totalCycles <- length(dumpEnd)
#   #           vehicleId <- vehicleId[1:totalCycles]
#   #           loadStart <- loadStart[1:totalCycles]
#   #           loadEnd <- loadEnd[1:totalCycles]
#   #           haulStart <- haulStart[1:totalCycles]
#   #           haulEnd <- haulEnd[1:totalCycles]
#   #           dumpStart <- dumpStart[1:totalCycles]
#   #           LHDData <- data.frame(vehicleId,loadStart,loadEnd,haulStart,haulEnd,dumpStart,dumpEnd)
#   #         }
#   #       
#   #   
#   #     if(nrow(LHDData) > 0){
#   #       LHDDataWithCycleTime <- LHDData %>% mutate(lloadEvent = as.numeric(as.difftime(as.POSIXlt(loadEnd) - as.POSIXlt(loadStart)),units = "secs"),
#   #                                           hhaulEvent = as.numeric(as.difftime(as.POSIXlt(haulEnd) - as.POSIXlt(haulStart)),units = "secs"),
#   #                                           ddumpEvent = as.numeric(as.difftime(as.POSIXlt(dumpEnd) - as.POSIXlt(dumpStart)),units = "secs"),
#   #                                           BucketNumber = row_number(loadStart)) %>% 
#   #                                           group_by(vehicleId) %>% summarise(LoadEvent = mean(lloadEvent),HaulEvent = mean(hhaulEvent),DumpEvent = mean(ddumpEvent),NoOfBuckets = n())
#   # 
#   #       params <- input$bucketAnalysisFleetEventParam
#   #       parameters <- c()
#   #       if('LoadCycle' %in% params){
#   #         parameters <- append(parameters,c('LoadEvent','HaulEvent','DumpEvent'))
#   #       }
#   #       if('NoOfBuckets' %in% params){
#   #         parameters <- append(parameters,'NoOfBuckets')
#   #       }
#   #       parameters  <- append(parameters,'vehicleId')
#   #       LHDDataWithCycleTime[,unique(parameters)]
#   #     
#   #     } else{
#   #       LoadEvent <- c()
#   #       data.frame(LoadEvent)
#   #     }
#   #   } else{
#   #         LoadEvent <- c()
#   #         data.frame(LoadEvent)
#   #    }
#   # 
#   # })
#   # 
#   # 
#   # 
#   # #----------Fleet Table
#   # 
#   # # 
#   # # output$bucketAnalysisFleettableplot <- DT::renderDataTable({
#   # #   print(input$BAFleetFromDateTable)
#   # #   fromDateBAFleet<-as.Date(input$BAFleetFromDateTable)
#   # #   print(fromDateBAFleet)
#   # #   toDateBAFleet<-as.Date(input$BAFleetToDateTable)
#   # #   
#   # #   redcode <- "#f9c1c0"
#   # #   yellowcode <- "#f9e498"
#   # #   greencode <- "#a4f4a4"
#   # #   beigecode <- "#F5F5DC"
#   # #   
#   # #   nrow(eventsDataBATable) <- getEventsDataBAFleetForLHDTableView("2015-08-22","2015-08-29")
#   # #   eventsDataBATable <- tbl_df(eventsDataBATable)
#   # #   
#   # #   if(nrow(eventsDataBATable) > 0){
#   # #     
#   # #     loadStart <- c()
#   # #     loadEnd <- c()
#   # #     haulStart <- c()
#   # #     haulEnd <- c()
#   # #     dumpStart <- c()
#   # #     dumpEnd <- c()
#   # #     vehicleId <- c()
#   # #     shift <- c()
#   # #     
#   # #     noOfRows <- length(eventsDataBATable$loadcycle)
#   # #     
#   # #     i <- 1
#   # #     while (i < noOfRows){
#   # #       if(eventsDataBATable$loadcycle[i] == 3000){
#   # #         loadStart <- append(loadStart,eventsDataBATable$timestamp1[i])
#   # #         vehicleId <- append(vehicleId,eventsDataBABarPlotFleet$vehicle_id[i])
#   # #         shift <- append(shift,eventsDataBABarPlotFleet$shift[i])
#   # #         #         print(paste0(i," : ",eventsDataBATable$timestamp1[i]," : ",eventsDataBATable$loadcycle[i], " : Load Start"))
#   # #         while(TRUE){
#   # #           if (i > noOfRows){
#   # #             break
#   # #           } else if(eventsDataBATable$loadcycle[i] != 3000 && (eventsDataBATable$loadcycle[i] == 0 || eventsDataBATable$loadcycle[i] == 2000 )){
#   # #             #             print(paste0(i," : ",eventsDataBATable$timestamp1[i]," : ",eventsDataBATable$loadcycle[i], " : Load End/Haul Start"))
#   # #             loadEnd <- append(loadEnd,eventsDataBATable$timestamp1[i-1])
#   # #             haulStart <- append(haulStart,eventsDataBATable$timestamp1[i+1])
#   # #             i <- i+1
#   # #             break
#   # #           }
#   # #           i <- i+1
#   # #         }
#   # #         while(TRUE){
#   # #           if (i > noOfRows){
#   # #             break
#   # #           } else if(eventsDataBATable$loadcycle[i] != 2000 && (eventsDataBATable$loadcycle[i] == 0 || eventsDataBATable$loadcycle[i] == 1000)){
#   # #             #             print(paste0(i," : ",eventsDataBATable$timestamp1[i]," : ",eventsDataBATable$loadcycle[i], " : Dump Start"))
#   # #             haulEnd <- append(haulEnd,eventsDataBATable$timestamp1[i-1])
#   # #             dumpStart <- append(dumpStart,eventsDataBATable$timestamp1[i+1])
#   # #             i <- i+1
#   # #             break
#   # #           }
#   # #           i <- i+1
#   # #         }
#   # #         while(TRUE){
#   # #           if (i > noOfRows){
#   # #             break
#   # #           } else if(eventsDataBATable$loadcycle[i] != 1000 && (eventsDataBATable$loadcycle[i] == 0 || eventsDataBATable$loadcycle[i] == 3000)){
#   # #             #             print(paste0(i," : ",eventsDataBATable$timestamp1[i]," : ",eventsDataBATable$loadcycle[i]))
#   # #             dumpEnd <- append(dumpEnd,eventsDataBATable$timestamp1[i-1])
#   # #             i <- i+1
#   # #             break
#   # #           }
#   # #           i <- i+1
#   # #         }
#   # #       }
#   # #       i <- i+1
#   # #     }
#   # #     
#   # #     if((length(loadStart) == length(loadEnd)) && (length(loadEnd) == length(haulStart)) && (length(haulStart) == length(haulEnd)) && (length(haulEnd) == length(dumpStart)) && (length(dumpStart) == length(dumpEnd))){
#   # #       LHDData <- data.frame(vehicleId,shift,loadStart,loadEnd,haulStart,haulEnd,dumpStart,dumpEnd)
#   # #     } else{
#   # #       totalCycles <- length(dumpEnd)
#   # #       vehicleId <- vehicleId[1:totalCycles]
#   # #       shift <- shift[1:totalCycles]
#   # #       loadStart <- loadStart[1:totalCycles]
#   # #       loadEnd <- loadEnd[1:totalCycles]
#   # #       haulStart <- haulStart[1:totalCycles]
#   # #       haulEnd <- haulEnd[1:totalCycles]
#   # #       dumpStart <- dumpStart[1:totalCycles]
#   # #       
#   # #       LHDData <- data.frame(vehicleId,shift,loadStart,loadEnd,haulStart,haulEnd,dumpStart,dumpEnd)
#   # #     }
#   # #     LHDDataWithCycleTime <- LHDData %>% group_by(vehicleId,shift) %>% summarise(NoOfBuckets = n())
#   # #     
#   # # #     if(nrow(LHDData) > 0){
#   # # #       LHDDataWithCycleTime <- LHDData %>% mutate(LoadEvent = as.numeric(as.difftime(as.POSIXlt(loadEnd) - as.POSIXlt(loadStart)),units = "secs"),
#   # # #                                                  HaulEvent = as.numeric(as.difftime(as.POSIXlt(haulEnd) - as.POSIXlt(haulStart)),units = "secs"),
#   # # #                                                  DumpEvent = as.numeric(as.difftime(as.POSIXlt(dumpEnd) - as.POSIXlt(dumpStart)),units = "secs"),
#   # # #                                                  BucketNumber = row_number(loadStart)) %>% 
#   # # #         select(LoadEvent,HaulEvent,DumpEvent,BucketNumber)
#   # # #       
#   # # #       # Displaying No of Buckets
#   # # #       observe({
#   # # #         output$NoOfBucketsMachine <- renderUI({ tags$h4(paste0("# of Buckets : ", nrow(LHDDataWithCycleTime))) })
#   # # #       })
#   # # #       
#   # # #       dataToDisplay <- LHDDataWithCycleTime %>% mutate( lStartTime = format(as.POSIXlt(loadStart), "%H:%M:%S"),
#   # # #                                                         lEndTime = format(as.POSIXlt(loadEnd), "%H:%M:%S"),
#   # # #                                                         hStartTime = format(as.POSIXlt(haulStart), "%H:%M:%S"),
#   # # #                                                         hEndTime = format(as.POSIXlt(haulEnd), "%H:%M:%S"),
#   # # #                                                         dStartTime = format(as.POSIXlt(dumpStart), "%H:%M:%S"),
#   # # #                                                         dEndTime = format(as.POSIXlt(dumpEnd), "%H:%M:%S"),
#   # # #                                                         lCycleTime = format(.POSIXct(LoadEvent,tz="GMT"), "%H:%M:%S"),
#   # # #                                                         hCycleTime = format(.POSIXct(HaulEvent,tz="GMT"), "%H:%M:%S"),
#   # # #                                                         dCycleTime = format(.POSIXct(DumpEvent,tz="GMT"), "%H:%M:%S") ) %>% 
#   # # #         select(lStartTime,lEndTime,lCycleTime,hStartTime,hEndTime,hCycleTime,dStartTime,dEndTime,dCycleTime)
#   # # #       
#   # #       datatable(dataToDisplay,colnames = c('Bucket #' = 1),container = customizeDataTableColumnNames(),extensions = c('Responsive','TableTools'),
#   # #                 caption = htmltools::tags$caption(
#   # #                   style = 'text-align: center;', htmltools::em('Shows Start Time, End Time and Cycle Time in HH:MM:SS format')
#   # #                 ),
#   # #                 options = list(searchHighlight = TRUE,pageLength = 10,dom = 'T<"clear">lfrtip',tableTools = list(sSwfPath = copySWF()) )) %>% 
#   # #         formatStyle('lStartTime',   backgroundColor = beigecode) %>%
#   # #         formatStyle('lEndTime',   backgroundColor = beigecode) %>%
#   # #         formatStyle('lCycleTime',   backgroundColor = greencode) %>%
#   # #         formatStyle('hStartTime',  backgroundColor = yellowcode) %>%
#   # #         formatStyle('hEndTime',   backgroundColor = yellowcode) %>%
#   # #         formatStyle('hCycleTime',   backgroundColor = greencode) %>%
#   # #         formatStyle('dStartTime',   backgroundColor = redcode) %>%
#   # #         formatStyle('dEndTime',   backgroundColor = redcode) %>%
#   # #         formatStyle('dCycleTime',   backgroundColor = greencode)
#   # #       
#   # #     } else{
#   # #       noData <- c("NoDataAvailable")
#   # #       data.frame(noData)
#   # #     }
#   # #   } else{
#   # #     noData <- c("NoDataAvailable")
#   # #     data.frame(noData)
#   # #   }
#   # #   
#   # #   
#   # # })
#   # 
#   # #---------------------------------------------------------- Bucket Analysis Fleet End ----------------------------------------------------------------
#   # 
#   # 
#   # 
#   # 
#   # #------------------------------------------ Configure Thresholds START ------------------------------------------------------------------
#   # 
#   # 
#   # observe({
#   #   if(input$configureThresholds == 'viewThresholds'){
#   #     output$thresholdsUI <- renderUI({
#   #       column(width = 9,
#   #          selectInput(inputId="viewThresholdsVehicelID", 
#   #                   label = "Choose a Vehicle ID",
#   #                   choices = c(vehicleInfo$vehicle_id),
#   #                   selected=337
#   #         )
#   #       )
#   #     })
#   #     
#   #     output$viewSetThresholdsUI <- renderUI({
#   #       
#   #       vTVehicleID <- as.integer(input$viewThresholdsVehicelID)
#   #       
#   #       getThresholds <- getEventsThresholds()
#   #       
#   #       getThresholds <- getThresholds[getThresholds$vehicle_id == vTVehicleID,]
#   #   
#   #         tags$table(style= "width : 100%",
#   #                    tags$tr( 
#   #                      tags$td(h5("Load Start Threshold : ")),
#   #                      tags$td(tags$b(p(getThresholds$LoadedStartTH)))
#   #                    ),
#   #                    tags$tr( 
#   #                      tags$td(h5("Load End/Haul Start Threshold : ")),
#   #                      tags$td(tags$b(p(getThresholds$HaulStartTH)))
#   #                    ),
#   #                    tags$tr(
#   #                      tags$td(h5("Haul End/Dump Start Threshold : ")),
#   #                      tags$td(tags$b(p(getThresholds$DumpStartTH)))
#   #                    ),
#   #                    tags$tr(
#   #                      tags$td(h5("Dump End Threshold : ")),
#   #                      tags$td(tags$b(p(getThresholds$DumpEndTH)))
#   #                    ),
#   #                    tags$tr(
#   #                      tags$td(h5("Slope Grade threshold For Load Event : ")),
#   #                      tags$td(tags$b(p(getThresholds$SlopeGradeThresholdLoad)))
#   #                    ),
#   #                    tags$tr(
#   #                      tags$td(h5("Slope Grade threshold For Haul Event : ")),
#   #                      tags$td(tags$b(p(getThresholds$SlopeGradeThresholdHaul)))
#   #                    ),
#   #                    tags$tr(
#   #                      tags$td(h5("Slope Grade threshold For Dump Event : ")),
#   #                      tags$td(tags$b(p(getThresholds$SlopeGradeThresholdDump)))
#   #                    )
#   #         )
#   #       
#   #     })
#   #     
#   #     
#   #     output$successText <- renderUI({
#   #       paste("")
#   #     })
#   #     
#   #   }  else{
#   #       output$thresholdsUI <- renderUI({
#   #         column(width = 11,
#   #                selectizeInput(inputId="setThresholdsVehicelID", 
#   #                     label = "Choose a Vehicle ID",
#   #                     choices = c(vehicleInfo$vehicle_id),
#   #                     multiple = TRUE,
#   #                     options = list(placeholder = "You can update for multiple Vehicles")
#   #               )
#   #         )
#   #       })
#   #       
#   #       
#   #       output$viewSetThresholdsUI <- renderUI({
#   #         
#   # #         vTVehicleID <- as.integer(input$viewThresholdsVehicelID)
#   # #         
#   # #         getThresholds <- getEventsThresholds()
#   # #         
#   # #         getThresholds <- getThresholds[getThresholds$vehicle_id == vTVehicleID,]
#   #         
#   #         
#   #         tags$table(style= "width : 100%",
#   #                    tags$tr( 
#   #                      column(width = 10,numericInput("LST", label = "Load Start Threshold :", value = 1))
#   #                    ),
#   #                    tags$tr( 
#   #                      column(width = 10,numericInput("HST", label = "Load End/Haul Start Threshold :", value = 1))
#   #                    ),
#   #                    tags$tr(
#   #                      column(width = 10,numericInput("DST", label = "Haul End/Dump Start Threshold :", value = 1))
#   #                    ),
#   #                    tags$tr(
#   #                      column(width = 10,numericInput("DET", label = "Dump End Threshold :", value = 1))
#   #                    ),
#   #                    tags$tr( 
#   #                      column(width = 10,numericInput("SGLoad", label = "Slope Grade threshold For Load Event :", value = 1))
#   #                    ),
#   #                    tags$tr( 
#   #                      column(width = 10,numericInput("SGHaul", label = "Slope Grade threshold For Haul Event :", value = 1))
#   #                    ),
#   #                    tags$tr( 
#   #                      column(width = 10,numericInput("SGDump", label = "Slope Grade threshold For Dump Event :", value = 1))
#   #                    )
#   #         )
#   #         
#   #       })
#   # 
#   #     
#   #   }
#   # 
#   # })
#   # 
#   # 
#   # 
#   # 
#   # updateThresholdValues <- reactive({
#   #   
#   #   setThresholdsVehicelID <- input$setThresholdsVehicelID
#   #   
#   #   LST <- input$LST
#   #   HST <- input$HST
#   #   DST <- input$DST
#   #   DET <- input$DET
#   #   SGLoad <- input$SGLoad
#   #   SGHaul <- input$SGHaul
#   #   SGDump <- input$SGDump
#   #   
#   #   if(is.numeric(LST) && is.numeric(HST) && is.numeric(DST) && is.numeric(DET) && is.numeric(SGLoad) && is.numeric(SGHaul) && is.numeric(SGDump))
#   #   {
#   #     sqlTextIntermediate <- ''
#   #     sqlTextAllValues <- ''
#   #     for(i in 1 : length(setThresholdsVehicelID)){
#   #       sqlTextIntermediate <- paste0("(",setThresholdsVehicelID[i],",",LST,",",HST,",",DST,",",DET,",",SGLoad,",",SGHaul,",",SGDump,")")
#   #       sqlTextAllValues <- paste0(sqlTextAllValues,",",sqlTextIntermediate)
#   #     }
#   #   
#   #     sqlTextAllValues <- substr(sqlTextAllValues,2,nchar(sqlTextAllValues))
#   #   
#   #     sqlTextUpdateThreshold <- paste0("INSERT INTO Vale_Events_Thresholds (vehicle_id, LoadedStartTH, HaulStartTH, DumpStartTH, DumpEndTH,SlopeGradeThresholdLoad,SlopeGradeThresholdHaul,SlopeGradeThresholdDump) VALUES ",sqlTextAllValues," ON DUPLICATE KEY UPDATE LoadedStartTH = ",LST,","," HaulStartTH =", HST,",", "DumpStartTH = ",DST,",","DumpEndTH = ",DET,",","SlopeGradeThresholdLoad = ",SGLoad,",","SlopeGradeThresholdHaul = ",SGHaul,",","SlopeGradeThresholdDump = ",SGDump)
#   #     sqlTextUpdateThreshold
#   #   } else{
#   #     emptyString <- "nonNumeric"
#   #   }
#   # })
#   # 
#   # # When the Submit button is clicked, save the form data
#   # observeEvent(input$updateThresholdsButton, {
#   #   validate(
#   #     need(input$setThresholdsVehicelID != "" , label = "Parameters")
#   #   )
#   #   
#   #   prepareSqlText <- updateThresholdValues()
#   #   if(prepareSqlText != "nonNumeric"){
#   #     sqlOutut <- setEventsThresholds(prepareSqlText)
#   #     
#   #     output$successText <- renderUI({
#   #       paste("Updated Successfully...!!")
#   #     })
#   #     
#   #   } else{
#   #     output$successText <- renderUI({
#   #       paste("All thresholds has to be Numeric Values...!!")
#   #     })
#   #   }
#   # 
#   #   
#   # 
#   # })
#   # 
#   # 
#   # 
#   # observe({
#   #   # We'll use these multiple times, so use short var names for
#   #   # convenience.
#   #   vhtVehicleID <- input$vehicleHealthThresholdsVehicelID
#   # 
#   #   vehicleHealthThresholdsUpdate <- getVehicleHealthThresholds(vhtVehicleID)
#   # #   print(vehicleHealthThresholdsUpdate)
#   #   output$vehicleHealthThresholdsUI <- renderUI({
#   # #     print(vhtVehicleID)
#   #     tags$table(style= "width : 100%",
#   #                tags$tr(column(width = 6,numericInput("Enginespeed", label = "Engine Speed :", value = vehicleHealthThresholdsUpdate$Enginespeed)),
#   #                column(width = 6,numericInput("parkingbreakposition", label = "Parking Break On/Off:", value = vehicleHealthThresholdsUpdate$parkingbreakposition))),
#   #                tags$tr(column(width = 10,sliderInput("EngineOilPressure", "Engine Oil Pressure Good-Avg-Low:", min = 1, max = 250, value = c(vehicleHealthThresholdsUpdate$EngineOilPressureGood, vehicleHealthThresholdsUpdate$EngineOilPressureAvg)))),
#   #                tags$tr(column(width = 10,sliderInput("hydraulicsTemperature", "Hydraulics Temperature Good-Avg-Low:", min = 1, max = 250, value = c(vehicleHealthThresholdsUpdate$hydraulicsTemperatureGood, vehicleHealthThresholdsUpdate$hydraulicsTemperatureAvg)))),
#   #                tags$tr(column(width = 6,numericInput("tirePressureRR", label = "Tire Pressure Rear Right :", value = vehicleHealthThresholdsUpdate$tirePressureRR)),
#   #                column(width = 6,numericInput("tirePressureRL", label = "Tire Pressure Rear Left :", value = vehicleHealthThresholdsUpdate$tirePressureRL))),
#   #                tags$tr(column(width = 6,numericInput("tirePressureFR", label = "Tire Pressure Front Right :", value = vehicleHealthThresholdsUpdate$tirePressureFR)),
#   #                column(width = 6,numericInput("tirePressureFL", label = "Tire Pressure Front Left :", value = vehicleHealthThresholdsUpdate$tirePressureFL))),
#   #                tags$tr(column(width = 10,sliderInput("FuelLevel", "Fuel Level Low-Avg-Good:", min = 1, max = 100, value = c(vehicleHealthThresholdsUpdate$FuelLevelLow, vehicleHealthThresholdsUpdate$FuelLevelAvg))))
#   #     )
#   #   })
#   # 
#   #   output$successTextUpdateVehicleThresholds <- renderUI({
#   #     paste("")
#   #   })
#   #   
#   # })
#   # 
#   # 
#   # 
#   # updateVehicleHealthThresholdValues <- reactive({
#   #   
#   #   setThresholdsVehicelID <- input$vehicleHealthThresholdsVehicelID
#   #   
#   #   Enginespeed <- input$Enginespeed
#   #   parkingbreakposition <- input$parkingbreakposition
#   #   EngineOilPressureGood<- input$EngineOilPressure[[1]]
#   #   EngineOilPressureAvg <- input$EngineOilPressure[[2]]
#   #   hydraulicsTemperatureGood <- input$hydraulicsTemperature[[1]]
#   #   hydraulicsTemperatureAvg <- input$hydraulicsTemperature[[2]]
#   #   tirePressureRR <- input$tirePressureRR
#   #   tirePressureRL <- input$tirePressureRL
#   #   tirePressureFR <- input$tirePressureFR
#   #   tirePressureFL <- input$tirePressureFL
#   #   FuelLevelLow <- input$FuelLevel[[1]]
#   #   FuelLevelAvg <- input$FuelLevel[[2]]
#   #   
#   #   
#   #   if(is.numeric(Enginespeed) && is.numeric(parkingbreakposition) && is.numeric(tirePressureRR) && is.numeric(tirePressureRL) && is.numeric(tirePressureFR) && is.numeric(tirePressureFL))
#   #   {
#   #     
#   #     sqlTextUpdateThreshold <- paste0("UPDATE VehicleHealth_Thresholds  SET Enginespeed =",Enginespeed," , parkingbreakposition =",parkingbreakposition," , EngineOilPressureGood = ",EngineOilPressureGood,", EngineOilPressureAvg= ",EngineOilPressureAvg,", hydraulicsTemperatureGood = ",hydraulicsTemperatureGood,",hydraulicsTemperatureAvg = ",hydraulicsTemperatureAvg,", tirePressureRR = ",tirePressureRR,", tirePressureRL =",tirePressureRL,", tirePressureFR = ",tirePressureFR,", tirePressureFL = ",tirePressureFL,", FuelLevelLow = ",FuelLevelLow,", FuelLevelAvg = ",FuelLevelAvg," WHERE vehicle_id =",setThresholdsVehicelID)
#   #     sqlTextUpdateThreshold
#   #   } else{
#   #     emptyString <- "nonNumeric"
#   #   }
#   # })
#   # 
#   # # When the Submit button is clicked, save the form data
#   # observeEvent(input$updateVehicleHealthThresholdsButton, {
#   # 
#   #   prepareSqlText <- updateVehicleHealthThresholdValues()
#   #   if(prepareSqlText != "nonNumeric"){
#   #     sqlOutut <- setVehicleHealthThresholds(prepareSqlText)
#   #     
#   #     output$successTextUpdateVehicleThresholds <- renderUI({
#   #       paste("Updated Successfully...!!")
#   #     })
#   #     
#   #   } else{
#   #     output$successTextUpdateVehicleThresholds <- renderUI({
#   #       paste("All thresholds has to be Numeric Values...!!")
#   #     })
#   #   }
#   #  
#   # })
#   # 
#   # 
#   # 
#   # # Fleet Machine Table Thresholds
#   # 
#   # observe({
#   #   # We'll use these multiple times, so use short var names for
#   #   # convenience.
#   # #   fmtVehicleID <- input$fleetMachineTableVehicelID
#   #   
#   #   frtThresholds <- getFleetReportsTableThresholds()
#   #   #   print(vehicleHealthThresholdsUpdate)
#   #   output$fleetMachineTableThresholdsUI <- renderUI({
#   #     #     print(vhtVehicleID)
#   #     tags$table(style= "width : 100%",
#   #                tags$tr(column(width = 10,sliderInput("workingHours", "Working Hours Low-Avg-Good:", min = 1, max = 12,step = 0.5, value = c(frtThresholds$workingHourLow, frtThresholds$workingHourAvg)))),
#   #                tags$tr(column(width = 10,sliderInput("idleHours", "Idle Hours Good-Avg-Low:", min = 1, max = 12,step = 0.5, value = c(frtThresholds$idleHoursAvg,frtThresholds$idleHoursLow)))),
#   #                tags$tr(column(width = 10,sliderInput("totalHours", "Total Hours Low-Avg-Good:", min = 1, max = 12,step = 0.5, value = c(frtThresholds$totalHoursLow, frtThresholds$totalHoursAvg)))),
#   #                tags$tr(column(width = 10,sliderInput("freeWheeling", "Free Wheeling Low-Avg-Good:", min = 1, max = 100, value = c(frtThresholds$freeWheelingLow, frtThresholds$freeWheelingAvg)))),
#   #                tags$tr(column(width = 10,sliderInput("materialMoved", "Material Moved Low-Avg-Good:", min = 20, max = 200, value = c(frtThresholds$materialMovedLow, frtThresholds$materialMovedAvg)))),
#   #                tags$tr(column(width = 10,sliderInput("loadCycle", "Load Cycles Low-Avg-Good:", min = 20, max = 200, value = c(frtThresholds$loadCycleLow, frtThresholds$loadCycleAvg)))),
#   #                tags$tr(column(width = 10,sliderInput("overSpeeding", "Over Speeding Low-Avg-Good:", min = 1, max = 50, value = c(frtThresholds$overSpeedingLow, frtThresholds$overSpeedingAvg)))),
#   #                tags$tr(column(width = 10,sliderInput("fuelConsumed", "Fuel Consumed Low-Avg-Good:", min = 1, max = 100, value = c(frtThresholds$fuelConsumedLow, frtThresholds$fuelConsumedAvg)))),
#   #                tags$tr(column(width = 10,sliderInput("distanceTravelled", "Distance Travelled Low-Avg-Good:", min = 1, max = 100, value = c(frtThresholds$distanceTravelledLow, frtThresholds$distanceTravelledAvg))))
#   #     )
#   #   })
#   #   
#   #   output$successTextfleetMachineTableThresholds <- renderUI({
#   #     paste("")
#   #   })
#   #   
#   # })
#   # 
#   # 
#   # 
#   # 
#   # # When the Submit button is clicked, save the form data
#   # observeEvent(input$fleetMachineTableThresholdsButton, {
#   # 
#   #   whLow <- input$workingHours[[1]]
#   #   whAvg <- input$workingHours[[2]]
#   #   ihAvg <- input$idleHours[[1]]
#   #   ihLow <- input$idleHours[[2]]
#   #   thLow <- input$totalHours[[1]]
#   #   thAvg <- input$totalHours[[2]]
#   #   fwLow <- input$freeWheeling[[1]]
#   #   fwAvg <- input$freeWheeling[[2]]
#   #   mmLow <- input$materialMoved[[1]]
#   #   mmAvg <- input$materialMoved[[2]]
#   #   lcLow <- input$loadCycle[[1]]
#   #   lcAvg <- input$loadCycle[[2]]
#   #   osLow <- input$overSpeeding[[1]]
#   #   osAvg <- input$overSpeeding[[2]]
#   #   fcLow <- input$fuelConsumed[[1]]
#   #   fcAvg <- input$fuelConsumed[[2]]
#   #   dtLow <- input$distanceTravelled[[1]]
#   #   dtAvg <- input$distanceTravelled[[2]]
#   #   
#   #   prepareText <- paste0(whLow,",",whAvg,",",ihLow,",",ihAvg,",",thLow,",",thAvg,",",fwLow,",",fwAvg,",",mmLow,",",mmAvg,",",lcLow,",",lcAvg,",",osLow,",",osAvg,",",fcLow,",",fcAvg,",",dtLow,",",dtAvg)
#   #   prepareSql <- paste0("insert into FleetReportsTableThresholds values( ", prepareText," )")
#   #   sqlOutut <- setFleetReportsTableThresholds("delete from FleetReportsTableThresholds")
#   #   sqlOutut <- setFleetReportsTableThresholds(prepareSql)
#   #     
#   #     output$successTextfleetMachineTableThresholds <- renderUI({
#   #       paste("Updated Successfully...!!")
#   #     })
#   #     
#   #   
#   # })
#   # 
#   # 
#   # 
#   # 
#   # 
#   # # Targets
#   # 
#   # observe({
#   # 
#   #   
#   #   targets <- getTargets(input$targetsVehicelID)
#   #   #   print(vehicleHealthThresholdsUpdate)
#   #   output$targetsUI <- renderUI({
#   #     #     print(vhtVehicleID)
#   #     tags$table(style= "width : 100%",
#   #                tags$tr(column(width = 10,sliderInput("materialMovedTarget", "Material Moved :", min = 0, max = 2000,step = 10, value = c(targets$materialMoved)))),
#   #                tags$tr(column(width = 10,sliderInput("distanceTravelledTarget", "Distance Travelled:", min = 0, max = 500,step = 5, value = c(targets$distanceTravelled))))
#   #     )
#   #   })
#   #   
#   #   output$successTextTargets <- renderUI({
#   #     paste("")
#   #   })
#   #   
#   # })
#   # 
#   # 
#   # 
#   # 
#   # # When the Submit button is clicked, save the form data
#   # observeEvent(input$targetsUpdateButton, {
#   #   
#   #   materialMoved <- input$materialMovedTarget[[1]]
#   #   distanceTravelled <- input$distanceTravelledTarget[[1]]
#   #  
#   #   prepareSql <- paste0("UPDATE MaterialMovedDistanceTravelledTargets  SET materialMoved =",materialMoved," , distanceTravelled =",distanceTravelled," WHERE vehicle_id =",input$targetsVehicelID)
#   #   sqlOutut <- setFleetReportsTableThresholds(prepareSql)
#   #   
#   #   output$successTextTargets <- renderUI({
#   #     paste("Updated Successfully...!!")
#   #   })
#   #   
#   #   
#   # })
#   # 
#   # #--------------------------------------------Configure Thresholds END ----------------------------------------------------------
#   # 
#   # 
#   # 
#   # # 
#   # # 
#   # # # --------------------------- Testing Load Cycle --------------------------------
#   # # 
#   # # output$LoadCycleTesting <- renderDataTable({
#   # #   
#   # #   loadCycleDataTesting <- getloadCycledatafortesting()
#   # #   
#   # #   loadCycleDataTesting
#   # #   
#   # # },filter = 'bottom',options = list(searchHighlight = TRUE,pageLength = 10,dom = 'T<"clear">lfrtip',tableTools = list(sSwfPath = copySWF()))
#   # # 
#   # # )
#   # # 
#   # # 
#   # # #-------------------------Load Cycle Testing End -----------------------------------------------------------
#   # 
#   # 
#   
})
