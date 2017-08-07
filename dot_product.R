library(shiny)
library(miniUI)

dotProduct <- function() {
    ui <- miniPage(
        gadgetTitleBar("Interactive Dot Product"),
        h3("Enter your vectors below."),
        h4("Note that the dot product not defined while the vectors are of unequal length."),
        miniContentPanel(
            textInput('vec1', 'Enter x vector (comma delimited)', 
                      "0, 1, 2"),
            textInput('vec2', 'Enter y vector (comma delimited)', 
                      "1, 2, 3"),
            
            h4("The componentwise product is"),
            verbatimTextOutput("cw"),
            h4("The dot product is the sum thereof:"),
            verbatimTextOutput("dp")
        )
    )
    server <- function(input, output, session) {
        
        output$cw <- renderPrint({ # 
            x <- as.numeric(unlist(strsplit(input$vec1,",")))
            y <- as.numeric(unlist(strsplit(input$vec2,",")))
            p <- x * y
            print(p)
        })
        
        
        output$dp <- renderPrint({
            x <- as.numeric(unlist(strsplit(input$vec1,",")))
            y <- as.numeric(unlist(strsplit(input$vec2,",")))
            d <- (x %*% y)[1, 1]
            print(d) 
        })
        
        
    }
    runGadget(ui, server)
}
