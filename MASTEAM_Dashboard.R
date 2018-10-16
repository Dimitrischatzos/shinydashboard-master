## app.R ##
library(shiny)
library(shinydashboard)
library(readxl)
library(dplyr)
library(wordcloud)
library(data.table)
library(ngram)
library(RColorBrewer)
library(tuple)
library(shinyWidgets)
library(ggplot2)
library(DT)
library(editData)
library(memisc)
library(eeptools)
library(ECharts2Shiny)
library(plotly)
library(lattice)
library(plotrix)
library(ggmap)
library(maps)
library(mapdata)
library(rworldmap)
library(ggrepel)
library(rgdal)
library(leaflet)
library(reshape2)



Enrollment <- read.csv("Enrollment.csv",TRUE, na.strings = T, sep = ",")
#InfoStudents <- read.csv("Students.csv",TRUE, na.strings = T, sep = ",", row.names = 1)
Students <- read.csv("StudentsInfo.csv",TRUE, na.strings = T, sep = ",")
graduatedStudents <- rbind(StudentsGrades2017, StudentsGrades2016, StudentsGrades2015)
#View(graduatedStudents)
Studentsinformations <- rbind(StudentsPersonalData2015, StudentsPersonalData2016, StudentsPersonalData2017)
#View(Studentsinformations)

