library(shiny)
shinyServer(
  function(input,output){
    output$weight <- renderText(input$weight)
    output$height <- renderText(input$height)
    output$ASSESSMENT <- renderText({
        BMI = as.numeric(input$weight)*703/as.numeric(input$height)/as.numeric(input$height)
        
        if (is.na(BMI)) info=": Enter weight and height to calculate your BMI"
        else 
        if (BMI <= 18.5) info = "and you are UNDERWEIGHT" 
        else
        if (BMI > 18.5 && BMI < 25 ) info = "and you have a HEALTHY WEIGHT" 
        else 
        if (BMI >= 25 && BMI < 30 ) info = "and you are OVERWEIGHT"   
        else   
        if (BMI >= 30 ) info = "and you are OBESE"     
        
        paste("Your BMI is ",BMI,info )
      })
      
      weight_loss <-eventReactive(input$goButton, {
      
      target_weight <- as.numeric(input$target_bmi) * as.numeric(input$height) * as.numeric(input$height) / 703
      weight_loss_per_week <- ( as.numeric(input$weight) - target_weight  )  / as.numeric(input$numOfWeek)
      if(input$weight == "" || input$height == "")
      {
        paste('Enter both weight and height before clicking on Recommend.')
      }
      else
      {
        paste("To get to your target BMI you should lose(+)/gain(-) ",weight_loss_per_week, " lbs per week." )
      }
      }) 
    
    output$weightloss <- renderText({weight_loss()
    })
  }
  )