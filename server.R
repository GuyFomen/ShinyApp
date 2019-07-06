library(shiny)
library(ggplot2)
shinyServer(function(input, output) {
  output$plot1 <- renderPlot({
    set.seed(20190706)
    number_of_points <- input$numeric
    min <- input$slider[1]
    max <- input$slider[2]
    data <- rnorm(number_of_points, min, max)
    SexData <- sample(c("F","M"),length(data),T)
    df <- data.frame(x=data,sex=SexData)
    xlab <- ifelse(input$show_xlab, "Height", "")
    mainlab <- ifelse(input$show_title, "Distribution of height In a Random Population", "")
    x <- NULL
    g <- ggplot(data=df, aes(x=data, color=sex, xlab=xlab)) +geom_histogram(fill="lightblue")
    if(x <- input$show_facets){
    g+labs(x=xlab)+ggtitle(mainlab)+facet_grid(~sex)
      }
    else
           g+labs(x=xlab)+ggtitle(mainlab)
   
    })
})