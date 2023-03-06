library(shiny)

shinyUI(
  fluidPage(
    tags$head(
      #Tell shiny what version of d3 we want
      tags$script(src='//d3js.org/d3.v3.min.js')
      ),
      #includeScript("d3.min.js")),
                  includeCSS('style.css'),
                  mainPanel(uiOutput("chart"))
))