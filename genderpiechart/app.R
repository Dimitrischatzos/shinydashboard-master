library(ECharts2Shiny)

if (interactive()) {
  library(shiny)
  library(ECharts2Shiny)


  dat <-data.frame(
    Gender = c("Male", "Female"),
    value = c(MM, FF))


  # Server function -------------------------------------------
  server <- function(input, output) {
    renderPieChart(div_id = "test",
                   data = dat)
  }

  # UI layout -------------------------------------------------
  ui <- fluidPage(
    # We MUST load the ECharts javascript library in advance
    loadEChartsLibrary(),

    tags$div(id="test", style="width:50%;height:400px;"),
    deliverChart(div_id = "test")
  )

  # Run the application --------------------------------------
  shinyApp(ui = ui, server = server)
}
