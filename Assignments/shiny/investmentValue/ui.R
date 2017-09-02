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
  titlePanel("Investment Value vs Risk"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        p("Slide the \'Level of risk\' slider to change the level of risk of investments. 
          This will change the investment mix below. Higher levels of risk mean more investment in stocks and bonds, 
          where as lower levels of risk, put more invesment into savings accounts. Changing the level of risk shows how 
          $10,000 could potentially grow over 30 years in the chart on the right. "),
       sliderInput("riskInput",
                   "Level of risk:",
                   min = 0,
                   max = 10,
                   value = 3),
       tableOutput("investMix")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
        plotOutput("distPlot")
    )
  )
))
