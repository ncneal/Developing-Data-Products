library('shiny')
shinyUI(
    pageWithSidebar(
        headerPanel("Example Plot"),
        mainPanel(
            plotOutput('newHist')
        ),
        sidebarPanel(
            h3("Inputs"),
            sliderInput('mu', 'Guess at the mean', value = 70, min = 62, max = 74, step = 0.05)
        )
    )
)