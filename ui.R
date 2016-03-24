body <- dashboardBody(
  tabItems(
    # First tab content
    tabItem(tabName = "dashboard",
            fluidRow(
              box(
                title = "Chiller Information", width = 4, solidHeader = TRUE,status = "primary", collapsible = TRUE,
                selectInput(inputId="Chiller_ID", 
                            label = "Choose a Chiller ID",
                            choices = c(chiller_info$Chiller_ID),
                            selected= "Chiller2"
                ),
                htmlOutput("chiller_info")
              ),              
              box(
                title = "Chiller Health Latest Status",status = "primary", solidHeader = TRUE,width = 8, collapsible = TRUE,
                valueBoxOutput("vehicleHealthDate"),
                valueBoxOutput("statusBox"),
                valueBoxOutput("EngineOilBox"),
                #                 infoBox(
                #                   "OEE","35%",icon = icon("thumbs-o-up"),
                #                   color = "yellow"
                #                 ),
                valueBoxOutput("HydraulicsTempBox"),
                fuelOutputBox("fuelLevel", width = 4),
                valueBoxOutput("TirepressureBox")
              )
              
            ),
            
            fluidRow(
              column(width = 4,
                     box(
                       title = "Day Details", width = 12, solidHeader = TRUE, status = "primary",
                       column(width = 6, dateInput("shiftDetailsShiftDate","Choose a Date", value="2015-07-28")),
                       #                     column(width = 6, selectInput(inputId="shift_type", label = "Shift Type", choices = c("DS","NS"), selected="NS")),
                       htmlOutput("shift_details"),
                       valueBoxOutput("mmDashboard",width =6),
                       valueBoxOutput("dtDashboard",width =6),
                       valueBoxOutput("fcDashboard",width =6),
                       valueBoxOutput("osDashboard",width =6),
                       valueBoxOutput("fwDashboard",width =6),
                       valueBoxOutput("athDashboard",width =6),
                       valueBoxOutput("drivingparikingbreakonDashboard",width =6)
                     ),
                     box(
                       title= "Incidents", width = 12,status = "primary",solidHeader = TRUE,
                       htmlOutput("incidents")
                     )
              ),
              column(width = 8,
                     fluidRow(
                       box(
                         title = "Chiller Utilization(Working vs Idle)", width = 6, solidHeader = TRUE, status = "primary",
                         htmlOutput("vehicleUtilization")
                       ),
                       box(
                         title = "Chiller Utilization(Working vs Idle)", width = 6, solidHeader = TRUE, status = "primary",
                         htmlOutput("fuelUtilization")
                       )
                     ),
                     fluidRow(
                       box(
                         title = "Material Moved (Last 7 Days)", width = 6,solidHeader = TRUE, status = "primary",
                         materialMovedOutputBox("materialMoved")
                       ),
                       box(
                         title = "Distance Travelled (Last 7 Days)", width = 6,solidHeader = TRUE, status = "primary",
                         distanceTravelledOutputBox("distanceTravelled")
                       )
                     )
              )
            )
            
    ),
    ############################################################################################################################################    
    #First tab content
    tabItem(tabName = "plots",
            fluidRow(
              column(width = 1,
                     selectInput(inputId="plots_chillerID", 
                                 label = "Chiller ID",
                                 choices = c(chiller_info$Chiller_ID),
                                 selected= "Chiller2"
                     )),
              
              column(width = 2,
                     dateInput("plotsDateFrom"," From Date", value="2014-04-01")
              ),
              
              column(width = 2,
                     dateInput("plotsDateTo"," To Date", value="2014-09-30")
              ),
              #              column(width = 1,
              #                     selectInput(inputId="plotsShiftType", 
              #                                 label = "Shift",
              #                                 choices = c("DS","NS"),
              #                                 selected="DS"
              #                     )
              #              ),
              column(width = 3, htmlOutput("inputParams1")),
              column(width = 3, htmlOutput("inputParams2"))
              #                 column(width = 2,
              #                      selectizeInput(inputId="plotEvents", 
              #                                  label = "Events on Y1",
              #                                  choices = c("LHD Cycle" ="LHDCycle"),
              #                                  multiple = TRUE,
              #                                  options = list(placeholder = 'Please select an Event')
              #                      )
              #                 )
            ),
            #              fluidRow(radioButtons("plotsTime", "Time :",
            #                                    list("Chart" = "chart","Table" = "table")
            #              )),
            tags$br(),
            #              fluidRow(
            #                column(width = 1,htmlOutput("plotSelectTime")),
            #                column(width = 11,
            #                       lineChartOutput("main_plot")
            #                )
            #             ),
            fluidRow(
              column(width = 12,
                     dygraphOutput("dygraphplot1")          
                     
              ),
              column(width = 12,
                     dygraphOutput("dygraphplot3")          
                     
              )
            )
    ),
    ###
    #Second tab content
    tabItem(tabName = "plots_2",
            fluidRow(
              column(width = 1,
                     selectInput(inputId="plots_chillerID_2", 
                                 label = "Chiller ID",
                                 choices = c(chiller_info$Chiller_ID),
                                 selected= "Chiller2"
                     )),
              
              column(width = 2,
                     dateInput("plotsDateFrom_2"," From Date", value="2015-03-01")
              ),
              
              column(width = 2,
                     dateInput("plotsDateTo_2"," To Date", value="2015-08-30")
              ),
              #              column(width = 1,
              #                     selectInput(inputId="plotsShiftType", 
              #                                 label = "Shift",
              #                                 choices = c("DS","NS"),
              #                                 selected="DS"
              #                     )
              #              ),
              column(width = 3, htmlOutput("inputParams1_2")),
              column(width = 3, htmlOutput("inputParams2_2"))
              #                 column(width = 2,
              #                      selectizeInput(inputId="plotEvents", 
              #                                  label = "Events on Y1",
              #                                  choices = c("LHD Cycle" ="LHDCycle"),
              #                                  multiple = TRUE,
              #                                  options = list(placeholder = 'Please select an Event')
              #                      )
              #                 )
            ),
            #              fluidRow(radioButtons("plotsTime", "Time :",
            #                                    list("Chart" = "chart","Table" = "table")
            #              )),
            tags$br(),
            #              fluidRow(
            #                column(width = 1,htmlOutput("plotSelectTime")),
            #                column(width = 11,
            #                       lineChartOutput("main_plot")
            #                )
            #             ),
            fluidRow(
              column(width = 12,
                     dygraphOutput("dygraphplot1_2")          
                     
              ),
              column(width = 12,
                     dygraphOutput("dygraphplot3_2")          
                     
              )
            )
    ),
    
    ######################### Third tab ###############################################
    tabItem(tabName = "plots_3",
            fluidRow(
              column(width = 1,
                     selectInput(inputId="plots_chillerID_3", 
                                 label = "Chiller ID",
                                 choices = c(chiller_info$Chiller_ID),
                                 selected= "Chiller2"
                     )),
              
              column(width = 2,
                     dateInput("plotsDateFrom_3"," From Date", value="2015-03-01")
              ),
              
              column(width = 2,
                     dateInput("plotsDateTo_3"," To Date", value="2015-08-30")
              ),
              #              column(width = 1,
              #                     selectInput(inputId="plotsShiftType", 
              #                                 label = "Shift",
              #                                 choices = c("DS","NS"),
              #                                 selected="DS"
              #                     )
              #              ),
              column(width = 3, htmlOutput("inputParams1_3")),
              column(width = 3, htmlOutput("inputParams2_3"))
              #                 column(width = 2,
              #                      selectizeInput(inputId="plotEvents", 
              #                                  label = "Events on Y1",
              #                                  choices = c("LHD Cycle" ="LHDCycle"),
              #                                  multiple = TRUE,
              #                                  options = list(placeholder = 'Please select an Event')
              #                      )
              #                 )
            ),
            #              fluidRow(radioButtons("plotsTime", "Time :",
            #                                    list("Chart" = "chart","Table" = "table")
            #              )),
            tags$br(),
            #              fluidRow(
            #                column(width = 1,htmlOutput("plotSelectTime")),
            #                column(width = 11,
            #                       lineChartOutput("main_plot")
            #                )
            #             ),
            fluidRow(
              column(width = 12,
                     dygraphOutput("dygraphplot1_3")          
                     
              ),
              column(width = 12,
                     dygraphOutput("dygraphplot3_3")          
                     
              )
            )
    ),
    
    ######################### Fourth tab ###############################################
    tabItem(tabName = "plots_4",
            fluidRow(
              column(width = 1,
                     selectInput(inputId="plots_chillerID_4", 
                                 label = "Chiller ID",
                                 choices = c(chiller_info$Chiller_ID),
                                 selected= "Chiller2"
                     )),
              
              column(width = 2,
                     dateInput("plotsDateFrom_4"," From Date", value="2015-03-01")
              ),
              
              column(width = 2,
                     dateInput("plotsDateTo_4"," To Date", value="2015-08-30")
              ),
              #              column(width = 1,
              #                     selectInput(inputId="plotsShiftType", 
              #                                 label = "Shift",
              #                                 choices = c("DS","NS"),
              #                                 selected="DS"
              #                     )
              #              ),
              column(width = 3, htmlOutput("inputParams1_4"))
              #         column(width = 3, htmlOutput("inputParams2_4"))
              #                 column(width = 2,
              #                      selectizeInput(inputId="plotEvents", 
              #                                  label = "Events on Y1",
              #                                  choices = c("LHD Cycle" ="LHDCycle"),
              #                                  multiple = TRUE,
              #                                  options = list(placeholder = 'Please select an Event')
              #                      )
              #                 )
            ),
            #              fluidRow(radioButtons("plotsTime", "Time :",
            #                                    list("Chart" = "chart","Table" = "table")
            #              )),
            tags$br(),
            #              fluidRow(
            #                column(width = 1,htmlOutput("plotSelectTime")),
            #                column(width = 11,
            #                       lineChartOutput("main_plot")
            #                )
            #             ),
            fluidRow(
              column(width = 12,
                     dygraphOutput("dygraphplot1_4")          
                     
              )
              #           column(width = 12,
              #                  dygraphOutput("dygraphplot3_4")          
              #                  
              #           )
            )
    ),
    
    
    #Fifth plots tab content
    tabItem(tabName = "plots_5",
            fluidRow(
              column(width = 1,
                     selectInput(inputId="plots_chillerID_5", 
                                 label = "Chiller ID",
                                 choices = c(chiller_info$Chiller_ID),
                                 selected= "Chiller 2"
                     )),
              
              column(width = 2,
                     dateInput("plotsDateFrom_5"," From Date", value="2015-03-01")
              ),
              #              column(width = 1,
              #                     selectInput(inputId="plotsShiftType", 
              #                                 label = "Shift",
              #                                 choices = c("DS","NS"),
              #                                 selected="DS"
              #                     )
              #              ),
              column(width = 2,
                     dateInput("plotsDateTo_5"," To Date", value="2015-08-30")
              ),
              
              column(width = 3, htmlOutput("inputParams1_5")),
              column(width = 3, htmlOutput("inputParams2_5"))
              #           column(width = 2,
              #                  selectizeInput(inputId="plotEvents", 
              #                                 label = "Events on Y1",
              #                                 choices = c("LHD Cycle" ="LHDCycle"),
              #                                 multiple = TRUE,
              #                                 options = list(placeholder = 'Please select an Event')
              #                  )
              #           )
            ),
            #              fluidRow(radioButtons("plotsTime", "Time :",
            #                                    list("Chart" = "chart","Table" = "table")
            #              )),
            tags$br(),
            #              fluidRow(
            #                column(width = 1,htmlOutput("plotSelectTime")),
            #                column(width = 11,
            #                       lineChartOutput("main_plot")
            #                )
            #             ),
            fluidRow(
              column(width = 12,
                     dygraphOutput("dygraphplot1_5")          
                     
              ),
              column(width = 12,
                     dygraphOutput("dygraphplot3_5")          
              )
            )
    ),
    
    
    ###########################################################################################################
    #Third tab content
    tabItem(tabName = "individualReports", 
            fluidRow(
              column(width =2,
                     radioButtons("ireportType", "View Report as:",
                                  list("Chart" = "chart","Table" = "table")
                     )
              ),
              conditionalPanel(
                condition = "input.ireportType == 'chart'",
                column(width = 2,
                       selectInput(inputId="iReportsVehicelID", 
                                   label = "Choose a Vehicle ID",
                                   choices = c(chiller_info$Chiller_ID),
                                   selected= "Chiller 2"
                       )),
                
                column(width = 2,
                       dateInput("iReportsFromDate","Date From", value="2015-07-27")
                ),
                column(width = 2,
                       dateInput("iReportsToDate","Date To", value="2015-07-29")
                ),
                column(width = 1,
                       selectInput(inputId="iReportsShiftType", 
                                   label = "Shift",
                                   choices = c("DS","NS"),
                                   selected="DS"
                       )
                ),
                column(width = 3,
                       selectizeInput(inputId="ireportParameters", 
                                      label = "Choose Parameters",
                                      choices = c("Working Hours" = "working_hour","Idle Hours" = "idle_hours","Total Hours" = "total_hour", "Distance Travelled" = "distance_travelled",
                                                  "Fuel Consumed" =  "fuelconsumed","Over Speeding" = "overspeeding",
                                                  "Free Wheeling" =  "freewheeling"),
                                      multiple = TRUE,
                                      options = list(placeholder = 'Please select Values'))
                )
              ),
              conditionalPanel(
                condition = "input.ireportType == 'table'",
                column(width = 2, 
                       selectInput(inputId="ireportName", 
                                   label = "Choose a Report",
                                   choices = c('Utilization','Utilization Advance','Fuel Utilization'),
                                   selected='Utilization')
                ),
                column(width = 2,
                       selectInput(inputId="iReportsTableVehicelID", 
                                   label = "Choose a Vehicle ID",
                                   choices = c(chiller_info$Chiller_ID),
                                   selected= "Chiller1"
                       )
                       
                )
              ),
              tags$br(),
              fluidRow(
                conditionalPanel(
                  condition = "input.ireportType == 'table'",
                  div(style = 'overflow-x: scroll', dataTableOutput('iReportsTable'))
                ),
                conditionalPanel(
                  condition = "input.ireportType == 'chart'",
                  barchartOutput('ireportplot')
                )
              )
            ),
            
            #Fourth Tab Content 
            tabItem(tabName = "comprehensiveReports",
                    fluidRow(
                      column(width =2,
                             radioButtons("creportType", "View Report as:",
                                          list("Chart" = "chart","Table" = "table")
                             )
                      ),
                      column(width = 2,
                             selectInput(inputId="bucketAnalysis_site", 
                                         label = "Site Location",
                                         choices = c("Coleman  Mine")
                             )
                      ),
                      conditionalPanel(
                        condition = "input.creportType == 'chart'",
                        column(width = 2,
                               dateInput("cReportsFromDate","Date From", value="2015-08-22")
                        ),
                        column(width = 2,
                               dateInput("cReportsToDate","Date To", value="2015-08-29")
                        ),
                        column(width = 1,
                               selectizeInput(inputId="creportShifyTpye", 
                                              label = "Shift",
                                              choices = c("DS","NS"),
                                              selected="DS")
                        ),
                        column(width = 2,
                               selectizeInput(inputId="creportParameters", 
                                              label = "Type of report",
                                              choices = c("Working Hours" = "working_hour","Idle Hours" = "idle_hours","Total Hours" = "total_hour","Distance Travelled" = "distance_travelled",
                                                          "Fuel Consumed" =  "fuelconsumed","Over Speeding" = "overspeeding",
                                                          "Free Wheeling" =  "freewheeling"),
                                              options = list(placeholder = 'Please select Values', 
                                                             onInitialize = I('function() { this.setValue(""); }'))
                               )
                        )
                      ),
                      conditionalPanel(
                        condition = "input.creportType == 'table'",
                        column(width = 2,
                               selectizeInput(inputId="creportName", 
                                              label = "Type of report",
                                              choices = c("Working Hours" = "working_hour","Idle Hours" = "idle_hours","Total Hours" = "total_hour","Distance Travelled" = "distance_travelled",
                                                          "Fuel Consumed" =  "fuelconsumed","Over Speeding" = "overspeeding",
                                                          "Free Wheeling" =  "freewheeling"),
                                              options = list(placeholder = 'Please select Values'))
                        )
                      )
                    ),
                    tags$br(),
                    fluidRow(
                      conditionalPanel(
                        condition = "input.creportType == 'table'",
                        div(style = 'overflow-x: scroll', dataTableOutput('cReportsTable'))
                      ),
                      conditionalPanel(
                        condition = "input.creportType == 'chart'",
                        barchartOutputSummary('creportplot')
                      )
                    )
            ),
            
            tabItem(tabName = "bucketAnalysisMachine",
                    fluidRow(
                      column(width =2,
                             radioButtons("bucketAnalysisReportType", "View Report as:",
                                          list("Chart" = "chart","Table" = "table")
                             )
                      ),
                      column(width = 2,
                             selectInput(inputId="bucketAnalysis_vehicelID", 
                                         label = "Vehicle ID",
                                         choices = c(chiller_info$Chiller_ID),
                                         selected= "Chiller 2"
                             )
                      ),
                      
                      column(width = 2,
                             dateInput("bucketAnalysisDate","Date", value="2015-07-27")
                      ),
                      column(width = 1,
                             selectInput(inputId="bucketAnalysisShiftType", 
                                         label = "Shift",
                                         choices = c("DS","NS"),
                                         selected="DS"
                             )
                      ),
                      conditionalPanel(
                        condition = "input.bucketAnalysisReportType == 'chart'",
                        column(width = 3,
                               selectizeInput(inputId="bucketAnalysisEventParam", 
                                              label = "Choose LHD Events",
                                              choices = c("Load Event" ="LoadEvent" ,"Haul Event" = "HaulEvent", "Dump Event" ="DumpEvent" ),
                                              multiple = TRUE,
                                              options = list(placeholder = 'Please select an Event', 
                                                             onInitialize = I('function() { this.setValue(""); }'))
                               )
                        )
                      )
                    ),
                    column(width = 3,htmlOutput("NoOfBucketsMachine")),
                    tags$br(),
                    conditionalPanel(
                      condition = "input.bucketAnalysisReportType == 'chart'",
                      fluidRow(column(width = 12, bucketAnalysisBarChartOutput('bucketAnalysisbarplot')))
                    )
                    ,
                    conditionalPanel(
                      condition = "input.bucketAnalysisReportType == 'table'",
                      fluidRow(column(width = 12, dataTableOutput('bucketAnalysistableplot')))
                    )
            ),
            
            tabItem(tabName = "bucketAnalysisFleet",
                    fluidRow(
                      column(width = 2,
                             selectInput(inputId="bucketAnalysis_site", 
                                         label = "Site Location",
                                         choices = c("Coleman Mine")
                             )
                      ),
                      column(width = 2,
                             dateInput("bucketAnalysisDateFleet","Date", value="2015-09-05")
                      ),
                      column(width = 2,
                             selectInput(inputId="bucketAnalysisShiftTypeFleet", 
                                         label = "Shift",
                                         choices = c("DS","NS"),
                                         selected="NS"
                             )
                      ),
                      column(width = 3,
                             selectizeInput(inputId="bucketAnalysisFleetEventParam", 
                                            label = "Choose Parameter",
                                            choices = c("LHD Cycle" ="LoadCycle" ,"# of Buckets" = "NoOfBuckets","Material Moved" = "materialMoved" ,"Vehicle Utilization" = "vechicleUtilization"),
                                            multiple = TRUE,
                                            options = list(placeholder = 'Please select an Event', 
                                                           onInitialize = I('function() { this.setValue(""); }'))
                             )
                      )
                    ),
                    tags$br(),
                    fluidRow(column(width = 12, bucketAnalysisBarChartOutputFleet('bucketAnalysisBarplotFleet')))
            ),
            
            tabItem(tabName = "configurableSettings",
                    
                    fluidRow(
                      box(
                        title= "Data Analysis",status = "primary",width = 12,
                        
                        box(
                          title= "Configure bi-variate algorithm",width = 4,status = "primary",solidHeader = TRUE,
                          
                          radioButtons("configureThresholds", "Events Thresholds :",
                                       list("View Thresholds" = "viewThresholds","Configure Thresholds" = "setThresholds")
                          ),
                          htmlOutput("thresholdsUI"),
                          htmlOutput("viewSetThresholdsUI"),
                          conditionalPanel(
                            condition = "input.configureThresholds == 'setThresholds'",
                            actionButton("updateThresholdsButton", "Update Thresholds",icon("circle-o-notch"))                   
                          ),
                          htmlOutput("successText")
                        ),
                        box(
                          title = "Vehicle Health Thresholds", width = 4,status = "primary",solidHeader = TRUE,
                          column(width = 9,
                                 selectInput(inputId="vehicleHealthThresholdsVehicelID", 
                                             label = "Choose a Vehicle ID",
                                             choices = c(chiller_info$Chiller_ID),
                                             selected= "Chiller1"
                                 )
                          ),
                          htmlOutput("vehicleHealthThresholdsUI"),
                          actionButton("updateVehicleHealthThresholdsButton", "Update Thresholds",icon("circle-o-notch")),
                          htmlOutput("successTextUpdateVehicleThresholds")
                        ),
                        box(
                          title = "Fleet Machine Thresholds", width = 4,status = "primary",solidHeader = TRUE,
                          #                     column(width = 9,
                          #                            selectInput(inputId="fleetMachineTableVehicelID", 
                          #                                        label = "Choose a Vehicle ID",
                          #                                        choices = c(vehicleInfo$vehicle_id),
                          #                                        selected=337
                          #                            )
                          #                     ),
                          htmlOutput("fleetMachineTableThresholdsUI"),
                          actionButton("fleetMachineTableThresholdsButton", "Update Thresholds",icon("circle-o-notch")),
                          htmlOutput("successTextfleetMachineTableThresholds")
                        )
                      )
                    ),
                    fluidRow(
                      column(width = 6, 
                             box(
                               title= "Targets",status = "primary",solidHeader = TRUE,width = 12,
                               column(width = 9,
                                      selectInput(inputId="targetsVehicelID", 
                                                  label = "Choose a Vehicle ID",
                                                  choices = c(chiller_info$Chiller_ID),
                                                  selected= "Chiller1"
                                      )
                               ),
                               htmlOutput("targetsUI"),
                               actionButton("targetsUpdateButton", "Update Targets",icon("circle-o-notch")),
                               htmlOutput("successTextTargets")
                             )
                      ),
                      column(width = 6, 
                             box(
                               title= "Data visualization",status = "primary",solidHeader = TRUE,width = 12,
                               selectizeInput(inputId="configureDatavisualization", 
                                              label = "select Parameters",
                                              choices = c("Engine Start-Stop" = "ESS","Vehicle Start-Stop" ="VSS" ,"Load Cycle" ="LC" ,
                                                          "Unload Cycle" ="UC" ,"Shift Cycle" = "SC"),
                                              multiple = TRUE,
                                              options = list(placeholder = 'Please select a type')
                               ),
                               div("Added Dummy Parameters for all three..!!")
                             )
                      )
                    )
            )
            
    )
  ) 
)
dbHeader <- dashboardHeader()

