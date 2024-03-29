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


eventCountdown <-function(event.starting_time='',event.closing_time='',input,output,session,Note.Bfr.Event='',Note.During.Event='',add_expr.Bfr.Event,add_expr.During.Event){
  
  if(all((as.numeric(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), event.starting_time))))>=as.numeric(lubridate::seconds_to_period(Sys.time()))))
     ){
    shinyjs::delay(as.numeric(lubridate::seconds(round(
      lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), event.starting_time)))-lubridate::seconds_to_period(Sys.time())))*1000),
      shinyjs::runjs( "function reload_page() { window.location.reload(); setTimeout(reload_page, 1000); } setTimeout(reload_page, 1000); "))}else
        if(all((as.numeric(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), event.starting_time))))<=as.numeric(lubridate::seconds_to_period(Sys.time()))),
               (as.numeric(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), event.closing_time))))>=as.numeric(lubridate::seconds_to_period(Sys.time())))
               )
        ){
          shinyjs::delay(as.numeric(lubridate::seconds(round(
            lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), event.closing_time)))-lubridate::seconds_to_period(Sys.time())))*1000),
            shinyjs::runjs( "function reload_page() { window.location.reload(); setTimeout(reload_page, 1000); } setTimeout(reload_page, 1000); "))}
  
  

  if(as.numeric(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), '23:59:59'))))>=as.numeric(lubridate::seconds_to_period(Sys.time()))){
    shinyjs::delay(as.numeric(lubridate::seconds(round(
      lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), '23:59:59')))-lubridate::seconds_to_period(Sys.time())))*1000),
      shinyjs::runjs( "function reload_page() { window.location.reload(); setTimeout(reload_page, 1000); } setTimeout(reload_page, 1000); "))}
  
  
  
  # Initialize the timer, Time_To seconds, not active.
  timerh <- shiny::reactiveVal(
    
    if(lubridate::seconds_to_period(Sys.time())<=lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), '23:59:59'))) &&
       lubridate::seconds_to_period(Sys.time())>lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), event.closing_time)))){
      round(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())+1), event.starting_time)))-lubridate::seconds_to_period(Sys.time()))
    }else
      if(lubridate::seconds_to_period(Sys.time())>=lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), event.starting_time))) &&
         lubridate::seconds_to_period(Sys.time())<=lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), event.closing_time)))){
        round(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), event.closing_time)))-lubridate::seconds_to_period(Sys.time()))
      }else
        if(as.numeric(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), event.closing_time))))<=as.numeric(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), event.starting_time))))){
          
          if(as.numeric(lubridate::seconds_to_period(Sys.time()))>=as.numeric(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), event.starting_time))))
          )
          {round(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())+1), event.closing_time)))-lubridate::seconds_to_period(Sys.time()))
          }else
            if(as.numeric(lubridate::seconds_to_period(Sys.time()))<=as.numeric(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), event.closing_time)))))
            {round(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), event.closing_time)))-lubridate::seconds_to_period(Sys.time()))}
        }
    else
      
      round(
        lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), event.starting_time)))-lubridate::seconds_to_period(as.POSIXct(Sys.time())))
  )
  
  
  active <- shiny::reactiveVal(T)
  
  # Output the time left.
  
  shiny::observeEvent(input$stng,{
    shiny::showModal(shiny::modalDialog(title='settings'))
  })
  
  # observer that invalidates every second. If timer is active, decrease by one.
  shiny::observe({
    shiny::invalidateLater(1000, session)
    shiny::isolate({
      if(active())
      {
        timerh(timerh()-1)
        if(timerh()>1)
        {
          active(T)
          output$eventCountdown<-renderUI({
            
            if(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), event.closing_time)))>lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), event.starting_time)))){
              if(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), event.starting_time)))>lubridate::seconds_to_period(as.POSIXct(Sys.time()))){
                
                shiny::fluidPage(tags$b(shinyWidgets::actionBttn('stng','settings',shiny::icon('cog'),color='pri',style='str'),Note.During.Event, lubridate::seconds_to_period(timerh())),hr(),
                                 
                                 add_expr.During.Event)}else
                                   if(lubridate::seconds_to_period(as.POSIXct(paste( paste0( lubridate::year(Sys.time()),'-',lubridate::month(Sys.time()),'-',lubridate::day(Sys.time())), event.closing_time)))>lubridate::seconds_to_period(as.POSIXct(Sys.time()))){
                                     shiny::fluidPage(tags$b(shinyWidgets::actionBttn('stng','settings',shiny::icon('cog'),color='pri',style='str'),Note.During.Event, lubridate::seconds_to_period(timerh())),hr(),
                                                      
                                                      add_expr.During.Event)
                                   }
              
            }
            
            
          })
          
          
        }else
          if(timerh()<1)
          {
            active(F)}
      }
    })
  })
  
}
    
TimeOutput<-function(){
  
  fluidPage(uiOutput('div'),
            f7Align(side='l',
                    uiOutput('stng')),
            f7Align(side='r',
                    uiOutput('time')))
}


Time<-function(input,output, session){ timer<-reactiveVal(
  Sys.time())

vl<-reactiveVal(0)
output$stng<-renderUI({
  
  actionBttn('stng','settings',icon = icon('cog'),style = 'str',color = 's')
  
  
})

observeEvent(input$tstng,{toggle('stng')})
output$div<-renderUI({
  
  req(input$stng)
  fluidPage(
    showModal(modalDialog(title = 'settings',#plotOutput('uird'),
                          splitLayout(fluidPage(useShinyjs(),
                                                checkboxInput('boldtxt','bold',value = F),
                                                actionBttn('tstng','toggle settings',icon = icon('cog'),style = 'str',color = 's')),
                                      fluidPage(
                                        textInput('color','type your color'),
                                        selectInput('stl','style',choices = c('normal','italic','samp')),br(),br(),br(),
                                        br()
                                      )),
                          
                          sliderInput("inpu",
                                      "Adjust:",
                                      min = 30,
                                      max = 1000,
                                      value = 100)
                          
    )))
}) 



observeEvent(input$stng,{
  output$time<-renderUI({
    if(input$stl=='italic'){
      if(input$boldtxt==T){
        fluidRow(
          div(style=paste0('font-size:',input$inpu,'%'),fluidPage(
            tags$b(tags$i('Time:',
                          timer()))
            
          ))
        )}else{
          fluidRow(
            div(style=paste0('font-size:',input$inpu,'%'),fluidPage(
              tags$i('Time:',
                     timer())
              
            ))
          )
        }
      
      
    }else
      if(input$stl=='italic'){
        if(input$boldtxt==T){
          fluidRow(
            div(style=paste0('font-size:',input$inpu,'%'),fluidPage(
              tags$b(tags$samp('Time',
                               timer()))
              
            ))
          )}else{
            fluidRow(
              div(style=paste0('font-size:',input$inpu,'%'),fluidPage(
                tags$samp('Time',
                          timer())
                
              ))
            )
          }
        
        
      }
    
    
    
    else{
      if(input$boldtxt==T){
        fluidRow(
          div(style=paste0('font-size:',input$inpu,'%'),fluidPage(
            tags$b('Time:',
                   timer())
            
          ))
        )}else{
          fluidRow(
            div(style=paste0('font-size:',input$inpu,'%'),fluidPage(
              'Time:',
              timer()
              
            ))
          )
        }}
  })
})

output$time<-renderUI({fluidRow(
  
  div(style=paste0('font-size:',input$inpu,'%'),fluidPage(
    
    timer()
  ))
)
})


observe({
  invalidateLater(1000,session)
  isolate({
    timer(timer()+1)})
  
  
})}    
    
    

