#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shinyD3)

# Define server logic required to draw a histogram
function(input, output, session) {

  #Lets look for changes in our vehicle class dropdown then crunch the data and serve it to D3
  observeEvent(input$vehicleClass, {
    
    #Use tidyverse to slice the data based on the drop down input
    dfMpg <- mpg |> 
      filter(class == input$vehicleClass) |> 
      group_by(manufacturer) |> 
      mutate(avgCity = mean(cty)) |> 
      select(manufacturer, avgCity) |> 
      unique() |> 
      rename(name = manufacturer, value = avgCity)
    
    #Convert the tibble to json
    jsonMpg <- toJSON(dfMpg, pretty=TRUE)
    
    #Send that json from the session to our javascript
    session$sendCustomMessage(type="jsondata",jsonMpg)
    
  }, ignoreNULL = FALSE,ignoreInit = FALSE)
  
  #This tells shiny to run our javascript file "script.js" and send it to the UI for rendering
  output$d3<- renderUI({
    HTML('<script type="text/javascript", src="script.js">  </script>')
  })
  
  
  # stop app if session is ended
  session$onSessionEnded(function() {
      stopApp()
      print(" Barpot session is ended!")
  })

}
