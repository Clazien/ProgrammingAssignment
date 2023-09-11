## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}



## Write a short comment describing this function

## Return a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
    i <- x$getinverse()
    if (!is.null(i)) {
        message("getting inversed data")
        return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
    i
}


## Let’s have an example

M <- matrix(c(3,2,5,4),2,2)
I <- makeCacheMatrix(M)
cacheSolve(I)

## Result

getting inversed data
     [,1] [,2]
[1,]    2 -2.5
[2,]   -1  1.5
