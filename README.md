# Credit Card Approval Predictor Web Application
![image](https://github.com/prime-rog/Credit_Card_Approval/assets/83567814/9743d8a4-071f-4767-b407-cdb1dd4514f8)


## Overview

This is a web application built using R and Shiny Web App to predict whether a person will be approved for a credit card or not. The app is hosted on Shinyapps.io, making it easily accessible for users to check their credit card approval chances anytime, anywhere.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Demo](#demo)
- [Installation](#installation)
- [Usage](#usage)
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

## Data

The dataset used to train the predictive model is not included in this repository. However, you can find a sample dataset for demonstration purposes in the `data` directory. If you want to use your own data, make sure it is in a compatible format (e.g., CSV) and has the required variables.
DATA SOURCE - https://archive.ics.uci.edu/dataset/27/credit+approval

## Model

The predictive model used in this application is built on the Random Forest algorithm. The model is trained using historical credit card application data, and it leverages various features such as income, credit score, employment status, etc. to make accurate predictions.
Accuracy - 83%

## Contributing

We welcome contributions to improve this web application. If you find any bugs or have ideas for new features, feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

---

We hope this web application helps you gain insights into your credit card approval chances. If you have any feedback or questions, please don't hesitate to reach out. Happy predicting!
