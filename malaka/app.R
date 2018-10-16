#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define UI for application that draws a histogram
ui <- fluidPage(

  # Application title
  titlePanel("Old Faithful Geyser Data"),
  plotlyOutput("distPlot")
)




# Define server logic required to draw a histogram
server <- function(input, output) {

  output$distPlot <- renderPlotly({

    mimis <- (data <- data.frame(colos, fail, pass)
            (plot_ly(data, x = ~colos, y = ~fail, type = 'bar', name = 'fail') %>%
                add_trace(y = ~pass, name = 'pass') %>%
                layout(yaxis = list(title = 'Count'), barmode = 'stack')))


    data <- data.frame(colos, mimis, Avarage)

    plot_ly(data, x = ~colos, y = ~mimis, type = 'bar', name = 'fail') %>%
      add_trace(y = ~Avarage, name = 'pass') %>%
      layout(yaxis = list(title = 'Count'), barmode = 'group')

  })
}

# Run the application
shinyApp(ui = ui, server = server)

