#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)
library(wordcloud)
library(COUNT)
library(tm)
library(ggplot2)
library(ngram)

#Students <- read.csv("Students.csv", stringsAsFactors = F, header = T,   sep = ",")

# Define UI for application that draws a histogram
ui <- fluidPage(
  valueBoxOutput("Gender", width = 3)

  )

  server <- function(input, output) {
    output$Gender <- renderValueBox({
      valueBox(
        #wordcloud.count(StudentsPersonalData$Gender, byrow=FALSE, names = TRUE),
        #words <- StudentsPersonalData$Gender,
        length(grep("Female", StudentsPersonalData$Gender)),
        length(grep("Male", StudentsPersonalData$Gender)),
        paste("Number of Females"),
        wordcount("Male"),
        icon = icon("thumbs-up"),
        color = "blue"

      )
    })

    }



# Run the application
shinyApp(ui = ui, server = server)

