#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

output$investMix <- renderTable({
    # generate bins based on input$bins from ui.R
    riskInput = input$riskInput
    
    currStart <- 10000
    
    returnVars <- data.frame(c(.10, .12, .15),
                             c(.02, .07, .09),
                             c(.01, .04, .05))
    
    colnames(returnVars) <- c('stock', 'bond', 'saving')
    rownames(returnVars) <- c('low', 'mid', 'high')
    
    investmentMix <- data.frame(c(0,1,2,3,4,5,6,7,8,9,10),
                                c(0,0,0,0.05,0.2,0.35,0.4,0.55,0.7,0.85,1),
                                c(0,0.15,0.3,0.4,0.4,0.3,0.4,0.4,0.3,0.15,0),
                                c(1,0.85,0.7,0.55,0.4,0.35,0.2,0.05,0,0,0))
    
    names(investmentMix) <- c('Risk','Stock','Bond','Savings')
    
    
    dfTest <- data.frame(matrix(ncol = 3, nrow = 0))
    
    for (i in 1:30) {
        dfTest <- rbind(dfTest, (1+returnVars[2,])^i)
    }
    
    mixAmounts <- subset(investmentMix, Risk == riskInput)
    
    mixAmounts[,2:4]
})
    
      
output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    riskInput = input$riskInput
    
    currStart <- 10000
    
    returnVars <- data.frame(c(.10, .12, .15),
                             c(.02, .07, .09),
                             c(.01, .04, .05))
    
    colnames(returnVars) <- c('stock', 'bond', 'saving')
    rownames(returnVars) <- c('low', 'mid', 'high')
    
    investmentMix <- data.frame(c(0,1,2,3,4,5,6,7,8,9,10),
                                c(0,0,0,0.05,0.2,0.35,0.4,0.55,0.7,0.85,1),
                                c(0,0.15,0.3,0.4,0.4,0.3,0.4,0.4,0.3,0.15,0),
                                c(1,0.85,0.7,0.55,0.4,0.35,0.2,0.05,0,0,0))
    
    names(investmentMix) <- c('Risk','Stock','Bond','Savings')
    
    
    dfTest <- data.frame(matrix(ncol = 3, nrow = 0))
    
    for (i in 1:30) {
        dfTest <- rbind(dfTest, (1+returnVars[2,])^i)
    }
    
    mixAmounts <- subset(investmentMix, Risk == riskInput)
    
    mixAmounts <- currStart * mixAmounts[,2:4]
    histValues <- data.frame(mapply(`*`,dfTest,mixAmounts))
    
    histValues$total <- rowSums(histValues)
        
    plot(histValues$total, type = 'l', xlab = 'years', ylab = 'Investment Value', main = 'Investment Value over 30 Years')
    
    })

  
})
