\name{countdown}
\alias{countdown}
\title{Show event countdown}
\usage{
countdown(Time_To, alert_message='')
}
\description{
Show event countdown alert. TimeTo should be in the format 'hour:min:sec'
}
\examples{
library(shiny)
library(shinyTaskscheduler)


ui <- fluidPage(
applyshinySchedule()

)


server <- function(input, output,session) {

countdown(Time_To='5:00:00', alert_message='')


}

# Run the application
shinyApp(ui = ui, server = server)

}
