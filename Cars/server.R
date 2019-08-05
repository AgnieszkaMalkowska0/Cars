

library(shiny)
library(csv)
library(csvread)
library(lubridate)
library(date)
library(ggplot2)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  
  car <- read.csv(file="https://artemis.wszib.edu.pl/~agmalkow/Cars.csv", sep=";", header = TRUE)
  
  input$ myVariable <- factor(input$myVariable)
 
  output$name <- renderText({ input$myVariable})

  str(car[,1])
  
  date <- as.Date(car[,1], format="%m-%d-%Y")
  myYear <- year(as.Date(date,"%m-%d-%Y"))
  
  output$mySummary = renderPrint ({
    
    summary(car[,input$myVariable])
  })
  
  output$Plot1 <-renderPlot({
    
    x = input$myVariable
    plot (myYear, car[,x], type = "l", xlab="Year", ylab=input$myVariable)
    
    
  })
  
  output$Plot2 <-renderPlot({
    
    h <-input$myVariable    
    bins = seq(min(car[,h]),max(car[,h]), length.out = input$bins +1)
    
    hist(car[,h], breaks = bins, col = 'blue',border = 'white',
         xlab = h, ylab = "Frequency" )
  })
  
 

  
  
})
