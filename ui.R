ui <- fluidPage(
  selectInput("state", levels(AutoClaims$STATE), label = "State"),
  plotlyOutput("plot")
)