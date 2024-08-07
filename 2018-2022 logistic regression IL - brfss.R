install.packages("survey")
library(survey)
data <- read.csv("C:/Users/kcaro/Documents/GitHub/py2r-brfss/2018-2022 logreg-IL _RFSMOK3 and Year.csv")
colnames(data)

design <- svydesign(id = ~X_PSU, strata = ~X_STSTR, weights = ~X_LLCPWT, data = data, nest=TRUE)

# Fit the logistic regression model
model <- svyglm(X_RFSMOK3 ~ Year, design = design, family = quasibinomial())

# Store the summary of the model in a variable named 'result'
result <- summary(model)

print(result)
