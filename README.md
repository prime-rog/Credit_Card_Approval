# Credit Card Approval Predictor Web Application
![image](https://github.com/prime-rog/Credit_Card_Approval/assets/83567814/b729a74c-31d5-4621-984e-d6f6649ec6ac)



## Overview

This is a web application built using R and Shiny Web App to predict whether a person will be approved for a credit card or not. The app is hosted on Shinyapps.io, making it easily accessible for users to check their credit card approval chances anytime, anywhere.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Demo](#demo)
- [Installation](#installation)
- [Usage](#usage)
- [Insights](#insights)
- [Data](#data)
- [Model](#model)
- [Contributing](#contributing)
- [License](#license)
  

## Features

- User-friendly interface: The application offers an intuitive and user-friendly interface for users to input their relevant information easily.

- Predictive Model: The app employs a sophisticated machine learning model to predict credit card approval chances based on user-provided information.

- Instant Results: Once the user submits their details, the prediction is made instantly, displaying the result on the screen.

## Demo

You can access the live demo of the web application at(https://prime-rog.shinyapps.io/Credit_Card_Approval/).

## Installation

If you wish to run this application locally, follow these steps:

1. Clone this repository to your local machine.
2. Make sure you have R and RStudio installed. You can download them from [https://www.r-project.org/](https://www.r-project.org/) and [https://www.rstudio.com/](https://www.rstudio.com/), respectively.
3. Install the required packages by running the following command in RStudio:

```R
install.packages(c("shiny", "tidyverse", "caret", "randomForest"))
```

## Usage

1. Open RStudio.
2. Set the working directory to the location where you cloned this repository.
3. Run the `app.R` file to launch the Shiny application.
4. Access the application by visiting [http://127.0.0.1:PORT/](http://127.0.0.1:PORT/) in your web browser.

## Insights
The attributes are missing from the dataset. Thanks to Ryan Khun’s Analysis of Credit Approval Data, the analysis provided the attribute names. Although some of the variables are not interpretable such as education level and ethnicity.
![image](https://github.com/prime-rog/Credit_Card_Approval/assets/83567814/a0691e4b-5e71-418f-bcd6-24f5db74212f)

With a yearly income of less than approximately $10,000 have been denied, yet there are still people that have been accepted within that range. The majority of the people get approved for a credit card around 20,000.
![image](https://github.com/prime-rog/Credit_Card_Approval/assets/83567814/8c86a2fa-b6b4-4598-a136-b5c680fea0cc)

Having a prior default has a major influence of being denied a credit card. About three quarters of the applications that did not have a prior default were approved, whereas about 7% of the applications with a prior default were approved.
![image](https://github.com/prime-rog/Credit_Card_Approval/assets/83567814/3ed6a5dd-8074-410b-86d0-f8513cadf973)

Three quarters of the unemployed people were denied a credit card, whereas only a third of the employed people were denied. This means being employed has a large influence on being approved for a credit card.
![image](https://github.com/prime-rog/Credit_Card_Approval/assets/83567814/343c9a8b-99e3-41a4-bd6b-69e6bbf6d1fd)


A large percentage of applications are approved with little to no income. This indicates that other factors can affect an approved credit card.
There are a large amount of applications for the v attribute, but around half of them are denied. There seems to be no correlation between ethnicity and being approved for a credit card.
![image](https://github.com/prime-rog/Credit_Card_Approval/assets/83567814/7d071df8-7847-46e8-87ad-5b9df4ee19e5)

40% of males are approved and 44% of females are approved. There seems to be no correlation between gender and being approved of a credit card. Even though the p-value of the chi-squared test is greater than 0.05, I suspect that the difference in the number of males and females had an effect on the p-value. I believe there is not association between gender and being approved for a credit card application.
![image](https://github.com/prime-rog/Credit_Card_Approval/assets/83567814/3ebeb0d2-c700-4b62-9148-7d807d355375)

There are some variables that have a large amount of approved and denied card application. It is possible that education level has an effect on the chances of being approved for a credit card.
![image](https://github.com/prime-rog/Credit_Card_Approval/assets/83567814/7c62b775-04a3-4a03-91d3-13a999d54129)

The majority of the denied applications had been employed for less than two years with outliers ranging up to more than ten. The majority of the approved applications had been employed for more than two years. The outliers may indicate having other factors involved in being denied a credit card.


## Data

The dataset used to train the predictive model is not included in this repository. However, you can find a sample dataset for demonstration purposes in the `data` directory. If you want to use your own data, make sure it is in a compatible format (e.g., CSV) and has the required variables.

## DATA SOURCE - https://archive.ics.uci.edu/dataset/27/credit+approval

## Model

The predictive model used in this application is built on the Random Forest algorithm. The model is trained using historical credit card application data, and it leverages various features such as income, credit score, employment status, etc. to make accurate predictions.

## Accuracy - 83%

## Contributing

We welcome contributions to improve this web application. If you find any bugs or have ideas for new features, feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

---

We hope this web application helps you gain insights into your credit card approval chances. If you have any feedback or questions, please don't hesitate to reach out. Happy predicting!
