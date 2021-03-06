screen_titles_ui <- function(){

  # build user interface
  header <- shinydashboard::dashboardHeader(
    title = plotOutput("header")
  )

  sidebar <- shinydashboard::dashboardSidebar(
    sidebarMenu(
      id = "tabs",
      menuItem("Data",
        icon = shiny::icon("bar-chart-o"),
        startExpanded = TRUE,
        fileInput("data_in", label = "Import"),
        actionButton(
          inputId = "save_data",
          label = "Save Data",
          width = "85%"
        ),
        actionButton(
          inputId = "clear_data",
          label = "Clear Data",
          width = "85%"
        ),
        actionButton(
          inputId = "exit_app",
          label = "Exit App",
          width = "85%"
        ),
        br()
      ),
      menuItem("Appearance",
        icon = icon("paint-brush"),
        sliderInput(
          inputId = "n_citations",
          label = "Number of articles shown",
          min = 2,
          max = 20,
          value = 8,
          step = 2
        ),
        selectInput(
          inputId = "order",
          label = "Order citations by:",
          choices = list(
            "Input" = "order_initial",
            "Random" = "order_random",
            "Alphabetical" = "order_alphabetical"
          )
        ),
        selectInput("hide_names",
          label = "Hide identifying information?",
          choices = c(TRUE, FALSE),
          multiple = FALSE
        )
      )
    )
  )

  body <- shinydashboard::dashboardBody(
    revtools_css(),
    fluidRow(
      div(id = "placeholder"),
      div(
        style = "
          display: inline-block;
          vertical-align: top;",
        uiOutput("select_all_buttons")
      ),
      br(),
      br(),
      div(
        style = "
          display: inline-block;
          vertical-align: top;",
        uiOutput("navigation_buttons")
      )
    )
  )

  return(
    list(
      header = header,
      sidebar = sidebar,
      body = body
    )
  )

}