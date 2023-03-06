#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


# Define UI for application that draws a histogram
fluidPage(

  #Bring in the style sheet from the www folder
  tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "style.css")),
  
  #Tell shiny what version of d3 we want
  tags$script(src='//d3js.org/d3.v3.min.js'),
  
    # Application title
    titlePanel("D3 barplot Example"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
          
          #Dropdown list with the vehicle classes  
          selectInput(inputId = "vehicleClass",
                      label = 'Select a Vehicle Class',
                      choices = c('','compact', 'midsize', 'suv', '2seater', 'minivan', 'pickup', 'subcompact'),
                      selected = ''
          )
        ),

        # Show a plot of the generated distribution
        mainPanel(
          #The d3 graph
          uiOutput("d3")

        )
    )
)
