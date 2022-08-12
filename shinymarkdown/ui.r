library("markdown")
library("rmarkdown")
library("shiny")
library("shinydashboard")
libraru("httr")

fluidPage(
    includeMarkdown("mtcars_plot.Rmd")
)