dbHeader$children[[2]]$children[[1]] <- tags$p("Fleet Dashboard")

customHtml <- withTags({
  h3(style="margin-top: 0px;padding-top:10px;color:white;text-align: center;","Infosys' Chiller Analytics Solution")
})
# tags$a(style='color:white;',href='http://www.infosys.com','Infosys Chiller Analytics Solution')
dbHeader$children[[3]]$children[[3]] <- customHtml

# shinyUI(navbarPage("Fleet Dashboard",
#                    tabPanel(h4("Asset Perforamnce Dashboard"), tabName = "dashboard", style = "background-color: #123123;"),
#                    tabPanel(h4("Trend Charts - 1"), tabName = "plots", style = "background-color: #123123;"),
#                    tabPanel(h4("Trend Charts - 2"), plotOutput("plots_2"), style = "background-color: #ADBADB;"),
#                    tabPanel(h4("Trend Charts - 3"), plotOutput("plots_3"), style = "background-color: #F0F0F0;"),
#                    tabPanel(h4("Trend Charts - 4"), plotOutput("plots_4"), style = "background-color: #123123;"),
#                    tabPanel(h4("Trend Charts - 5"), plotOutput("plots_5"), style = "background-color: #123123;")
# ))


shinyUI(
  dashboardPage(
    dbHeader,
    dashboardSidebar(
      sidebarMenu(
        menuItem("Asset Performance Dashboard", tabName = "dashboard", icon = icon("dashboard")),
        menuItem("Trend Charts - 1", tabName = "plots", icon = icon("line-chart")),
        menuItem("Trend Charts - 2", tabName = "plots_2", icon = icon("line-chart")),
        menuItem("Trend Charts - 3", tabName = "plots_3", icon = icon("line-chart")),
        menuItem("Trend Charts - 4", tabName = "plots_4", icon = icon("line-chart")),
        menuItem("Trend Charts - 5", tabName = "plots_5", icon = icon("line-chart"))
        #         menuItem("Asset/Machine report", tabName = "individualReports", icon = icon("file-o")),
        #         menuItem("Fleet Summary Reports", tabName = "comprehensiveReports", icon = icon("files-o")),
        #         menuItem("Asset/Machine Bucket Analysis", tabName = "bucketAnalysisMachine", icon = icon("anchor")),
        #         menuItem("Fleet Bucket Analysis", tabName = "bucketAnalysisFleet", icon = icon("arrows-h")),
        #         menuItem("Configurable Settings", tabName = "configurableSettings", icon = icon("gears"))
      )
    ),
    body,
    title = "Fleet Dashboard"
  )
)
