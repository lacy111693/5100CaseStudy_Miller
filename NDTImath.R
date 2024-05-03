# Required packages
install.packages("ggplot2")  # For data visualization
install.packages("corrplot") # For correlation visualization
install.packages("caret") # For correlation calculation
install.packages("lmtest") # For linear regression

# Load libraries
library(ggplot2)
library(corrplot)
library(caret)
library(lmtest)

# Dataset
turbidity <- c(11, 34.1, 6.44, 37.1, 3.56, 14.9, 13.5, 50.4, 12.5, 54.2)
ndti <- c(-0.095588235, -0.145833333, -0.094812165, 0.008645533, -0.211428571,
          -0.25864124, -0.035952064, -0.048897411, -0.220843672, -0.019100431)

# 1. Data Visualization
ggplot() +
  geom_point(aes(x = turbidity, y = ndti), color = "blue") +
  labs(x = "Turbidity", y = "NDTI", title = "Scatter Plot of Turbidity vs NDTI")

# 2. Correlation Analysis
correlation_coefficient <- cor(turbidity, ndti)
print(paste("Correlation Coefficient:", correlation_coefficient))

# 3. Model Selection (Linear Regression)
model <- lm(ndti ~ turbidity)
summary(model)


# Plotting regression line
ggplot() +
  geom_point(aes(x = turbidity, y = ndti), color = "blue") +
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE, color = "red") +
  labs(x = "Turbidity", y = "NDTI", title = "Linear Regression: Turbidity vs NDTI")

# Load libraries
library(ggplot2)
library(lmtest)

# Dataset
turbidity <- c(11, 34.1, 6.44, 37.1, 3.56, 14.9, 13.5, 50.4, 12.5, 54.2)
ndti <- c(-0.095588235, -0.145833333, -0.094812165, 0.008645533, -0.211428571,
          -0.25864124, -0.035952064, -0.048897411, -0.220843672, -0.019100431)

# Fit linear regression model
model <- lm(ndti ~ turbidity)

# Summary of the regression model
summary(model)

# Extract coefficients
intercept <- coef(model)[1]
slope <- coef(model)[2]

# Plotting data points
p <- ggplot() +
  geom_point(aes(x = turbidity, y = ndti), color = "blue") +
  labs(x = "Turbidity", y = "NDTI", title = "Linear Regression: Turbidity vs NDTI")

# Adding regression line
p + geom_abline(intercept = intercept, slope = slope, color = "red")

cat("Regression formula: NDTI =", round(intercept, 4), "+", round(slope, 4), "* Turbidity")

