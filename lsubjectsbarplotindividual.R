

(title = "Courses General View",
  selectInput("selecty", label = h3("Select Year"),
              choices = list("2017", "2016", "2015")),



{
  barplottest <- reactive({
    if ( "Optim" %in% input$selecty) return()
    if ( "Neteg" %in% input$selecty) return(database2016())
    if( "Wicom" %in% input$selecty) return(database2015())
    if ( "Sensors" %in% input$selecty) return(datasets2017())
    if ( "Entrep" %in% input$selecty) return(database2016())
    if( "Iot-IP" %in% input$selecty) return(database2015())
    if ( "Arasm" %in% input$selecty) return(datasets2017())
    if ( "5Gplan" %in% input$selecty) return(database2016())
    if( "Image" %in% input$selecty) return(database2015())
    if ( "Optical" %in% input$selecty) return(datasets2017())
    if ( "Bodysens" %in% input$selecty) return(database2016())
    if( "Netauth" %in% input$selecty) return(database2015())
    if ( "Big Data" %in% input$selecty) return(datasets2017())
    if ( "SDR" %in% input$selecty) return(database2016())
    if( "LowPow" %in% input$selecty) return(database2015())
    if ( "Business" %in% input$selecty) return(database2016())
    if( "Service" %in% input$selecty) return(database2015())
    if ( "Creativity" %in% input$selecty) return(datasets2017())
  })
  output$CoursesView <- renderPlot({
    dataplots = barplottest()
    print(dataplots)
  })
}

