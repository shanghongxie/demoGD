#' Gradient descent for simple linear regression
#'
#' Perform gradient descent for linear regression with one predictor and intercept
#' @param X the predictor (a p-dimensional vector).
#' @param y the response variable (a vector)
#' @param learning_rate the step size for gradient descent
#' @param max_itr the maximum number of iterations to run gradient descent
#' @param tol the tolearnace between current and best cost
#' @returns Theta estimated parameters
#' @returns cost cost history
#' @returns best_cost best cost
#' @returns itr number of iterations conducted
#' @examples
#' # Generate some random data
#' X <- rnorm(100, mean = 0, sd = 1)
#' y <- 5 + 2 * X + rnorm(100, mean = 0, sd = 1)
#' # Perform gradient descent
#' result <- gradient_descent_single(X, y, learning_rate = 0.01, max_itr = 10000, tol = 1e-5)

#' # Print the result
#' print(paste("Intercept:", result$intercept))
#' print(paste("Slope:", result$slope))
#' @export
gradient_descent_single <- function(X, y, learning_rate = 0.01, max_itr = 1000, tol = 1e-5) {

  # Initialize parameters
  n <- length(y)  # number of data points
  theta0 <- 0     # intercept
  theta1 <- 0     # slope

  # Store the cost at each iteration
  cost <- numeric(max_itr)
  best_cost = 100000

  # Gradient descent algorithm
  itr = 1
  repeat{
    cat(itr)

    # Compute predictions
    y_pred <- theta0 + theta1 * X

    # Compute the error
    error <-  y - y_pred

    # Compute the current cost (mean squared error)
    current_cost <- (1/(2*n)) * sum(error^2)

    cost[itr] = current_cost

    if (abs(best_cost - current_cost) < tol || itr == max_itr) {
      cost = cost[1:(itr-1)]
      break}
    else{
      best_cost = current_cost

      itr = itr + 1

      # Compute gradients
      gradient0 = -(1/n) * sum(error)
      gradient1 = -(1/n) * sum(error * X)

      # Update parameters
      theta0 <- theta0 - learning_rate * gradient0
      theta1 <- theta1 - learning_rate * gradient1

    }

  }

  # Return the optimized parameters and the cost history
  return(list(intercept = theta0, slope = theta1, cost = cost, best_cost = best_cost, itr = itr))
}
