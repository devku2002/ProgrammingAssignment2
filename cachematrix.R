## The first function makeCacheMatrix creates a special matrix object that can cache it's inverse. 
## This contains the list which contains function to set the value of vector, get the value of vector, 
## set the value of inverse, get the value of inverse
makeCacheMatrix <- function(x = matrix()) {
cacheInverse <- NULL
set <- function(y) {
x <<- y
cacheInverse <<- NULL
}
get <- function() x
setInverse <- function(inverse) cacheInverse <<- inverse
getInverse <- function() cacheInverse
list(set = set, get = get,
setInverse = setInverse,
getInverse = getInverse)
}
## The below second function calculates the inverse of the special vector created above in first function.
cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
invFunc <- x$getInverse()
if(!is.null(invFunc)) {
message("getting cached data")
return(invFunc)
}
data <- x$get()
invFunc <- solve(data, ...)
x$setInverse(invFunc)
invFunc
}
