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
     colos
     fail
     pass

     data <- data.frame(colos, fail, pass)

     p<- (plot_ly(data, x = ~colos, y = ~fail, type = 'bar',
                  text = fail, textposition = 'auto',
                  marker = list(color = 'red',line = list(color = 'darkred',width = 3)),
                  name = 'fail') %>%
       add_trace(y = ~pass, name = 'pass',
                 text = pass, textposition = 'auto',
                 marker = list(color= 'blue',line = list(color = 'darkblue',width = 3))) %>%
       layout(yaxis = list(title = 'Count'), barmode = 'stack'))

   })
}

# Run the application
shinyApp(ui = ui, server = server)

