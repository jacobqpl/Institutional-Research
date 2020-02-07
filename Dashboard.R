rm(list = ls())
install.packages("shinydashboard")
install.packages('rsconnect')
rsconnect::setAccountInfo(name='peilin',
                          token='85263F9E3697FA4AC69A361F09A78996',
                          secret='<SECRET>')

library(rsconnect)
rsconnect::deployApp('path/to/your/app')


## ui.R ##
library(shinydashboard)

dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody()
)

## app.R ##
library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody()
)

server <- function(input, output) { }

shinyApp(ui, server)

## app.R ##
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Institutional Research and Analytics Department"),
  dashboardSidebar(title = "Peilin Qiu"),
  dashboardBody(
    # Boxes need to be put in a row (or column)
    fluidRow(
      box(plotOutput("plot1", height = 250)),
      
      box(
        title = "Controls",
        sliderInput("slider", "Number of observations:", 1, 10000, 5)
      )
    )
  )
)

server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(5000)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
}

shinyApp(ui, server)


## Sidebar content
dashboardSidebar(
  sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Widgets", tabName = "widgets", icon = icon("th"))
  )
)



## Body content
dashboardBody(
  tabItems(
    # First tab content
    tabItem(tabName = "dashboard",
            fluidRow(
              box(plotOutput("plot1", height = 250)),
              
              box(
                title = "Controls",
                sliderInput("slider", "Number of observations:", 1, 100, 50)
              )
            )
    ),
    
    # Second tab content
    tabItem(tabName = "widgets",
            h2("Widgets tab content")
    )
  )
)

# A basic div
div(class = "my-class", "Div content")
## <div class="my-class">Div content</div>

# Nested HTML tags
div(class = "my-class", p("Paragraph text"))
## <div class="my-class">
##   <p>Paragraph text</p>
## </div>



textInput("Id", "Label")
## <div class="form-group shiny-input-container">
##   <label for="Id">Label</label>
##   <input id="Id" type="text" class="form-control" value=""/>
## </div>

sidebarPanel(
  div("First div"),
  div("Second div")
)
## <div class="col-sm-4">
##   <form class="well">
##     <div>First div</div>
##     <div>Second div</div>
##   </form>
## </div>

dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody()
)



header <- dashboardHeader()

sidebar <- dashboardSidebar()

body <- dashboardBody()

dashboardPage(header, sidebar, body)



dashboardHeader(title = "My Dashboard")


dropdownMenu(type = "messages",
             messageItem(
               from = "Sales Dept",
               message = "Sales are steady this month."
             ),
             messageItem(
               from = "New User",
               message = "How do I register?",
               icon = icon("question"),
               time = "13:45"
             ),
             messageItem(
               from = "Support",
               message = "The new server is ready.",
               icon = icon("life-ring"),
               time = "2014-12-01"
             )
)


dashboardHeader(dropdownMenuOutput("messageMenu"))


output$messageMenu <- renderMenu({
  # Code to generate each of the messageItems here, in a list. This assumes
  # that messageData is a data frame with two columns, 'from' and 'message'.
  msgs <- apply(messageData, 1, function(row) {
    messageItem(from = row[["from"]], message = row[["message"]])
  })
  
  # This is equivalent to calling:
  #   dropdownMenu(type="messages", msgs[[1]], msgs[[2]], ...)
  dropdownMenu(type = "messages", .list = msgs)
})

