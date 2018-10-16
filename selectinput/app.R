#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

   # Application title
   titlePanel("Old Faithful Geyser Data"),

   # Sidebar with a slider input for number of bins
   sidebarLayout(

        selectInput("selecty", label = h3("Select Y axis"),
                    choices = list("Rating", "Experience", "Genre")),


      # Show a plot of the generated distribution

        plotOutput("barplot")



)
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  barplottest <- reactive({
    if ( "Rating" %in% input$selecty) return(datasets2017())
    if ( "Experience" %in% input$selecty) return(database2015())
    if( "Genre" %in% input$selecty) return(database2015())
  })
  output$barplot <- renderPlot({
    dataplots = barplottest()
    print(dataplots)
  })

}

# Run the application
shinyApp(ui = ui, server = server)

