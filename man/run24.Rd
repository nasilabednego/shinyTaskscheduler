\name{RunAtInterval.every24hr}
\alias{RunAtInterval.every24hr}
\title{Schedule Shiny app to run the code at your specified time interval every 24 hr}
\usage{

  RunAtInterval.every24hr(start='', stop='', expr)
}
\description{
  Enables shiny app to run the code every 24 hr between your time intervals.
  start and stop are times in the format 'hour:min:sec'
}
\examples{


  library(shiny)
  library(shinyTaskscheduler)

  # Define UI for application that draws a histogram
  ui <- fluidPage(
    applySchedule(),
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

    RunAtInterval.every24hr(start='12:00:00', stop='12:01:00',
                            output$distPlot <- renderPlot({

                              # generate bins based on input$bins from ui.R
                              x    <- faithful[, 2]
                              bins <- seq(min(x), max(x), length.out = input$bins + 1)

                              # draw the histogram with the specified number of bins
                              hist(x, breaks = bins, col = 'darkgray', border = 'white')
                            }))

  }

  # Run the application
  shinyApp(ui = ui, server = server)

}
