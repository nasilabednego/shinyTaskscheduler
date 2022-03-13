# Hello, world!
#
# This is an example function named 'hello' 
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

applyshinySchedule<-function(){shinyjs::useShinyjs()}

reloadAt.every24hr <-function(time='') {

  if(lubridate::seconds_to_period(Sys.time())>lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), time)))){
    shinyjs::delay(as.numeric(lubridate::seconds(round(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())+1), time)))-lubridate::seconds_to_period(Sys.time())
    ))*1000),
    shinyjs::runjs( "function reload_page() { window.location.reload(); setTimeout(reload_page, 1000); } setTimeout(reload_page, 1000); "))}
  if(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), time)))>lubridate::seconds_to_period(Sys.time())){
    shinyjs::delay(as.numeric(lubridate::seconds(round(
      lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), time)))-lubridate::seconds_to_period(Sys.time())))*1000),
      shinyjs::runjs( "function reload_page() { window.location.reload(); setTimeout(reload_page, 1000); } setTimeout(reload_page, 1000); "))}

}





RunAtInterval.every24hr <-function(start,stop,expr) {
 if(as.numeric(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), start))))>as.numeric(lubridate::seconds_to_period(Sys.time()))){
    shinyjs::delay(as.numeric(lubridate::seconds(round(
      lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), start)))-lubridate::seconds_to_period(Sys.time())))*1000),
      shinyjs::runjs( "function reload_page() { window.location.reload(); setTimeout(reload_page, 1000); } setTimeout(reload_page, 1000); "))}


  if(as.numeric(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), stop))))>as.numeric(lubridate::seconds_to_period(Sys.time()))){
    shinyjs::delay(as.numeric(lubridate::seconds(round(
      lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), stop)))-lubridate::seconds_to_period(Sys.time())))*1000),
      shinyjs::runjs( "function reload_page() { window.location.reload(); setTimeout(reload_page, 1000); } setTimeout(reload_page, 1000); "))}

  if(as.numeric(lubridate::seconds_to_period(Sys.time()))<=as.numeric(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), '23:59:59'))))){
    shinyjs::delay(as.numeric(lubridate::seconds(round(
      lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), '23:59:59')))-lubridate::seconds_to_period(Sys.time())))*1000),
      shinyjs::runjs( "function reload_page() { window.location.reload(); setTimeout(reload_page, 1100); } setTimeout(reload_page, 1100); "))

  }
  eval(

    if(as.numeric(lubridate::seconds(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), start)))))<as.numeric(lubridate::seconds(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), stop)))))){
    if(as.numeric(lubridate::seconds_to_period(Sys.time()))>=as.numeric(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), start)))) &&
       as.numeric(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), stop))))>=as.numeric(lubridate::seconds_to_period(Sys.time())))
    {expr}#elseas.numeric(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), '23:59:59'))))
    #if(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), time)))>lubridate::seconds_to_period(Sys.time())){
    # shinyjs::delay(as.numeric(lubridate::seconds(round(
    #  lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), time)))-lubridate::seconds_to_period(Sys.time())))*1000),
    #code)}as.numeric(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), stop))))<as.numeric(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), start))))
    }
      else{
      if(as.numeric(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), stop))))<=as.numeric(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), start))))){

        if(as.numeric(lubridate::seconds_to_period(Sys.time()))>=as.numeric(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), start))))
           )
        {expr}else
          if(as.numeric(lubridate::seconds_to_period(Sys.time()))<=as.numeric(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), stop)))))
           {expr}
      }
    }
)
}


runAtInterval.dates <-function(startDate,stopDate,expr) {
  if(lubridate::seconds_to_period(Sys.Date())>=lubridate::seconds_to_period(as.POSIXct( paste0(startDate)))){
    shinyjs::delay(as.numeric(lubridate::seconds(round(
      lubridate::seconds_to_period(as.POSIXct(paste0(startDate)))-lubridate::seconds_to_period(Sys.Date())))*1000),
      shinyjs::runjs( "function reload_page() { window.location.reload(); setTimeout(reload_page, 1000); } setTimeout(reload_page, 1000); "))}
  if(lubridate::seconds_to_period(Sys.Date())>=lubridate::seconds_to_period(as.POSIXct( paste0(stopDate)))){
    shinyjs::delay(as.numeric(lubridate::seconds(round(
      lubridate::seconds_to_period(as.POSIXct(paste0(stopDate)))-lubridate::seconds_to_period(Sys.Date())))*1000),
      shinyjs::runjs( "function reload_page() { window.location.reload(); setTimeout(reload_page, 1000); } setTimeout(reload_page, 1000); "))}

  eval(
    if(lubridate::seconds_to_period(Sys.Date())>=lubridate::seconds_to_period(as.POSIXct( paste0(startDate))) &&
       lubridate::seconds_to_period(as.POSIXct( paste0(stopDate)))>=lubridate::seconds_to_period(Sys.Date())){
      expr

    }
  )}

countdown<-function(Time_To='', alert_message=''){

if(as.numeric(lubridate::seconds_to_period(Sys.time()))<=as.numeric(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), '23:59:59'))))){
  shinyjs::delay(as.numeric(lubridate::seconds(round(
    lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), '23:59:59')))-lubridate::seconds_to_period(Sys.time())))*1000),
    shinyjs::runjs( "function reload_page() { window.location.reload(); setTimeout(reload_page, 1100); } setTimeout(reload_page, 1100); "))

}
# Initialize the timer, Time_To seconds, not active.
timerh <- shiny::reactiveVal(
  if(lubridate::seconds_to_period(Sys.time())>lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), Time_To)))){
    round(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())+1), Time_To)))-lubridate::seconds_to_period(Sys.time()))
  }else

    round(
      lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), Time_To)))-lubridate::seconds_to_period(as.POSIXct(Sys.time())))
)


active <- shiny::reactiveVal(T)

# Output the time left.



# observer that invalidates every second. If timer is active, decrease by one.
shiny::observe({
  shiny::invalidateLater(1000, session)
  shiny::isolate({
    if(active())
    {
      timerh(timerh()-1)
      if(timerh()<1)
      {
        active(F)

        shiny::showModal(shiny::modalDialog(size = 'l',
                                title = "Message",
                                shiny::fluidPage(tags$b("Time Remaining: ", lubridate::seconds_to_period(timerh()))),
                                alert_message
          ))



      }
    }
  })
})

}

