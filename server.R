#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(datasets)

# Server code  to draw a scatterplot
shinyServer(function(input, output) {
  output$resultPlot <- renderPlot({
    
    # run linear regression model
    fit1 <- lm(dist ~ speed, data = cars)
        
    # predict the stopping distance
    pred1 <- predict(fit1, newdata = data.frame(speed = input$mph))
        
    # Draw the scatterplot using ggplot2
    plot1 <- ggplot(data=cars, aes(x=speed, y = dist))+
      geom_point(aes(color = speed), alpha = 0.5)+
      geom_smooth(method = "lm")+
      geom_point() +
      geom_point(aes(x=input$mph, y=pred1), colour="orange",size=5) +
      xlab("Speed (mph)")+
      ylab("Distance (ft)")+
      ggtitle("Car Stopping Distance vs Speed and Regression Line")
    
    plot1
    
  })
  output$resultSpeed <- renderText({                        
    
    res1 <- paste(input$mph,"mph")
    res1
    
  })
  output$resultDist <- renderText({
    # run linear regression model
    fit1 <- lm(data = cars, dist ~ speed)
    # predict the stopping distance
    pred1 <- predict(fit1, newdata = data.frame(speed = input$mph))
    res2 <- paste(round(pred1, digits = 3), "ft")
    res2
  })
  
})