#' Launch shinyD3 with default browser
#' @description Launch shinyD3 with default browser
#' @return   a shiny app launched in the web/mobile page
#' @usage shinyD3()
#'
#' @examples
#' if(interactive()){
#' shinyD3()
#' }
#'
#' @name shinyD3
#' @docType package
#' @import shiny
#' @import tidyverse
#' @importFrom utils installed.packages
#' @rawNamespace import(DT, except= c(dataTableOutput, renderDataTable))
#' @rawNamespace import(jsonlite, except= c(validate))
#' @export

shinyD3 <- function(){
  if("shinyD3" %in% installed.packages()){
    library(shinyD3)
    shiny::runApp(system.file("shinyD3", package = "shinyD3"), launch.browser = TRUE, #https://stackoverflow.com/questions/50476097/running-shinyapp-in-docker-without-shiny-server
                  quiet = TRUE, host = '0.0.0.0', port = 3838)
  }else{
    stop("Install and load shinyD3 package before to run it.")
  }
}