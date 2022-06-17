## This is a pair of functions that cache the inverse of a matrix


## 1. function makeCacheMatrix() is used to create a special "matrix" object that
## can cache its inverse 

makeCacheMatrix <- function( x = matrix() ) {
    
    ## Initialize the inverse property
    i <- NULL
    
    ## Method to set the matrix
    set <- function( y ) {
        x <<- y
        i <<- NULL
    }
    
    ## Method the get the matrix
    get <- function() {
        ## Return the matrix
        x
    }
    
    ## Method to set the inverse of the matrix
    setInverse <- function(inverse) {
        i <<- inverse
    }
    
    ## Method to get the inverse of the matrix
    getInverse <- function() {
        ## Return the inverse property
        i
    }
    
    ## Return a list of the methods
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## 2. function cacheSolve() is used to compute the inverse of the special "matrix" returned by makeCacheMatrix above.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    i <- x$getInverse()
    
    if (!is.null(i)){
        message("Getting cached data")
        return(i)
    }
    
    ## Get the matrix from our object
    matrix <- x$get()
    
    ## Calculate the inverse 
    i <- solve(matrix, ...)
    
    ## Set the inverse to the object
    x$setInverse(i)
    
    ## Return the matrix
    i
}
