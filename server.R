server <- function(input, output, session) {
  plotData <- reactive({
    AutoClaims %>%
      filter(STATE == input$state) %>%
      select(-AGE) %>%
      group_by(CLASS) %>%
      summarise(PAID = sum(PAID)) 
  })
  
  output$plot <- renderPlotly({
    plot_ly(data = plotData()) %>%
      add_bars(x = ~CLASS, y = ~PAID)
  })
}

