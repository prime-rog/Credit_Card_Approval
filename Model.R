library(readr)
library(tidyverse)
## -----> Import and transform the data
credit <- read_csv("crx.data" , col_names = F , col_types =  cols(X1 = col_character() , 
                                                                  X10 = col_logical(),
                                                                  X12 = col_logical(),
                                                                  X16 = col_character(),
                                                                  X9 = col_logical(),
                                                                  X11=col_integer()))

colnames(credit) = cols = c("Male", "Age", "Debt", "Married", "BankCustomer", "EducationLevel", "Ethnicity", "YearsEmployed", "PriorDefault", "Employed", "CreditScore", "DriversLicense", "Citizen", "ZipCode", "Income", "Approved")

credit = credit %>% mutate(Approved = Approved== "+") %>%
        mutate(PriorDefault = !PriorDefault)

str(credit)
show(credit)

## --->   Due to males generally having a higher income, we can find out by checking which has the higher income.
 library(ggplot2)
incomeBar = ggplot(credit , aes(Male , Income , fill = Male)) + geom_col()
incomeBar


## ---> Based on the results of the graph, b has a larger income so it is the male variable.

## -->Mutate the Male column to be a logical data type with b as true.

credit = credit %>% mutate(Male= Male == "b")

str(credit)


## --> I created a boxplot to view the average income between approved and denied credit card applications.

li = log10(credit$Income + 0.01)
boxplot(li ~ credit$Approved)

ggplot(credit, aes(factor(PriorDefault, labels = c("No prior default", "Prior default")), fill = Approved)) +
        geom_bar() +
        ggtitle("Prior Default - Approved Percentage") +
        xlab("Prior Default")

ggplot(credit, aes(factor(Employed, labels = c("Not employed", "Employed")), fill = Approved)) +
        geom_bar() +
        ggtitle("Employed - Approved Percentage") +
        xlab("Employed")
ggplot(credit, aes(Ethnicity, fill = Approved)) + 
        geom_bar()
ggplot(credit, aes(Male, fill = Approved)) +
        geom_bar()
ggplot(credit, aes(EducationLevel, fill = Approved)) +
        geom_bar()
ggplot(credit, aes(factor(Approved, labels = c("Denied", "Approved")), YearsEmployed)) +
        geom_boxplot() +
        ggtitle("Years Employed - Approved") +
        xlab("Approved") +
        ylab("Years Employed")

library(FFTrees)


ffTreeCredit = credit %>%
        select(c("Male", "Debt", "Married", "BankCustomer", "EducationLevel", "Ethnicity", "YearsEmployed", "PriorDefault", "Employed", "CreditScore", "DriversLicense", "Citizen", "Income", "Approved"))

set.seed(199)
rows = sample(nrow(ffTreeCredit))
split = round(nrow(ffTreeCredit) * 0.7)

creditTraining = ffTreeCredit[1:split, ]
creditTest = ffTreeCredit[(split + 1):nrow(ffTreeCredit), ]

ffTree = FFTrees(formula = Approved ~ .,
                 data = creditTraining,
                 data.test = creditTest,
                 main = "Credit Card Approval",
                 decision.labels = c("Denied", "Approved"))


plot(ffTree, data = "test")


library(randomForest)
str(creditTraining)
model <- randomForest(as.factor(Approved) ~ . , data = creditTraining , nTree = 500 , mtry = 5 , importance = T)
saveRDS(model , "model.rds")
df_dummy <- creditTest[16 , ]
View(df_dummy)
Prediction = predict(model , df_dummy)
str(Prediction)
print(Prediction)

# Calculate RMSE
rmse <- sqrt(mean((Prediction == creditTest$Approved)^2))

# Print RMSE
print(rmse)


library(caret)
str(creditTest$Approved)

test_col = factor(creditTest$Approved)
confusion_m = confusionMatrix(Prediction , test_col)
print(accuracy)

print(confusion_m)

# Extract a tree from the Random Forest model (e.g., the first tree)
tree <- getTree(model, k = 1, labelVar = TRUE)

# Plot the decision tree
rpart.plot(tree, box.palette = "auto", shadow.col = "gray", nn = TRUE)


