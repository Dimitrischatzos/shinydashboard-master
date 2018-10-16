#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(data.table)

# Define UI for application that draws a histogram
ui <- fluidPage(

  # Application title
  titlePanel("Old Faithful Geyser Data"),
  box(plotlyOutput("groupbar"))


)

# Define server logic required to draw a histogram
server <- function(input, output) {

  output$groupbar <- renderPlotly({


    Less2017 <- c(colos)
    Faill <- fail
    Passs <- pass

    data13 <- data.frame(Less2017, Faill, Passs)

    data.13 <- data.table::melt(data13, id.vars='Less2017')


    plo1 <- plot_ly(data.13, x = ~Less2017, y = ~value, type = 'bar',
                    name = ~variable, colors =c("royalblue3","red3")) %>%
      layout(title = "Lessons View",yaxis = list(title = 'Students'), xaxis = list(title = 'Lessons'),
             barmode = 'stack')







  })
}

# Run the application
shinyApp(ui = ui, server = server)
