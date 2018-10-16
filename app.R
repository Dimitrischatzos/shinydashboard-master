library(shiny)
library(shinydashboard)
library(readxl)
library(ggplot2)
library(datasets)
library(DT)

#my_data <- read.csv("lessons2.csv", stringsAsFactors = TRUE, header = TRUE)
#Students <- read.csv("StudentsInfo.csv",TRUE, na.strings = T, sep = ",")
#StudentsInfo <- read.csv("Students.csv", sep = ",")
#Students <- read.csv("Students.csv", stringsAsFactors = F, header = T,   sep = ","
#)
#View(Students)

#names(lessons)[1] <- ""
#lessons<-data.matrix(lessons)
#tablle <- table(lessons$Cources, lessons$Years)
#dimnames(lessons) = list(
 # years <- c("lessons","year2015", "year2016","year2017"),
  #courses <- c("lessons","","sensors","neteg","busines","optim","optical")) # column names
# Define UI for application that draws a histogram
ui <- fluidPage(
  fluidPage(
    titlePanel("Students Iformations"),


    # Create a new Row in the UI for selectInputs
    fluidRow(
      column(4,
             selectInput("Lessons",
                         "SelectStudent:",
                         c("All",
                           unique(as.character(StudentsGrades$Students)
                                               ))))
      ),
      column(4,
             selectInput("Students",
                         "SelectGender:",
                         c("All",
                           unique(as.character(StudentsPersonalData$Students))))
      ),
      column(4,
             selectInput("Grades",
                         "SelectNationality:",
                         c("All",
                           unique(as.character(StudentsGrades))))
      )
    ),
    # Create a new row for the table.
    fluidRow(
      DT::dataTableOutput("StudentsTable")
    )
  )
)
)



server <- function(input, output){

    # Filter data based on selections
    output$StudentsTable <- DT::renderDataTable(DT::datatable({
      data <- StudentsInfo
      if (input$Students != "All") {
        data <- data[data$Students == input$Student]
      }
      if (input$Nationality != "All") {
        data <- data[data$Nationality == input$Nationalitys]
      }
      if (input$Gender != "All") {
        data <- data[data$Gender == input$Genders]
      }
     data
    }))

  }


# Run the application
#shinyApp(ui = ui, server = server)
shinyApp(ui, server)


