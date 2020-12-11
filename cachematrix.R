## Two functions that are able to cache the matrix inverse

## The makeCacheMatrix function is used to cache the inverse. The matrix object allows the caching of the matrix inverse, first initialise x as the
## function argument so no additional initialisation is required within the function
makeCacheMatrix <- function(x = matrix()) {
## Additionally, initialise a as an object and set it to NULL, it is now an object within the makeCacheMatrix() environment to be used by later code 
  a <- NULL
## Initialise the set module in order to set data values within an object
  set <- function(y) {
## The <<- operator assigns the value to an object in the parent environment
    x <<- y
    a <<- NULL
  }
## Initialise the get module to retrieve data within an object
  get <- function() x

## Set module used for the inverse
  setinverse <- function(inverse) a <<- inverse
  
## Get module used for the inverse
  getinverse <- function() a

## List of methods used  
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## The cacheSolve function is able to compute the inverse of the matrix returned by mackeCacheMatrix
cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
  a <- x$getinverse()
## If inverse already calculated, return the inverse from the cache
  if (!is.null(a)) {
    message("getting cached data")
    return(a)
  }
## Use the get module to retrieve matrix  
  data <- x$get()
## Using solve, it is possible to calculate the inverse  
  a <- solve(data, ...)
## Use the set module to set the inverse of the matrix to the object
  x$setinverse(a)
## Return matrix
  a
}
