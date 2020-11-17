library(shiny)

# Define UI for application that draws a plot
shinyUI(fluidPage(

    # Application title
    titlePanel("Visaulize many models on N deads of Covid19 in Puerto Montt, Chile"),
    h3("By Oscar Vasquez, Date 17-Nov-2020 "),
    h3("always loved, never forgotten, rest in peace"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h3("Slope"),
            textOutput("slopeOut"),
            h3("Intercept"),
            textOutput("intOut")
            ),
        mainPanel(
            plotOutput("Plot1", brush = brushOpts(
                id = "brush1"
            ))
        )
    )
))
