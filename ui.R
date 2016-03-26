library(shiny)
library(ggplot2)
library(shinydashboard)
library(dplyr)

#data$Date<- strptime(data$Date,"%Y/%m/%d %H:%M:%S")



#******************************************************************************************

dashboardPage(
  
  dashboardHeader(title = "Market Outlook Dashboard"),
  
  dashboardSidebar(
    sidebarMenu(
      # menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard"),badgeLabel = "WIP", badgeColor = "green"),
      #menuItem("Line Plots", tabName = "Line Plots", icon = icon("th")),
      menuItem("Momentum", tabName = "momentum", icon = icon("th")),
      menuItem("Breadth Plots", tabName = "Breadth", icon = icon("th")),
      menuItem("Sentiment Plots", tabName = "sentiment", icon = icon("th"))
    )),
  
  dashboardBody(
    
    tabItems(
      #       #*****************************************  
      
      tabItem( 
        tabName = "momentum",
        fluidRow(
        box(
          title = "TRIN",status = "success", solidHeader = TRUE,width = 10, collapsible = TRUE,
          #                 valueBoxOutput("vehicleHealthDate"),
          #                 valueBoxOutput("statusBox"),
          #                 valueBoxOutput("EngineOilBox"),
          #                 infoBox(
          #                   "OEE","35%",icon = icon("thumbs-o-up"),
          #                   color = "yellow"
          #                 ),
          box(plotOutput("trinplot"),height = 260)

        ),
        box(
        title = "AD Line",status = "success", solidHeader = TRUE,width = 10, collapsible = TRUE,
        #                 valueBoxOutput("vehicleHealthDate"),
        #                 valueBoxOutput("statusBox"),
        #                 valueBoxOutput("EngineOilBox"),
        #                 infoBox(
        #                   "OEE","35%",icon = icon("thumbs-o-up"),
        #                   color = "yellow"
        #                 ),
        box(plotOutput("trinplot"),height = 260)
        
        ),
        box(
        title = "High-Low Index",status = "success", solidHeader = TRUE,width = 10, collapsible = TRUE,
        #                 valueBoxOutput("vehicleHealthDate"),
        #                 valueBoxOutput("statusBox"),
        #                 valueBoxOutput("EngineOilBox"),
        #                 infoBox(
        #                   "OEE","35%",icon = icon("thumbs-o-up"),
        #                   color = "yellow"
        #                 ),
        box(plotOutput("trinplot"),height = 260)
        
      )
        )

      ),
tabItem( 
  tabName = "Breadth",
  h2("Chiller"),
  #         sliderInput("range", 
  #                     label = "Range of interest:",
  #                     min = 0, max = nrow(data), value = c(0, 100)),
  
  #  dateRangeInput("date2","Select a duration",start=data$Date[1],end=data$Date[nrow(data)],min=data$Date[1],max=data$Date[nrow(data)]),
  plotOutput("plot2"),
  br(),
  
  selectInput("var","Select the variable",colnames(data),multiple=F,selected="CHWDeltaT"),
  #  plotOutput("plot3"),
  
  selectInput("var2","Select the variable",colnames(data),multiple=F,selected="CDWDeltaT")
  #
  
),
tabItem( 
  tabName = "sentiment",
  h2("Chiller"),
  #         sliderInput("range", 
  #                     label = "Range of interest:",
  #                     min = 0, max = nrow(data), value = c(0, 100)),
  
  #  dateRangeInput("date2","Select a duration",start=data$Date[1],end=data$Date[nrow(data)],min=data$Date[1],max=data$Date[nrow(data)]),
  plotOutput("plot2"),
  br(),
  
  selectInput("var","Select the variable",colnames(data),multiple=F,selected="CHWDeltaT"),
  #  plotOutput("plot3"),
  
  selectInput("var2","Select the variable",colnames(data),multiple=F,selected="CDWDeltaT")
  #
  
)








    )
  )
)
