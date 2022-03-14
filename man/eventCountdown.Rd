library(shiny)
library(shinyTaskscheduler)

# Define UI for application that draws a histogram
ui <- fluidPage(
applyshinySchedule(),
uiOutput('eventCountdown')

)

# Define server logic required to draw a histogram
server <- function(input, output,session) {

eventCountdown(event.starting_time  = '15:00:00',event.closing_time = '5:00:00',Note.Bfr.Event = 'The event starts soon',Note.During.Event = 'In progress|',add_expr.Bfr.Event = 'Hamjambo!. Tunaanza hivi kwa muda uliosalia',output = output,add_expr.During.Event  = fluidPage(
    actionButton('hi.click.on.me',label=tagList(f7Icon('ellipsis_vertical'),'high click on me'),fill = F)
  ),session = session)


}

# Run the application
shinyApp(ui = ui, server = server)

}
