
# Demo R Package for Gradient Descent for Linear Regressions

<img src="https://img.shields.io/badge/Study%20Status-Results%20Available-yellow.svg" alt="Study Status: Results Available"> 

This is a demonstration R package for performing gradient descent for single and multiple linear regressions


- Authors: **Shanghong Xie<sup>a</sup> (SX2@mailbox.sc.edu)</sup>**

- Affiliations:
   + 1. **Department of Statistics, University of South Carolina, Columbia, SC, USA**



## Setup Requirements
- R

## Installation

```
library(devtools)
install_github("shanghongxie/demoGD")
library(demoGD)
```


## Code Instructions


### Main functions: 
### gradient_descent_single 
This is a function to perform gradient descent for simple linear regression with one predictor.
#### Arguments
+ `X`	the predictor (a p-dimensional vector).
+ `y`	the response variable (a vector)
+ `learning_rate`	the step size for gradient descent
+ `max_itr`	the maximum number of iterations to run gradient descent
+ `tol`	the tolearnace between current and best cost

#### Value
+`Theta` estimated parameters
+`cost` cost history
+`best_cost` best cost
+`itr` number of iterations conducted

### gradient_descent_multiple
This is a function to perform gradient descent for linear regression with multiple predictors
#### Arguments
+ `X`	the predictors (a n*p matrix). X should be standardized first.
+ `y`	the response variable (a vector)
+ `learning_rate`	the step size for gradient descent
+ `max_itr`	the maximum number of iterations to run gradient descent
+ `tol`	the tolearnace between current and best cost

#### Value
+`Theta` estimated parameters
+`cost` cost history
+`best_cost` best cost
+`itr` number of iterations conducted


 ## Examples
 Here is an example for a linear regression model with five predictors
``` 
 # Generate X with n=100, p=5
X <- matrix(rnorm(100*5, mean = 0, sd = 1), 100, 5)
Theta = c(1, 0.5, -5, 2, 3)
y <- X%*%Theta + rnorm(100, mean = 0, sd = 1)
# Perform gradient descent
result <- gradient_descent_multiple(X, y, learning_rate = 0.01, max_itr = 10000, tol = 1e-5)
Thetahat = result$Theta
result$itr
result$best_cost
cost = result$cost
# plot the cost history over iterations
plot(1:length(cost), cost, xlab = "iterations", main = "Cost over iterations")
```

<p align="center">
<img src="https://github.com/shanghongxie/demoGD/blob/master/costhistory.png" width="700" height="600">
</p>



