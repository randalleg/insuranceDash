server <- function(input, output, session) {
  loanData <- reactive({
    loans %>%
      select(loan_amnt, sub_grade, addr_state) %>%
      group_by(sub_grade, addr_state) %>%
      summarise(Amount = sum(loan_amnt)) %>%
      filter(addr_state == input$state)
    })
  
  output$plot <- renderPlotly({
    plot_ly(data = loanData()) %>%
      add_bars(x = ~sub_grade, y = ~Amount) %>%
      layout(title = "Loan Sub Grade")
  })
  
  interestData <- reactive({
    loans %>%
      select(int_rate, sub_grade, addr_state) %>%
      group_by(sub_grade, addr_state) %>%
      summarise(Interest = mean(as.numeric(int_rate))) %>%
      filter(addr_state == input$state)
  })
  
  output$plot2 <- renderPlotly({
    plot_ly(data = interestData()) %>%
      add_markers(x = ~sub_grade, y = ~Interest) %>%
      layout(title = "")
  })
  
  verifiedData <- reactive({
    loans %>%
      filter(addr_state == input$state) %>%
      count(grade, verification_status)
  })
  
  output$plot3 <- renderPlotly({
    plot_ly(data = verifiedData()) %>%
      add_bars(x = ~grade, y = ~n, color = ~verification_status) %>%
      layout(title = "Income verification by grade")
  })
}

