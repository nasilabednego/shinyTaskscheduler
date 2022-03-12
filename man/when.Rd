\name{runAtInterval.dates}
\alias{runAtInterval.dates}
\title{Enables shiny app to run the code at your specified future date interval}
\usage{

  runAtInterval.dates(startDate='', stopDate='')
}
\description{
  Enables shiny app to run the code once at your specified future date interval.
  startDate and stpDate should be in the format 'year_month_day'
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

    runAtInterval.dates(startDate='2022_03_11', stopDate='2022_03_13',
                        output$distPlotb <- renderPlot({
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


