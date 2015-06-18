shinyUI(pageWithSidebar(
  headerPanel("BMI Calculator and weight loss recommendation"),
  sidebarPanel(
      h6('--------------------Calculator--------------------------'),
      h6('Enter height and weight to calculate BMI : '),
      textInput(inputId="weight",label="Enter weight(lbs)"),
      textInput(inputId="height",label="Enter height(inches)"),
      h6(''),
      h6(''),
      h6('-----------------RECOMMENDATION-----------------'),
      h6('Enter target BMI and number of weeks to calculate weight loss/gain required per week to acheive target'),      
      textInput(inputId="target_bmi",label="Enter target BMI"),
      textInput(inputId="numOfWeek",label="Enter number of weeks to acheive target"),
      actionButton("goButton","Recommend")
    ),
  mainPanel(
      tabsetPanel(
          tabPanel("Introduction",
                   p(h4("Body Mass Index")),
                   p("Body Mass Index (BMI) is a person's weight in kilograms divided by the square of height in meters. A high BMI can be an indicator of high body fatness. BMI can be used to screen for weight categories that may lead to health problems but it is not diagnostic of the body fatness or health of an individual."),
                   p(''),
                   p(''),
                   p(h4("BMI Chart")),
                   p(''),
                   p('Under  Weight    -     <  18.5'),
                   p('Normal Weight    -     >= 18.5 and <= 24.9'),
                   p('Over   Weight    -     >= 25   and <= 30'),
                   p('Obese            -     >  30'),
                   p(''),
                   p(''),
                   p(h4("How to use the application")),
                   p("Step 1 : Enter your weight and height to calculate your current BMI."),
                   p("Step 2 : Refer the BMI Chart above to find your target BMI."),
                   p("Step 3 : Use the recommendation inputs to find how much weight you need to gain or lose per week to get to your target BMI. Number of weeks denotes the number of weeks to achieve your target.")
                   ),
          tabPanel("Application",              
              p(h4('Report : ')),
              p('Weight'),
              textOutput('weight'),
              p('Height'),
              textOutput('height'),
              textOutput('ASSESSMENT'),
              p(''),
              p(''),
              p(h4('Recommendation :  ')),
              p('+ means you need to lost weight'),
              p('- means you need to gain weight'),
              textOutput('weightloss')
              
          )
      )
    )
  ))