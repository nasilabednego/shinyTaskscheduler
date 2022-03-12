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
  if(lubridate::seconds_to_period(Sys.time())>lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), start)))){
    shinyjs::delay(as.numeric(lubridate::seconds(round(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())+1), start)))-lubridate::seconds_to_period(Sys.time())
    ))*1000),
    shinyjs::runjs( "function reload_page() { window.location.reload(); setTimeout(reload_page, 1000); } setTimeout(reload_page, 1000); "))}
  if(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), start)))>lubridate::seconds_to_period(Sys.time())){
    shinyjs::delay(as.numeric(lubridate::seconds(round(
      lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), start)))-lubridate::seconds_to_period(Sys.time())))*1000),
      shinyjs::runjs( "function reload_page() { window.location.reload(); setTimeout(reload_page, 1000); } setTimeout(reload_page, 1000); "))}

  if(lubridate::seconds_to_period(Sys.time())>lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), stop)))){
    shinyjs::delay(as.numeric(lubridate::seconds(round(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())+1), stop)))-lubridate::seconds_to_period(Sys.time())
    ))*1000),
    shinyjs::runjs( "function reload_page() { window.location.reload(); setTimeout(reload_page, 1000); } setTimeout(reload_page, 1000); "))}
  if(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), stop)))>lubridate::seconds_to_period(Sys.time())){
    shinyjs::delay(as.numeric(lubridate::seconds(round(
      lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), stop)))-lubridate::seconds_to_period(Sys.time())))*1000),
      shinyjs::runjs( "function reload_page() { window.location.reload(); setTimeout(reload_page, 1000); } setTimeout(reload_page, 1000); "))}
  eval(
    if(lubridate::seconds_to_period(Sys.time())>=lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), start))) &&
       lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), stop)))>=lubridate::seconds_to_period(Sys.time()))
    {expr}#else
    #if(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), time)))>lubridate::seconds_to_period(Sys.time())){
    # shinyjs::delay(as.numeric(lubridate::seconds(round(
    #  lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), time)))-lubridate::seconds_to_period(Sys.time())))*1000),
    #code)}
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


