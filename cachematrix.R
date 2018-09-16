## Put comments here that give an overall description of what your
## functions do

## creates matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  inv_x <- NULL
  set <- function(y) {
    x<<- NULL
  }
  get <- function()x
  setinverse <- function(inverse) inv_x <<- inverse 
  getinverse <- function() inv_x
  list (set = set, get = get,
        setinverse = setinverse,
        getinverse = getinverse)
}


## cache solve computes inverse by makeCacheMatrix if already calc retrieve cache from the cache

cacheSolve <- function(x, ...) {
        inv_x <- x$getinverse()
        if(!is.null(inv_x)) {
          message("getting cached inverse matrix")
          return(inv_x)
        } else {
          inv_x <- solve(x$get ())
          x$inverse(inv_x)
          return(inv_x)
        }
}
