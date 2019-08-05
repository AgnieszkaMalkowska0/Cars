#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)



shinyUI(fluidPage(
  
  
  titlePanel("European car sales"),
  
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 25),
      selectInput("myVariable", "Car sales:",
                  list(
                    "Aston Martin" = "Aston_Martin",
                    "Bentley" = "Bentley",
                    "Cadillac" = "Cadillac",
                    "Ferrari" = "Ferrari",
                    "Lamborghini" = "Lamborghini",
                    "Rolls Royce" = "Rolls_Royce"
                  ),
                  selected = NULL)
      
      
    ),
    
    
    mainPanel(
      
      h2(textOutput("name")),
      h3(verbatimTextOutput("mySummary")),
      fluidRow(
        column(6, plotOutput("Plot1")),
        column(6,plotOutput("Plot2"))
      )
      
      
      
      
      
    )
  )
))
