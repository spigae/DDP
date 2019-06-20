#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Tool for predicting the car stopping distance based on the cars dataset"),
  
  # Sidebar with options selectors 
  sidebarLayout(
    sidebarPanel(
      helpText("Predicting the distance taken to stop a car based on its speed."),
      h3(helpText("Write a value:")),
      numericInput("mph", label = h4("Speed (mph)"), step = 0.1, value = 5)
      
    ),
    
    # Show a plot with car observations and regression line
    mainPanel(
      plotOutput("resultPlot"),
      h4("Car speed:"),
      h4(textOutput("resultSpeed")),
      h4("Predicted stopping distance:"),
      h4(textOutput("resultDist"))
    )
  )
))
