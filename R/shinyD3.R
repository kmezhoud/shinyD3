#' Valid Examples
valid_examples <- c(
  "barplot"
)

#' Launch shinyD3 with default browser
#' @description Launch shinyD3 with default browser
#' @param example A  a valid string example of visualization
#' 
#' @return   a shiny app with D3 library launched in the web page
#' @usage shinyD3(example)
#'
#' @examples
#' if(interactive()){
#' shinyD3(example= "barplot")
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

shinyD3 <- function(example){
  if("shinyD3" %in% installed.packages()){
    if(!example %in% valid_examples){
      stop(
        "Please select a valid example, the valid examples are:\n",
        paste(valid_examples, collapse = ", "),
        call. = FALSE
      )
    }
    library(shinyD3)
    shiny::runApp(system.file("examples", example, package = "shinyD3"), launch.browser = TRUE, #https://stackoverflow.com/questions/50476097/running-shinyapp-in-docker-without-shiny-server
                  quiet = TRUE, host = '0.0.0.0', port = 3838)
  }else{
    stop("Install and load shinyD3 package before to run it.")
  }
}


