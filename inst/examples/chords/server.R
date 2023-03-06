library(shiny)

shinyServer(function(input, output, session) {
  output$chords <- renderUI({
    includeScript('chords.js')
  })
  
  # stop app if session is ended
  session$onSessionEnded(function() {
    stopApp()
    print(" Chords session is ended!")
  })
})