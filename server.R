library(shiny)
shinyServer(function(input, output) {
    model <- reactive({
        brushed_data <- brushedPoints(FC3, input$brush1,
                                      xvar = "Fecha", yvar = "Puerto_Montt")
        if(nrow(brushed_data) < 2){
            return(NULL)
        }
        lm(Puerto_Montt ~ Fecha, data = brushed_data)
    })
      output$slopeOut <- renderText({
          if(is.null(model())){
              "No Model Found"
          } else {
            model()[[1]][2]
          }
      })
        output$intOut <- renderText({
            if(is.null(model())){
                "No Model Found"
            } else {
                model()[[1]][1]
            }
        })
        output$Plot1 <- renderPlot({
            plot(FC3$Fecha,FC3$Puerto_Montt, main = "Deads of Covid19 Puerto Montt, Chile",
                 cex =1.5, pch = 16, bty ="n", xlab="Fecha", ylab="N deads Covid19")
            if(!is.null(model())){
                abline(model(), col = "green", lwd = 2)
            }
        })
    })

