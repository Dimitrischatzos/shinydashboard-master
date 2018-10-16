library(shiny)
library(shinydashboard)
library(readxl)
library(ggplot2)
library(datasets)

#my_data <- read.csv("lessons2.csv", stringsAsFactors = TRUE, header = TRUE)
lessons = read.csv(file.choose(),TRUE, sep = ",",na.strings = T)
#names(lessons)[1] <- ""
#lessons<-data.matrix(lessons)
#tablle <- table(lessons$Cources, lessons$Years)
#dimnames(lessons) = list(
 # years <- c("lessons","year2015", "year2016","year2017"),
  #courses <- c("lessons","","sensors","neteg","busines","optim","optical")) # column names
# Define UI for application that draws a histogram
ui <- fluidPage(

  # Give the page a title
  titlePanel("UPC"),

  # Generate a row with a sidebar
  sidebarLayout(

    # Define the sidebar with one input
    sidebarPanel(
      selectInput("Cources", "Region:",
                  choices = colnames(lessons)
                  ),
      View(lessons),
      hr(),
      helpText("Number of Students by Course")
    ),

    # Create a spot for the barplot
    mainPanel(
      plotOutput("lessonsplote")
    )
  )
)
# Define server logic required to draw a histogram
server <- function(input, output) {

  # Fill in the spot we created for a plot
  output$lessonsplote <-
    renderPlot({

    # Render a barplot
      barplot(WorldPhones[,input$region],
             main=input$region,
              ylab="Number of Telephones",
              xlab="Year")

     # barplot(
        #      main = "Products Boxplot",
         #     xlab = "years",
          #    ylab = "Numbers of students",
           #   names.arg = lessons$Cources)
              #las = 1)



  })
}

# Run the application
shinyApp(ui = ui, server = server)

