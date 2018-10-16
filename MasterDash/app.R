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
library(reshape2)
library(plotrix)


#Enrollment <- read.csv("Enrollment.csv",TRUE, na.strings = T, sep = ",")
#InfoStudents <- read.csv("Students.csv",TRUE, na.strings = T, sep = ",", row.names = 1)
Students <- read.csv("StudentsInfo.csv",TRUE, na.strings = T, sep = ",")
graduatedStudents <- rbind(StudentsGrades2017, StudentsGrades2016, StudentsGrades2015)
#View(graduatedStudents)
Studentsinformations <- rbind(StudentsPersonalData2015, StudentsPersonalData2016, StudentsPersonalData2017)
#View(Studentsinformations)

ui <- dashboardPage(
  dashboardHeader(title = "UPC",titleWidth = 350),
  dashboardSidebar(
    ## Sidebar content
    dashboardSidebar(
      sidebarMenu(
        sidebarSearchForm(textId = "searchText", buttonId = "searchButton",
                          label = "Search..."),
        menuItem("MASTEAM View", tabName = "dashboard", icon = icon("dashboard")),
        menuItem("Students View", tabName = "tab1", icon = icon("address-card")),
        menuItem("Courses View", tabName = "Tab2", icon = icon("book"))
        #menuItem("Professors", tabName = "Tab3", icon = icon("id-badge"))

      )
    )
  ),
  dashboardBody(

    tabItems(
      #################### First tab content
      tabItem(tabName = "dashboard",
              fluidRow(
                tabBox(
                  title = "MASTEAM VIEW",
                  id = "tabset1",  height = "600px", side = "left", width = "726px",

                  tabPanel(title = "Enrolment View",
                           fluidRow(
                             # Dynamic valueBoxes
                             valueBoxOutput("Applications", width = 3),
                             valueBoxOutput("Accepted", width = 3),
                             #valueBoxOutput("Rejected", width = 3),
                             valueBoxOutput("Enrolled", width = 3),
                             valueBoxOutput("Graduations", width = 3)),
                           #fluidRow(
                           #box(title = "Students Gender",
                           valueBoxOutput("Female", width = 3 ),
                           valueBoxOutput("Male", width = 3 ),
                           #box(title = "Students Nationality",
                           valueBoxOutput("EU", width = 3 ),
                           valueBoxOutput("NONEU", width = 3 ),
                           fluidRow(
                             box(plotOutput("GenderPie")),
                             box(plotOutput("NationalityPie"))
                           )
                  ),
                  tabPanel(title = "Enrolment per Year",
                           box(
                             plotOutput("Enrolmentplot")))
                )
              )
      ),
      #########################
      # Second tab content
      tabItem(tabName = "tab1",
              fluidRow(
                tabBox(
                  title = "Students Data",
                  # The id lets us use input$tabset1 on the server to find the current tab
                  id = "tabset1",  height = "600px", side = "left", width = "726px",

                  tabPanel("Students Info",
                           DT::dataTableOutput("Studentstable")),

                  tabPanel("Grades",
                           DT::dataTableOutput("Gradestable")),

                  tabPanel("Summary", verbatimTextOutput("Sum")),

                  tabPanel("Percentage of graduated students", "Tab content 2",
                           box(
                             title = "Grades",
                             sliderInput("slider", "Number of observations:", 2015, 2017,2010)
                           )
                  )
                )
              )
      ),

      ###################### Third tab content
      tabItem(tabName = "Tab2",
              fluidRow(
                tabBox(
                  title = "Subjects Info",
                  # The id lets us use input$tabset1 on the server to find the current tab
                  id = "tabset1",  height = "600px", side = "left", width = "726px",

                  tabPanel(
                    title = "Cources Info",
                    selectInput("Cources", "Year:",
                                choices=colnames(Lessons),
                                Lessons <- read.csv("Cources - Sheet1.csv",TRUE, na.strings = T, sep = ",", row.names = 1)),
                    #View(Lessons),
                    # Create a spot for the barplot
                    plotOutput("lessonsplot"), width = 12
                  ),

                  tabPanel("Subjects",
                           DT::dataTableOutput("SubjectTables")),
                  tabPanel("Summary of Subjects", verbatimTextOutput("SubjectSum")),

                  tabPanel(
                    title = "Number of Students per Subject",
                    selectInput("Subjects", "Select Subject:",
                                choices = colnames(lessons),
                                lessons <- read.csv("Cources&Years.csv",TRUE, na.strings = T, sep = ",", row.names = 1)),
                    #View(lessons),
                    hr(),
                    helpText("Number of Students Per Cource and Per Year"),

                    # Create a spot for the barplot
                    plotOutput("subjectplot")
                  )
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
      color = "purple"
    )
  })
  ######Accepted Letters
  output$Accepted <- renderValueBox({
    valueBox(
      sum(Enrollment$Accepted),
      paste("Accepted Applications"),
      icon = icon("thumbs-up"),
      color = "aqua"
    )
  })
  ######Informations
  output$Graduations <- renderValueBox({
    valueBox(
      paste(round(percent(graduatedStudents$'Master Thesis'>4.99)), "%", sep = ""),
      paste("Graduated Students"),
      icon = icon("education", lib = "glyphicon" ),
      color = "green"
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
      color = "blue"
    )
  })
  ##########Number of Female students box
  output$Female <- renderValueBox({
    valueBox(
      length(grep("Female", Studentsinformations$Gender)),
      paste("Female students"),
      icon = icon("female"),
      color = "fuchsia"
    )
  })
  ######## Number of Male students box
  output$Male <- renderValueBox({
    valueBox(
      length(grep("Male", Studentsinformations$Gender)),
      paste("Male students"),
      icon = icon("male"),
      color = "teal"
    )
  })
  ######## Number of EU students
  output$EU <- renderValueBox({
    valueBox(
      length(grep("\\bEU\\b", Studentsinformations$Nationality)),
      paste("EU students"),
      icon = icon("globe"),
      color = "light-blue"
    )
  })
  ####### Number of NONEU students
  output$NONEU <- renderValueBox({
    valueBox(
      length(grep("NONEU", Studentsinformations$Nationality)),
      paste("NONEU students"),
      icon = icon("globe"),
      color = "red"
    )
  })
  #########Gender Pie Chart percentage
  {
    output$GenderPie <- renderPlot({

      MM <- length(grep("Male", Studentsinformations$Gender))
      FF <- length(grep("Female", Studentsinformations$Gender))

      x1 <- c(FF, MM)
      pie <- c("Female", "Male")
      pct <- round(x1/sum(x)*100)
      lbls <- paste(labels, pct) # add percents to labels
      lbls <- paste(lbls,"%",sep="") # ad % to labels
      pie3D(x1, labels = lbls, col=c("violet", "lightblue2"),explode = 0.1,main="MASTEAM Gender Percentage %")
      legend("topright", c("Female", "Male"), cex=1, fill=c("violet","lightblue"))
    })
  }
  #########Nationality Pie Chart percentage
  {
    output$NationalityPie <- renderPlot({

      EE <- length(grep("\\bEU\\b", Studentsinformations$Nationality))
      NN <- length(grep("NONEU", Studentsinformations$Nationality))

      x2 <- c(EE, NN)
      labels <- c("EU", "NONEU")
      pct <- round(x2/sum(x)*100)
      lbls <- paste(labels, pct) # add percents to labels
      lbls <- paste(lbls,"%",sep="") # ad % to labels
      pie3D(x2, labels = lbls, col=c("blue", "red"), explode = 0.1,main="MASTEAM Nationality Percentage %")
      legend("topright", c("EU", "NONEU"), cex=1, fill=c("blue","red"))
    })
  }

  ######### Stacked Barplot with the Enrolment
  {
    output$Enrolmentplot <- renderPlot({
      x <- data.frame(Enrollment )

      mx <- melt(x, id.vars=1:1)
      ggplot(mx, aes(x=Enrolment, y=value, fill=variable,label= value)) +
        geom_bar(stat="identity",color="black" ) +
        theme_classic() +
        geom_text(size = 5, position = position_stack(vjust = 0.5))

    })
  }

  #######################################

  ######End Of The main Tab MASTEAM Dashboard#####


  #### Second SiderTab 2
  ######Output For Students Sider Tab
  {
    output$Studentstable = DT::renderDataTable(
      StudentsPersonalData2017,
      editable =T
    )
  }
  {
    output$Gradestable = DT::renderDataTable(
      StudentsGrades2017,
      options = list(scrollX = TRUE),
      editable = T
    )
  }

  {
    output$Sum <- renderPrint({
      data.frame(Nmae=StudentsGrades2017[,1], AvarageGrade=rowMeans(StudentsGrades2017[,-1], na.rm = TRUE))

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
  {
    output$SubjectTables = DT::renderDataTable(
      SubjectsInfo,
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


}


shinyApp(ui, server)
