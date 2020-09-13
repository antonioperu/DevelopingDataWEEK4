library(shiny)

ui <- fluidPage(
    
    # App title ----
    titlePanel("Developing Data Products! - Simulation of Normal Distribution"),
    
    # Sidebar layout 
    sidebarLayout(
        
        # Sidebar panel 
        sidebarPanel(
            
            # Input: Slider for the number standard deviation ----
            sliderInput(inputId = "SD",
                        label = "Select Standard Deviation",
                        min = 1,
                        max = 5,
                        value = 1),
            
            
            # Input: Slider for the number standard deviation ----
            sliderInput(inputId = "Mean",
                        label = "Select Mean",
                        min = 1,
                        max = 1000,
                        value = 30)
            
        ),
        
        # Main panel 
        mainPanel(
            
            # Output: Histogram 
            plotOutput(outputId = "distPlot")
            
        )
    )
)

# Server

server <- function(input, output) {
    
    
    output$distPlot <- renderPlot({
        
        x    <- rnorm(5000,input$Mean,input$SD)
        SD <- seq(min(x), max(x), length.out = 30)
        
        hist(x, breaks = SD, col = "red", border = "white",
             main = "Simulation of Norm. Dist (10000 observations)")
        
    })
    
}
# Run
shinyApp(ui = ui, server = server)
