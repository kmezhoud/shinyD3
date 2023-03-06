library(shiny)

shinyServer(function(input, output, session) {
  output$chart <- renderUI({
    includeScript('force_network.js')
  })
  
  # stop app if session is ended
  session$onSessionEnded(function() {
    stopApp()
    print(" force network session is ended!")
  })
})