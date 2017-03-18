

library(shiny)

server <- function(input, output) {
  #######################################################
  # pRICE BOND FUNCTION
  #######################################################
  pb <- function(coupon,yield,redt,t){
    price<-0
    for (year in 1:(t-1)) {
      price <- price + (coupon)/((1+yield/100)^year)
    }
    price <- price +  (redt+coupon)/((1+yield/100)^t)
    return(price)
  }
  #######################################################
  # output plot
  #######################################################
  
  
  
  
  output$plott <- renderPlot({
    
    dp <- data.frame()
    for (y in seq(1,10,0.25)) {
      vc <- c(pb(input$box1,y,input$box3,input$slider1),y)
      dp <- rbind(dp,vc)
    }
    
    plot(dp[,2],dp[,1], pch=19,main="Price vs Yield", xlab="Yield", ylab="Price")
  })
  
  #######################################################
  # output price 
  #######################################################
  output$value<- renderText({pb(input$box1,input$box2,input$box3,input$slider1)})
  
}

# Run the application 
#shinyApp(ui = ui, server = server)

