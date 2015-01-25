## 25 Jan 2015
## Code from makeVector and cachemean was used almost verbatim here  
## since the data type (vectors vs matrices) can be used analogously 
## with the function operations (taking the mean vs. matrix inversion)
## based on the similar arguments used for these functions.
## 
## x is a square invertible matrix, and s is it's inverse
##
  

makeCacheMatrix <- function(x = matrix()) {
## 'x' is a (set of) square invertible matrix as input for this function.
        s <- NULL
        setmatrix <- function(y) {
                x <<- y
                s <<- NULL
## 's', the inverted matrix of 'x' is initialized as NULL.
## It will be solved from 'x' in cacheSolve
        }
        getmatrix <- function() x 
## Equivalently getmatrix <- function() {x}
        setsolve <- function(solve) s <<- solve
        getsolve <- function() s

        list(setmatrix = setmatrix, getmatrix = getmatrix,
             setsolve = setsolve,
             getsolve = getsolve)        
## Defines a set of functions that can be called from makeCacheMatrix       
}

## 

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
        s <- x$getsolve()
        if(!is.null(s)) {
                message("getting cached data")
                return(s)
## Loads 's' if it is not NULL. "Else" continue and calculate 's'
        }
        data <- x$getmatrix()

        s <- solve(data, ...)
        x$setsolve(s)
        s
}

