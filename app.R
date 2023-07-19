#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(dplyr)
library(data.table)
library(randomForest)
library(shinythemes)
library(ggplot2)
library(ggthemes)
model <- readRDS("model.rds")
# Define UI for application that draws a histogram
ui <- fluidPage( theme = shinytheme('yeti'),
        tags$head(
                tags$style(HTML("
      .title-pane {
        text-align: center;
        margin-bottom: 20px;
      }
      .input-field {
        width: 100%;
        margin-bottom: 10px;
        text-align: center;
      }
        .predicted-data {
        margin: 0 auto;
        width: 80%;
        border-collapse: collapse;
      }
      .predicted-data th,
      .predicted-data td {
        padding: 8px;
        border: 1px solid #ccc;
        text-align: left;
      }
      .predicted-data th {
        font-weight: bold;
        background-color: #f2f2f2;
      }
    "))
        ),
        
        div(class = "title-pane",
            h1("Credit Card Approval Prediciton")
        ),
        
        div(style = "display: flex; flex-direction: row; justify-content: center;",
            div(class = "input-field",
                textInput("input_male", "Male:", placeholder = "TRUE / FALSE")
            ),
            div(class = "input-field",
                textInput("input_debt", "Debt:", placeholder = "Enter Debt in thousands")
            ),
            div(class = "input-field",
                textInput("input_married", "Married:", placeholder = "y/u")
            )
        ),
        
        div(style = "display: flex; flex-direction: row; justify-content: center;",
            div(class = "input-field",
                textInput("input_bank_customer", "BankCustomer:", placeholder = "p/g")
            ),
            div(class = "input-field",
                textInput("input_education_level", "EducationLevel:", placeholder = "aa  / c / cc / d / e / ff / i / j / k / m / q / r / w / x")
            ),
            div(class = "input-field",
                textInput("input_ethnicity", "Ethnicity:", placeholder = "bb / dd / ff / h / j / n / o / v / z")
            )
        ),
        
        div(style = "display: flex; flex-direction: row; justify-content: center;",
            div(class = "input-field",
                textInput("input_years_employed", "YearsEmployed:", placeholder = "Enter YearsEmployed")
            ),
            div(class = "input-field",
                textInput("input_prior_default", "PriorDefault:", placeholder = "TRUE/FALSE")
            ),
            div(class = "input-field",
                textInput("input_employed", "Employed:", placeholder = "TRUE/FALSE")
            )
        ),
        
        div(style = "display: flex; flex-direction: row; justify-content: center;",
            div(class = "input-field",
                textInput("input_credit_score", "CreditScore:", placeholder = "Enter CreditScore")
            ),
            div(class = "input-field",
                textInput("input_drivers_license", "DriversLicense:", placeholder = "TRUE/FALSE")
            ),
            div(class = "input-field",
                textInput("input_citizen", "Citizen:", placeholder = "g/s")
            )
        ),
        
        div(style = "display: flex; flex-direction: row; justify-content: center;",
            div(class = "input-field",
                textInput("input_income", "Income:", placeholder = "Enter Income in thousands")
            )
           
        ),
        
        div(style = "display: flex; flex-direction: row; justify-content: center;",
            actionButton("submit_button", "Predict")
        ),
        div(class = "predicted-data",
            h3("WILL YOU BE APPROVED :"),
            tableOutput("predicted_data")
        )
        
        # Rest of your UI code...
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
        
        # Initialize input values with NA
        observe({
                updateTextInput(session, "input_male", value = NA)
                updateTextInput(session, "input_debt", value = NA)
                updateTextInput(session, "input_married", value = NA)
                updateTextInput(session, "input_bank_customer", value = NA)
                updateTextInput(session, "input_education_level", value = NA)
                updateTextInput(session, "input_ethnicity", value = NA)
                updateTextInput(session, "input_years_employed", value = NA)
                updateTextInput(session, "input_prior_default", value = NA)
                updateTextInput(session, "input_employed", value = NA)
                updateTextInput(session, "input_credit_score", value = NA)
                updateTextInput(session, "input_drivers_license", value = NA)
                updateTextInput(session, "input_citizen", value = NA)
                updateTextInput(session, "input_income", value = NA)
               
        })
        
        observeEvent(input$submit_button, {
                
                # Retrieve input values
                male <- input$input_male
                debt <- input$input_debt
                married <- input$input_married
                bank_customer <- input$input_bank_customer
                education_level <- input$input_education_level
                ethnicity <- input$input_ethnicity
                years_employed <- input$input_years_employed
                prior_default <- input$input_prior_default
                employed <- input$input_employed
                credit_score <- input$input_credit_score
                drivers_license <- input$input_drivers_license
                citizen <- input$input_citizen
                income <- input$input_income
            
                
                # Create a data frame
                data <- data.frame(
                        Male = ifelse(is.na(male), NA, male),
                        Debt = ifelse(is.na(debt), NA, debt),
                        Married = ifelse(is.na(married), NA, married),
                        BankCustomer = ifelse(is.na(bank_customer), NA, bank_customer),
                        EducationLevel = ifelse(is.na(education_level), NA, education_level),
                        Ethnicity = ifelse(is.na(ethnicity), NA, ethnicity),
                        YearsEmployed = ifelse(is.na(years_employed), NA, years_employed),
                        PriorDefault = ifelse(is.na(prior_default), NA, prior_default),
                        Employed = ifelse(is.na(employed), NA, employed),
                        CreditScore = ifelse(is.na(credit_score), NA, credit_score),
                        DriversLicense = ifelse(is.na(drivers_license), NA, drivers_license),
                        Citizen = ifelse(is.na(citizen), NA, citizen),
                        Income = ifelse(is.na(income), NA, income),
                        Approved = 0
                )
                
                print(data)
                data <- data %>%
                        mutate(Male = as.logical(Male),
                               Debt = as.numeric(Debt),
                               Married = as.character(Married),
                               BankCustomer = as.character(BankCustomer),
                               EducationLevel = as.character(EducationLevel),
                               Ethnicity = as.character(Ethnicity),
                               YearsEmployed = as.numeric(YearsEmployed),
                               PriorDefault = as.logical(PriorDefault),
                               Employed = as.logical(Employed),
                               CreditScore = as.integer(CreditScore),
                               DriversLicense = as.logical(DriversLicense),
                               Citizen = as.character(Citizen),
                               Income = as.numeric(Income),
                               Approved = as.logical(Approved))
               
                Output <- data.frame(predict(model,data))
                
                
                
                output$predicted_data <- renderTable({
                        Output
                })
                
                
                
                
                
                
        })
        
}
# Run the application 
shinyApp(ui = ui, server = server)
