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
   selectInput("selecty", label = h3("Select Course"),
               choices = list("Optim","Neteg","Wicom","Sensors","Entrep","Iot-IP", "Arasm","5Gplan",
                              "Image","Optical","Bodysens","Netauth","Big Data","SDR","LowPow",
                              "Business","Service","Creativity"
                              )),
   #selectInput( selectInput("Subjects", "Select Course:",
                           # choices = colnames(FailPassHeader))),


                # Create a spot for the barplot
                plotlyOutput("subjectploty")



)

# Define server logic required to draw a histogram
server <- function(input, output) {
    barplottest <- reactive({
      if ( "Optim" %in% input$selecty) return(failpassv1())
      if ( "Neteg" %in% input$selecty) return(failpassv2())
      if( "Wicom" %in% input$selecty) return(failpassv3())
      if ( "Sensors" %in% input$selecty) return(failpassv4())
      if ( "Entrep" %in% input$selecty) return(failpassv5())
      if( "Iot-IP" %in% input$selecty) return(failpassv6())
      if ( "Arasm" %in% input$selecty) return(failpassv7())
      if ( "5Gplan" %in% input$selecty) return(failpassv8())
      if( "Image" %in% input$selecty) return(failpassv9())
      if ( "Optical" %in% input$selecty) return(failpassv10())
      if ( "Bodysens" %in% input$selecty) return(failpassv11())
      if( "Netauth" %in% input$selecty) return(failpassv12())
      if ( "Big Data" %in% input$selecty) return(failpassv13())
      if ( "SDR" %in% input$selecty) return(failpassv14())
      if( "LowPow" %in% input$selecty) return(failpassv15())
      if ( "Business" %in% input$selecty) return(failpassv16())
      if( "Service" %in% input$selecty) return(failpassv17())
      if ( "Creativity" %in% input$selecty) return(failpassv18())
    })
    output$subjectploty <- renderPlotly({
      dataplots = barplottest()
      print(dataplots)
    })
}

# Run the application
shinyApp(ui = ui, server = server)

