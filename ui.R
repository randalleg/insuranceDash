ui <- dashboardPage(
  dashboardHeader(title = "Lending Club Data"),
  dashboardSidebar(),
  dashboardBody(
    fluidRow(
      box(
        selectInput("state", levels(loans$addr_state), label = "Age")
      )
    ),
    
    fluidRow(
      box(
        plotlyOutput("plot")
      ),
      
    box(
        plotlyOutput("plot2")
    )
    )
  )
)