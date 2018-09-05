ui <- dashboardPage(
  dashboardHeader(title = "Lending Club Data"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Grade", tabName = "grade"),
      menuItem("Demographic", tabName = "demographic")
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
          column(3),
          box(
              plotlyOutput("plot3")
          ),
          column(3)
        )
      ),
      tabItem(tabName = "demographic",
        fluidRow(
          box(
            plotlyOutput("plot4")
          )
        )
      )
    )
  )
)