library(shiny)
library(shinyforms)

questions <- list(
  list(id = "reviewer", type = "text", title = "Reviewer's Name", mandatory = TRUE),
  list(id = "age", type = "text", title = "Title of article")
)


formInfo <- list(
  id = "basicinfo",
  questions = questions,
  storage = list(
    # Right now, only flat file storage is supported
    type = STORAGE_TYPES$FLATFILE,
    # The path where responses are stored
    path = "responses"
  )
)


ui <- fluidPage(
  formUI(formInfo)
)

server <- function(input, output, session) {
  formServer(formInfo)
}

shinyApp(ui = ui, server = server)

test <- readr::read_csv("responses/20190429-125113_dc7d925e4591fbcded85e176c050fd5e.csv")
