library(shiny)

shinyUI(
  fluidPage(
    tags$head(
      #Tell shiny what version of d3 we want
      tags$script(src='//d3js.org/d3.v4.min.js')
      ),
      #includeScript("d3.min.js")),
                  includeCSS('styles.css'),
                  mainPanel(uiOutput("chords"))
))