ui <- dashboardPage(title="Masteam Dashboard",
  dashboardHeader(title = "UPC-MASTEAM",titleWidth = 350, tags$li(class = "dropdown",
                                                                  tags$h4("Made By:",
                                                                          "Dimitrios Chatzos", " "))),
  dashboardSidebar(
    ## Sidebar content
    dashboardSidebar(
      sidebarMenu(
        sidebarSearchForm(textId = "searchText", buttonId = "searchButton",
                          label = "Search..."),
        menuItem("MASTEAM View", tabName = "dashboard", icon = icon("dashboard")),
        menuItem("Students View", tabName = "tab1", icon = icon("address-card")),
        menuItem("Courses View", tabName = "Tab2", icon = icon("book"))
      )
    )
  ),
  dashboardBody(

    tabItems(
      #################### First tab content
      tabItem(tabName = "dashboard",
              fluidPage(
                tabsetPanel(
                  #title = "MASTEAM VIEW",
                  #id = "tabset1",  height = "400px", side = "left", width = "400px",

                  tabPanel(title = "Enrolment View",
                           fluidRow(column(width = 12),
                                    # Dynamic valueBoxes
                                    box(
                                    valueBoxOutput("Applications", width = 6),
                                    valueBoxOutput("Accepted", width = 6)),
                                    #valueBoxOutput("Rejected", width = 3),
                                    box(
                                    valueBoxOutput("Enrolled", width = 6),
                                    valueBoxOutput("Graduations", width = 6))),

                           fluidRow(
                             #box(title = "Students Gender",
                             box(
                             valueBoxOutput("Female", width = 6 ),
                             valueBoxOutput("Male", width = 6 )),
                             #box(title = "Students Nationality",
                             box(
                             valueBoxOutput("EU", width = 6 ),
                             valueBoxOutput("NONEU", width = 6 ))
                           ),
                           fluidRow(
                             box(plotOutput("GenderPie", height = 350)),
                             box(plotOutput("NationalityPie", height = 350))
                           )
                  ),
                  tabPanel(title = "Enrolment per Year",
                           fluidRow(
                             box(plotlyOutput("Enrolmentplot"),width = 12)
                           ),
                           fluidRow(
                             box(plotlyOutput("GenderBarplot")),
                             box(plotlyOutput("NationalityBarplot"))
                           )
                  )
                )
              )
      ),
      #########################
      # Second tab content
      tabItem(tabName = "tab1",
              fluidPage(
                tabsetPanel(
                 # title = "Students Data",
                  #id = "tabset1",  height = "600px", side = "left", width = "726px",

                  tabPanel("Students Grades",
                           tabBox(title = "Students Grades",
                                  id = "tabset1",  height = "600px", side = "left", width = "726px",
                           tabPanel(title = "2017",
                                    plotlyOutput("StudentsView2017")),
                           tabPanel(title = "2016",
                                    plotlyOutput("StudentsView2016")),
                           tabPanel(title = "2015",
                           plotlyOutput("StudentsView2015"))
                          )),
                  tabPanel("Geografical Map",
                           tabBox(title = "Students Geografical Region",
                                  id = "tabset1",  height = "600px", side = "left", width = "726px",
                                  tabPanel(title = "2017",
                                           leafletOutput("StudentsMap2017")),
                                  tabPanel(title = "2016",
                                           leafletOutput("StudentsMap2016")
                                           ),
                                  tabPanel(title = "2015",
                                           leafletOutput("StudentsMap2015")
                                  )
                           )),

                  tabPanel("Students Info",
                           tabBox(title = "Students Personal Info",
                                  id = "tabset1",  height = "600px", side = "left", width = "726px",
                           tabPanel(title = "2017",
                                    DT::dataTableOutput("Studentstable2017")),
                           tabPanel(title = "2016",
                                    DT::dataTableOutput("Studentstable2016")),
                           tabPanel(title = "2015",
                                    DT::dataTableOutput("Studentstable2015"))
                           )),

                  tabPanel("Students Grades Info",
                           tabBox(title = "Students Personal Info",
                                  id = "tabset2",  height = "600px", side = "left", width = "726px",
                           tabPanel(title = "2017",
                                    DT::dataTableOutput("Gradestable2017")),
                           tabPanel(title = "2016",
                                    DT::dataTableOutput("Gradestable2016")),
                           tabPanel(title = "2015",
                                    DT::dataTableOutput("Gradestable2015"))
                           ))

                 # tabPanel("Summary", verbatimTextOutput("Sum"))

                )
              )
      ),

      ###################### Third tab content
      tabItem(tabName = "Tab2",
              fluidPage(
                tabsetPanel(
                  #title = "Subjects Info",
                  # The id lets us use input$tabset1 on the server to find the current tab
                  #id = "tabset1",  height = "600px", side = "left", width = "726px",

                  tabPanel("Courses per Year View",
                      tabBox(title = "Courses View",
                                  id = "tabset2",  height = "600px", side = "left", width = "726px",
                            tabPanel(title = "Cources Students Per Year",
                              selectInput("Cources", "Year:",choices=colnames(Lessons),
                                Lessons <- read.csv("Cources - Sheet1.csv",TRUE, na.strings = T,
                                                    sep = ",", row.names = 1)),
                                plotOutput("lessonsplot"), width = 12),
                            tabPanel(title = "Courses Info",
                                     selectInput("selecty", label = h3("Select Year"),
                                                 choices = list("2017", "2016", "2015")),
                                     plotOutput("CoursesView"))
                           # tabPanel(title = "Courses 2017",
                           #          plotOutput("courses2017")),
                          #  tabPanel(title = "Courses 2016",
                                #     plotOutput("courses2016")),
                          #  tabPanel(title = "Courses 2015",
                           #          plotOutput("courses2015"))
                  )),
                  tabPanel("Courses Individual info",
                    tabBox(title = "Courses View",
                           id = "tabset2",  height = "600px", side = "left", width = "726px",

                           tabPanel(
                    title = "Number of Students per Course",
                    selectInput("Subjects", "Select Course:",
                                choices = colnames(lessons),
                                lessons <- read.csv("Cources&Years.csv",TRUE, na.strings = T, sep = ",", row.names = 1)),
                    hr(),
                    helpText("Number of Students Per Course and Per Year"),
                    plotOutput("subjectplot")),

                    tabPanel(title = "Fail/Pass and Grades per Course",
                             fluidRow(
                               box(
                             selectInput("select", label = h3("Select Course"),
                                         choices = list("Optim","Neteg","Wicom","Sensors","Entrep","Iot-IP", "Arasm","5Gplan",
                                                        "Image","Optical","Bodysens","Netauth","Big Data","SDR","LowPow",
                                                        "Business","Service","Creativity"
                                         )),
                             plotlyOutput("Coursesplotly")),
                             box(
                                 selectInput("selectivep", label = h3("Select Course"),
                                             choices = list("Optim","Neteg","Wicom","Sensors","Entrep","Iot-IP", "Arasm","5Gplan",
                                                            "Image","Optical","Bodysens","Netauth","Big Data","SDR","LowPow",
                                                            "Business","Service","Creativity")),
                                 plotlyOutput("CoursesGrades")

                             )
                    ))
                  )),
                  tabPanel("Courses Students & Grades Info",
                    tabBox(title = "Courses View",
                                  id = "tabset5",  height = "600px", side = "left", width = "726px",

                  tabPanel(title = "Courses2017",
                           DT::dataTableOutput("SubjectTables")),
                  tabPanel(title = "Courses2016",
                           DT::dataTableOutput("SubjectTables2016")),
                  tabPanel(title = "Courses2015",
                           DT::dataTableOutput("SubjectTables2015"))

                  #tabPanel("Summary of Courses", verbatimTextOutput("SubjectSum"))
                  ))

                )
              )
      )
    )
  )
)

