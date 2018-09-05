ui <- dashboardPage(
  dashboardHeader(title = "Lending Club Data"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Grade", tabName = "grade")
    ),
    
    selectInput("state", levels(loans$addr_state), label = "State")
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "grade",
        fluidRow(
          box(
            plotlyOutput("plot")
          ),
          box(
              plotlyOutput("plot2")
          ),
          box(
              plotlyOutput("plot3")
          )
        )
      )
    )
  )
)