

library(shiny)

library(shiny)

# Define UI for application for pricing bonds   
ui <- fluidPage(
  
  # Application title
  titlePanel("Bond Price"),
  
  # Sidebar with a slider input 
  sidebarLayout(
    
    sidebarPanel(
      sliderInput("slider1","Maturity in years",0,30,10),
      numericInput("box1", "Coupon Rate:", value = 5),
      numericInput("box2", "Yield:", value = 5),
      numericInput("box3", "Redemption Price:", value = 100)
      #actionButton("click","Calculate")
    ),
    
    mainPanel(
      h3("Price of the bond:"),
      textOutput("value"),
      h3("Sensibility of the price by yield:"),
      plotOutput("plott"),
      h6("Instruction:"),
      h6("You should insert the maturity, coupon, yield and redeption price"),
      h6("a) Select the maturity in years"),
      h6("b) Insert coupon and yield as percentage"),
      h6("c) Insert redemption price as percentage "),
      h6("You will get the quotation of the bond as percentage and a graphic"),
      h6("of the sensibility of the price by yield")
      )
    
    
  )
)