server <- function(input, output, session)
{
  #######Applications Letters
  output$Applications <- renderValueBox({
    valueBox(
      sum(Enrollment$Applications),
      paste("Applications"),
      #subtitle = "Applications",
      icon = icon("envelope"),
      #icon = icon("list"),
      color = "blue"
    )
  })
  ######Accepted Letters
  output$Accepted <- renderValueBox({
    valueBox(
      sum(Enrollment$Accepted),
      paste("Accepted Applications"),
      icon = icon("thumbs-up"),
      color = "blue"
    )
  })
  ######Graduated students
  output$Graduations <- renderValueBox({
    valueBox(
      paste(round(percent(graduatedStudents$M.Thesis>4.99)), "%", sep = ""),
      paste("Graduated Students"),
      icon = icon("education", lib = "glyphicon" ),
      color = "olive"
    )
  })
  ######Rejected Letters
  output$Rejected <- renderValueBox({
    valueBox(
      sum(Enrollment$Rejected),
      paste("Rejected Letters"),
      icon = icon("thumbs-down"),  #icon = icon("thumbs-up"), lib = "glyphic on"),
      color = "red"
    )
  })
  ######Students Enrolled
  output$Enrolled <- renderValueBox({
    valueBox(
      sum(Enrollment$Students.Enrolled),
      paste("Enrolled Students"),
      icon = icon("check"),
      color = "aqua"
    )
  })
  ##########Number of Female students box
  output$Female <- renderValueBox({
    valueBox(
      length(grep("Female", Studentsinformations$Gender)),
      paste("Female students"),
      icon = icon("female"),
      color = "maroon"
    )
  })
  ######## Number of Male students box
  output$Male <- renderValueBox({
    valueBox(
      length(grep("Male", Studentsinformations$Gender)),
      paste("Male students"),
      icon = icon("male"),
      color = "aqua"
    )
  })
  ######## Number of EU students
  output$EU <- renderValueBox({
    valueBox(
      length(grep("\\bEU\\b", Studentsinformations$Nationality)),
      paste("EU students"),
      icon = icon("globe"),
      color = "blue"
    )
  })
  ####### Number of NONEU students
  output$NONEU <- renderValueBox({
    valueBox(
      length(grep("NONEU", Studentsinformations$Nationality)),
      paste("NONEU students"),
      icon = icon("globe"),
      color = "maroon"
    )
  })
  #########Gender Pie Chart percentage
  {
    output$GenderPie <- renderPlot({

      TotalMale <- length(grep("Male", Studentsinformations$Gender))
      TotalFemale <- length(grep("Female", Studentsinformations$Gender))

      Datagender <- c(FF, MM)
      pie <- c("Female", "Male")
      pct <- round(Datagender/sum(Datagender)*100)
      lbls <- paste(labels, pct) # add percents to labels
      lbls <- paste(lbls,"%",sep="") # ad % to labels
      pie3D(Datagender, labels = lbls, col=c("maroon1", "steelblue"),explode = 0.1,main="MASTEAM Gender Percentage %")
      legend("topright", c("Female", "Male"), cex=1, fill=c("maroon1","steelblue"))
    })
  }
  #########Nationality Pie Chart percentage
  {
    output$NationalityPie <- renderPlot({

      EE <- length(grep("\\bEU\\b", Studentsinformations$Nationality))
      NN <- length(grep("NONEU", Studentsinformations$Nationality))

      x2 <- c(EE, NN)
      labels <- c("EU", "NONEU")
      pct <- round(x2/sum(x2)*100)
      lbls <- paste(labels, pct) # add percents to labels
      lbls <- paste(lbls,"%",sep="") # ad % to labels
      pie3D(x2, labels = lbls, col=c("royalblue3", "firebrick2"), explode = 0.1,main="MASTEAM Nationality Percentage %")
      legend("topright", c("EU", "NONEU"), cex=1, fill=c("royalblue3","red3"))
    })
  }

  ######### Stacked Barplot with the Enrolment
  {
    output$Enrolmentplot <- renderPlotly({

      x <- data.frame(Enrollment )
      mx <- melt(x, id.vars=1:1)

      ggplot(mx, aes(x=Enrolment, y=value, fill=variable,label= value)) +
        geom_bar(stat="identity",color="black" ) +
        theme_classic() +
        geom_text(size = 5, position = position_stack(vjust = 0.5))+
        labs(title="Enrolment Informations Per Year")

    })
  }
  ########Group Bar plot with The Gender per year
  {
    output$GenderBarplot <- renderPlotly({

      Male2015 <- length(grep("Male", StudentsPersonalData2015$Gender))
      Female2015 <- length(grep("Female", StudentsPersonalData2015$Gender))
      #
      Male2016 <- length(grep("Male", StudentsPersonalData2016$Gender))
      Female2016 <- length(grep("Female", StudentsPersonalData2016$Gender))
      #
      Male2017 <- length(grep("Male", StudentsPersonalData2017$Gender))
      Female2017 <- length(grep("Female", StudentsPersonalData2017$Gender))
      #Barplot
      Years1 <- c("2015", "2016", "2017")
      Male <- c(Male2015, Male2016, Male2017)
      Female <- c(Female2015, Female2016, Female2017)
      data <- data.frame(Years1, Male, Female)

      p <- plot_ly(data, x = ~Years1, y = ~Male, type = 'bar',
                   name = 'Male', text = Male, textposition = 'auto') %>%
        add_trace(y = ~Female, name = 'Female', text = Female, textposition = 'auto', marker = list(color = c("violet"))) %>%
        layout(title="Students Gender",
               yaxis = list(title = 'Students'),
               barmode = 'group')
    })
  }
  #####Group Bar Plot Nationality Per year
  {
    output$NationalityBarplot <- renderPlotly({

      EU2015 <- length(grep("\\bEU\\b", StudentsPersonalData2015$Nationality))
      NonEU2015 <- length(grep("NONEU", StudentsPersonalData2015$Nationality))
      #
      EU2016 <- length(grep("\\bEU\\b", StudentsPersonalData2016$Nationality))
      NONEU2016 <- length(grep("NONEU", StudentsPersonalData2016$Nationality))
      #
      EU2017 <- length(grep("\\bEU\\b", StudentsPersonalData2017$Nationality))
      NONEU2017 <- length(grep("NONEU", StudentsPersonalData2017$Nationality))

      #Barplot
      Years2 <- c('2015', '2016', '2017')
      EUstudents <- c(EU2015, EU2016, EU2017)
      NONEUstudents <- c(NonEU2015, NONEU2016, NONEU2017)
      data <- data.frame(Years2, EUstudents, NONEUstudents)

      p <- plot_ly(data, x = ~EUstudents, y = ~Years2, type = 'bar', orientation = 'h', name = 'EU',
                   text = EUstudents, textposition = 'auto',
                   marker = list(line = list(color = 'blue',width = 3))) %>%
        add_trace(x = ~NONEUstudents, name = 'NONEU', text = NONEUstudents, textposition = 'auto',
                  marker = list(color = 'red',line = list(color = 'darkred',width = 3))) %>%
        layout(title = "Students Nationality",
               barmode = 'stack',
               xaxis = list(title = "Students"),
               yaxis = list(title ="Years"))
    })
  }
##########End Of The First Tab MASTEAM view Dashboard###############################################
####################################################################################################


                                    #### Second SiderTab 2

################Box plot with the students Grades
  #####2017
  {
    output$StudentsView2017 <- renderPlotly({

      dat <- data.frame(StudentsGrades2017)
      dat.m <- melt(dat,id.vars='Students')

      ggplot(dat.m, aes(x = Students, y = value)) +
        geom_boxplot(fill= "#56B4E9", color="black", na.rm = TRUE)+
        theme(axis.text.x = element_text(angle = 60))+
        stat_summary(fun.y=mean, geom="point", shape=5, size=4)
      #coord_flip()
      #geom_text(data = dat.m, aes(label = value),position = position_dodge(width=0.5))

    })
  }
  #####2016
  {
    output$StudentsView2016 <- renderPlotly({

      dat <- data.frame(StudentsGrades2016)
      dat.m <- melt(dat,id.vars='Students')

      ggplot(dat.m, aes(x = Students, y = value)) +
        geom_boxplot(fill= "#56B4E9", color="black", na.rm = TRUE)+
        theme(axis.text.x = element_text(angle = 60))+
        stat_summary(fun.y=mean, geom="point", shape=5, size=4)
      #coord_flip()
      #geom_text(data = dat.m, aes(label = value),position = position_dodge(width=0.5))

    })
  }
  #####2015
  {
    output$StudentsView2015 <- renderPlotly({

      dat <- data.frame(StudentsGrades2015)
      dat.m <- melt(dat,id.vars='Students')

      ggplot(dat.m, aes(x = Students, y = value)) +
        geom_boxplot(fill= "#56B4E9", color="black", na.rm = TRUE)+
        theme(axis.text.x = element_text(angle = 60))+
        stat_summary(fun.y=mean, geom="point", shape=5, size=4)
        #coord_flip()
        #geom_text(data = dat.m, aes(label = value),position = position_dodge(width=0.5))

    })
  }
###################Students Map 2017

  {
    output$StudentsMap2017 <- renderLeaflet({
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

    })
  }
########## Map 2016
  {
    output$StudentsMap2016 <- renderLeaflet({
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
        addMarkers(lng=markers$long, lat= markers$lat,
                   popup=paste("Student:","<br/>",
                               markers$label))%>%
        addLegend(position = "bottomright", pal = pal, values = StudentsPersonalData2016$Country)

    })
  }
  ########## Map 2015
  {
    output$StudentsMap2015 <- renderLeaflet({
      data5 = StudentsPersonalData2015

      long=StudentsPersonalData2015$long
      lat=StudentsPersonalData2015$lat

      ww5 <- StudentsPersonalData2015$Students
      label <- c(ww5)

      markers <- data.frame(long,lat,label)
      pal = colorFactor(palette = c("blue"), domain = data5$Country)

      # Aggregate method
      markers <- aggregate(label ~ lat + long, markers, paste, collapse = "<br/>")

      # Markers with all of the labels
      leaflet(data5) %>%
        addTiles() %>%
        addMarkers(lng=markers$long, lat= markers$lat,
                   popup=paste("Student:","<br/>",
                               markers$label))%>%
        addLegend(position = "bottomright", pal = pal, values = StudentsPersonalData2015$Country)

    })
  }
######Output Students Personal info Datatable
  ###2017
  {
    output$Studentstable2017 = DT::renderDataTable(
      StudentsPersonalData2017,
      editable =T
    )
  }
  ###2016
  {
    output$Studentstable2016 = DT::renderDataTable(
      StudentsPersonalData2016,
      editable =T
    )
  }
  ###2015
  {
    output$Studentstable2015 = DT::renderDataTable(
      StudentsPersonalData2015,
      editable =T
    )
  }
######Studets Grades datatable
  ###2017
  {
    output$Gradestable2017 = DT::renderDataTable(
      StudentsGrades2017,
      options = list(scrollX = TRUE),
      editable = T
    )
  }
  ###2016
  {
    output$Gradestable2016 = DT::renderDataTable(
      StudentsGrades2016,
      options = list(scrollX = TRUE),
      editable = T
    )
  }
  ###2015
  {
    output$Gradestable2015 = DT::renderDataTable(
      StudentsGrades2015,
      options = list(scrollX = TRUE),
      editable = T
    )
  }
#######Students Grades Summary
  {
    output$Sum <- renderPrint({
      data.frame(Nmae=StudentsGrades2017[,1], AvarageGrade=rowMeans(StudentsGrades2017[,-1], na.rm = TRUE)
                 )
    })
  }

  ##### Third SiderTab 3
  ######Output for Subjects Sider Tab
  {
    #### Barplote for the Students per course
    output$lessonsplot <- renderPlot({ mybar <-

      # Render a barplot
      barplot(Lessons[, input$Cources],
              names.arg = row.names(Lessons),
              main= "Bar Plot With the Number of Students per Year",
              ylab="Number of Students",
              xlab = "",
              col = "steelblue2", #rainbow(18),
              horiz = FALSE,
              ylim = c(0, 25),
              border = T,
              las = 2, cex.axis=1.5, cex.names= 1.2, cex.lab = 1.5, xpd = NA
      )
    x<- as.matrix(mybar)
    y <- as.matrix(Lessons[, input$Cources])
    text(x, y, labels = as.character(y),  pos = 3, col = "black")

    },bg="transparent")

  }
################## Select year Barplot Group and Stack together
  {
    barplottest <- reactive({
      if ( "2017" %in% input$selecty) return(database2017())
      if ( "2016" %in% input$selecty) return(database2016())
      if( "2015" %in% input$selecty) return(database2015())
    })
    output$CoursesView <- renderPlot({
      dataplots = barplottest()
      print(dataplots)
    })
}


######################### Barplot Group and Stack together
    ####2017
    {
      output$courses2017 <- renderPlot({
        xa <- data.frame(StudentsGrades2017)
        pass <- data.frame(pass=colSums(xa[,-1]>4.99, na.rm = TRUE))
        fail<- data.frame(fail=colSums(xa[,-1]<5, na.rm = TRUE))
        Avarage <- data.frame(Avarage=colMeans(StudentsGrades2017[,-1], na.rm = TRUE))
        Avarageround <- round(Avarage, 2)
        colos <- as.character(colnames(StudentsGrades2017[,-1]))

        test  <- data.frame(colos,
                            Avarageround,
                            pass ,
                            fail)

        melted <- melt(test, "colos")
        melted$courses <- ''
        melted[melted$variable == 'Avarage',]$courses <- "Av"
        melted[melted$variable != 'Avarage',]$courses <- "F/P"

        ggplot(melted, aes(x = courses, y = value, fill = variable, label = value )) +
          #geom_col() + facet_grid(~ colos)
          geom_bar(stat =  'identity', position = 'stack') + facet_grid(~ colos)+
          theme_classic() +
          geom_text(size = 3, position = position_stack(vjust = 0.5))
      })
    }
###################################
  ############## 2016
  {
    output$courses2016 <- renderPlot({
      xa2016 <- data.frame(StudentsGrades2016)
      pass2016 <- data.frame(pass=colSums(xa2016[,-1]>4.99, na.rm = TRUE))
      fail2016 <- data.frame(fail=colSums(xa2016[,-1]<5, na.rm = TRUE))
      Avarage2016 <- data.frame(Avarage=colMeans(StudentsGrades2016[,-1], na.rm = TRUE))
      Avarageround2016 <- round(Avarage, 2)
      colos2016 <- as.character(colnames(StudentsGrades2016[,-1]))

      test  <- data.frame(colos2016,
                          Avarageround2016,
                          pass2016 ,
                          fail2016)

      melted <- melt(test, "colos2016")
      melted$courses2016 <- ''
      melted[melted$variable == 'Avarage',]$courses2016 <- "Av"
      melted[melted$variable != 'Avarage',]$courses2016 <- "F/P"

      ggplot(melted, aes(x = courses2016, y = value, fill = variable, label = value )) +
        #geom_col() + facet_grid(~ colos)
        geom_bar(stat =  'identity', position = 'stack') + facet_grid(~ colos2016)+
        theme_classic() +
        geom_text(size = 3, position = position_stack(vjust = 0.5))
    })
  }
#########################################
  ########## 2015
  {
    output$courses2015 <- renderPlot({
      xa2015 <- data.frame(StudentsGrades2015)
      pass2015 <- data.frame(pass=colSums(xa2015[,-1]>4.99, na.rm = TRUE))
      fail2015 <- data.frame(fail=colSums(xa2015[,-1]<5, na.rm = TRUE))
      Avarage2015 <- data.frame(Avarage=colMeans(StudentsGrades2015[,-1], na.rm = TRUE))
      Avarageround2015 <- round(Avarage, 2)
      colos2015 <- as.character(colnames(StudentsGrades2015[,-1]))

      test  <- data.frame(colos2015,
                          Avarageround2015,
                          pass2015 ,
                          fail2015)

      melted <- melt(test, "colos2015")
      melted$courses2015 <- ''
      melted[melted$variable == 'Avarage',]$courses2015 <- "Av"
      melted[melted$variable != 'Avarage',]$courses2015 <- "F/P"

      ggplot(melted, aes(x = courses2015, y = value, fill = variable, label = value )) +
        #geom_col() + facet_grid(~ colos)
        geom_bar(stat =  'identity', position = 'stack') + facet_grid(~ colos2015)+
        theme_classic() +
        geom_text(size = 3, position = position_stack(vjust = 0.5))
    })
  }
#########################################################
  {
    output$SubjectTables = DT::renderDataTable(
      SubjectsInfo,
      options = list(scrollX = TRUE),
      editable = T
    )
  }
  {
    output$SubjectTables2016 = DT::renderDataTable(
      SubjectsInfo2016,
      options = list(scrollX = TRUE),
      editable = T
    )
  }
  {
    output$SubjectTables2015 = DT::renderDataTable(
      SubjectsInfo2015,
      options = list(scrollX = TRUE),
      editable = T
    )
  }
  {
    output$SubjectSum <-renderPrint({
      data.frame(AvarageGrade=colMeans(StudentsGrades2017[,-1], na.rm = TRUE))
    })
  }
  {
    output$subjectplot <- renderPlot({ mybar2 <-
      barplot(lessons[,input$Subjects],
              names.arg = row.names(lessons),
              main = "Students per Year",
              ylab = "Number of Students",
              xlab = "Years",
              ylim = c(0,25),
              col = "blue"
      )
    x<- as.matrix(mybar2)
    y <- as.matrix(lessons[, input$Subjects])
    text(x, y, labels = as.character(y),  pos = 3, col = "black")
    })
  }
################# Stack Barpl
  {
    barplottests <- reactive({
      if ( "Optim" %in% input$select) return(failpassv1())
      if ( "Neteg" %in% input$select) return(failpassv2())
      if( "Wicom" %in% input$select) return(failpassv3())
      if ( "Sensors" %in% input$select) return(failpassv4())
      if ( "Entrep" %in% input$select) return(failpassv5())
      if( "Iot-IP" %in% input$select) return(failpassv6())
      if ( "Arasm" %in% input$select) return(failpassv7())
      if ( "5Gplan" %in% input$select) return(failpassv8())
      if( "Image" %in% input$select) return(failpassv9())
      if ( "Optical" %in% input$select) return(failpassv10())
      if ( "Bodysens" %in% input$select) return(failpassv11())
      if( "Netauth" %in% input$select) return(failpassv12())
      if ( "Big Data" %in% input$select) return(failpassv13())
      if ( "SDR" %in% input$select) return(failpassv14())
      if( "LowPow" %in% input$select) return(failpassv15())
      if ( "Business" %in% input$select) return(failpassv16())
      if( "Service" %in% input$select) return(failpassv17())
      if ( "Creativity" %in% input$select) return(failpassv18())
    })
    output$Coursesplotly <- renderPlotly({
      dataplot = barplottests()
      print(dataplot)
    })
  }
################ Comparison per course 2017 2016 2015
  {
    barplottestsp <- reactive({
      if ( "Optim" %in% input$selectivep) return(pbox1())
      if ( "Neteg" %in% input$selectivep) return(pbox2())
      if( "Wicom" %in% input$selectivep) return(pbox3())
      if ( "Sensors" %in% input$selectivep) return(pbox4())
      if ( "Entrep" %in% input$selectivep) return(pbox5())
      if( "Iot-IP" %in% input$selectivep) return(pbox6())
      if ( "Arasm" %in% input$selectivep) return(pbox7())
      if ( "5Gplan" %in% input$selectivep) return(pbox8())
      if( "Image" %in% input$selectivep) return(pbox9())
      if ( "Optical" %in% input$selectivep) return(pbox10())
      if ( "Bodysens" %in% input$selectivep) return(pbox11())
      if( "Netauth" %in% input$selectivep) return(pbox12())
      if ( "Big Data" %in% input$selectivep) return(pbox13())
      if ( "SDR" %in% input$selectivep) return(pbox14())
      if( "LowPow" %in% input$selectivep) return(pbox15())
      if ( "Business" %in% input$selectivep) return(pbox16())
      if( "Service" %in% input$selectivep) return(pbox17())
      if ( "Creativity" %in% input$selectivep) return(pbox18())
    })
    output$CoursesGrades <- renderPlotly({
      dataplotp = barplottestsp()
      print(dataplotp)
    })
  ##############
  }
}


shinyApp(ui, server)
