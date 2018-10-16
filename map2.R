{
  output$StudentsMap2017 <- renderPlot({
    
    city <- StudentsPersonalData2017$Country
    cities = c(city)
    global <- map_data("world")
    ggplot() + geom_polygon(data = global, aes(x=long, y = lat, group = group)) +
      coord_fixed(1.3)
    
    gg1 <- ggplot() +
      geom_polygon(data = global, aes(x=long, y = lat, group = group), fill = "white", color = "grey") +
      coord_fixed(1.3)
    gg1
    
    latitude <-StudentsPersonalData2017$lat
    longtitude <-StudentsPersonalData2017$long
    coors <- data.frame(
      long = c(longtitude),
      lat = c(latitude),
      stringsAsFactors = FALSE
    )
    coors$cities <- cities
    gg1 +
      geom_point(data=coors, aes(long, lat), colour="red", size=1) +
      ggtitle("World Map") +
      geom_text_repel(data=coors, aes(long, lat, label=cities))
    
  })
}
