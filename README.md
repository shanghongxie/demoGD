
# Demo R Package for Gradient Descent for Linear Regressions

<img src="https://img.shields.io/badge/Study%20Status-Results%20Available-yellow.svg" alt="Study Status: Results Available"> 

This is a demonstration R package for performing gradient descent for simple and multiple linear regressions.


- Authors: **Shanghong Xie<sup>a</sup> (SX2@mailbox.sc.edu)</sup>**

- Affiliations:
   + 1. **Department of Statistics, University of South Carolina, Columbia, SC, USA**

## Details
Consider a multiple linear regression model with $p$ predictors: $Y=X\Theta+\epsilon$, where $X$ is an $n\times p$ matrix, $\Theta=(\theta_1, \dots, \theta_p)^T$ represents the parameters, and error term $\epsilon=(\epsilon_1, \dots, \epsilon_n)^T$, where $\epsilon_i$'s are independent and $\epsilon_i\sim N(0, \sigma^2)$.

The cost function and its derivative with respect to $\Theta$ are as follows:

$$Cost=\frac{1}{2n}(y-X\Theta)^T(y-X\Theta)$$

```math
\frac{\partial Cost}{\partial \Theta}=-\frac{1}{n}X^T(y-X\Theta)
```


To estimate $\Theta$, perform the gradient descent algorithm: 

1. Initialize $\Theta=0$;

2. Iteratively update $\Theta$ as: $\Theta:= \Theta-\alpha \frac{\partial Cost}{\partial \Theta}$, where $\alpha$ is a learning rate;

3. End the iterations when the algorithm converges or when the pre-specified maximum number of iterations is reached.



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
+ `Theta` estimated parameters
+ `cost` cost history
+ `best_cost` best cost
+ `itr` number of iterations conducted

### gradient_descent_multiple
This is a function to perform gradient descent for linear regression with multiple predictors
#### Arguments
+ `X`	the predictors (an n*p matrix). X should be standardized first.
+ `y`	the response variable (a vector)
+ `learning_rate`	the step size for gradient descent
+ `max_itr`	the maximum number of iterations to run gradient descent
+ `tol`	the tolearnace between current and best cost

#### Value
+ `Theta` estimated parameters
+ `cost` cost history
+ `best_cost` best cost
+ `itr` number of iterations conducted


 ## Examples
 Here is an example for a linear regression model with five predictors
``` 
 # Generate X with n=100, p=5
X <- matrix(rnorm(100*5, mean = 0, sd = 1), 100, 5)
Theta = c(1, 0.5, -5, 2, 3)
y <- X%*%Theta + rnorm(100, mean = 0, sd = 1)
# Perform gradient descent
result <- gradient_descent_multiple(X, y, learning_rate = 0.01, max_itr = 10000, tol = 1e-5)
```
Estimated $\Theta$
```
Thetahat = result$Theta
c(Thetahat) 
```
0.9125283  0.5700435 -5.3888507  1.8727388  2.9746303

Best cost
```
result$best_cost
```
0.5003937
```
cost = result$cost
# plot the cost history over iterations
plot(1:length(cost), cost, xlab = "iterations", main = "Cost over iterations")
```

<p align="center">
<img src="https://github.com/shanghongxie/demoGD/blob/master/costhistory.png" width="700" height="600">
</p>



