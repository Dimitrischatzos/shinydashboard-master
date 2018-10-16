library(leaflet)
library(rgdal)

    data6 = StudentsPersonalData2016
    long=StudentsPersonalData2016$long
    lat=StudentsPersonalData2016$lat

    ww6 <- StudentsPersonalData2016$Students
    label <- c(ww6)

    markers <- data.frame(long,lat,label)
    pal = colorFactor(palette = c("blue"), domain = data6$Country)
    
    # Aggregate method
    markers <- aggregate(label ~ lat + long, markers, paste, collapse = "<br/>")
    
    # Markers with all of the labels
    leaflet(data6) %>%
      addTiles() %>%
      addMarkers(lng = markers$long, lat = markers$lat,
                 popup=paste("Student:","<br/>",
                             markers$label))%>%
      addLegend(position = "bottomright", pal = pal, values = StudentsPersonalData2016$Country)

    
    data = StudentsPersonalData2017
    long=longtitude
    lat=latitude
    ww <- StudentsPersonalData2017$Students
    label <- c(ww)
    
    markers <- data.frame(latitude,longtitude,label)
    pal = colorFactor(palette = c("blue"), domain = data$Country)
    
    # Aggregate method
    markers <- aggregate(label ~ lat + long, markers, paste, collapse = "<br/>")
    
    # Markers with all of the labels
    leaflet(data) %>%
      addTiles() %>%
      addMarkers(lng=markers$long, lat= markers$lat,
                 popup=paste("Student:","<br/>",
                             markers$label))%>%
      addLegend(position = "bottomright", pal = pal, values = ~Country)
    
    