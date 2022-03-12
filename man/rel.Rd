\name{reloadAt.every24hr}
\alias{reloadAt.every24hr}
\title{Schedule Shiny app to reload page at your specified time every 24 hr}
\usage{
# run this in your shiny app serverR
reloadAt.every24hr(time='')
}
\description{
Enables shiny app to refresh page every 24 hr at the time you specified.
time should be in the format 'hour:min:sec'
}
\examples{

library(shiny)
library(shinyTaskscheduler)

# Define UI for application that draws a histogram
ui <- fluidPage(
applyshinySchedulexpr(),
    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output,session) {
reloadAt.every24hr(time='17:00:00')

    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })

}

# Run the application
shinyApp(ui = ui, server = server)

}
