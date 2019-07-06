library(shiny)
shinyUI(fluidPage(
  titlePanel("Plot Random Numbers"),
  sidebarLayout(
    sidebarPanel(
      numericInput("numeric", "How Many Random Numbers Should be Used?", 
                   value = 1000, min = 1, max = 1000, step = 0.5),
      sliderInput("slider", "Pick Minimum and Maximum Values",
                   0.5, 100, value = c(25, 50)), 
      checkboxInput("show_xlab", "Show/Hide X Axis Label", value = TRUE),
      checkboxInput("show_facets", "By Sex", value = TRUE),
      checkboxInput("show_title", "Show/Hide Title")
    ),
    mainPanel(
      h3("Shiny Plot APP"),
      plotOutput("plot1")
    )
  )
))