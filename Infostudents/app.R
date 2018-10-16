# Load the ggplot2 package which provides
# the 'mpg' dataset.
library(shiny)
library(shinydashboard)
library(ggplot2)

StudentsInfo <- read.csv("StudentsInfo.csv",TRUE, na.strings = T, sep = "," )


fluidPage(
  titlePanel("Students Grades & Informations"),

  # Create a new Row in the UI for selectInputs
  fluidRow(
    column(4,
           selectInput("Students",
                       "Select Student:",
                       c("All",
                         unique(as.character(StudentsInfo$Students))))
    ),
    column(4,
           selectInput("Nationality",
                       "Select Nationality:",
                       c("All",
                         unique(as.character(StudentsInfo$Nationality))))
    ),
    column(4,
           selectInput("Gender",
                       "Select Gender:",
                       c("All",
                         unique(as.character(StudentsInfo$Gender))))
    )
  ),
  # Create a new row for the table.
  fluidRow(
    StudentsIfo::dataTableOutput("table")
  )
)

function(input, output) {

  # Filter data based on selections
  output$table <- Studentsinfo::renderDataTable(StudentsInfo::datatable({
    data <- StudentsInfo
    if (input$Students != "All") {
      data <- data[data$Students == input$Students,]
    }
    if (input$Nationality != "All") {
      data <- data[data$Nationality == input$Nationality,]
    }
    if (input$Gender != "All") {
      data <- data[data$Gender == input$Gender,]
    }
    data
  }))

}
shinyApp(ui, server)
