## The following two functions provide a framework for computing the inverse
## of a matrix. After the matrix inverse is computed the result is cached for
## later retrival, avodiing potential time consuming re-computation.

## Function makeCacheMatrix:
##   The makeCacheMatrix function is an object-oriented like class with several
##   public-like methods for constructing and managing a cached matrix object. 
##   The inital call to makeCacheMatrix creates an object with an empty matrix.
##   The following methods are exposed:
##   set - constructor for a cacheMatrix object that accepts a matrix as input
##   get - returns the original matrix 
##   setsolve - constructor for storing the matrix inverse, does not actually
##              have knowledge of how a matrix inverse is calculated, just
##              stores the result of the matrix inverse computation
##   getsolve - returns the inverse of the matrix stored by a call to setsolve

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y)
    {
        x <<- y
        m <<- NULL
    }
    
    get <- function() x
    
    setsolve <- function(s) 
    {
        m <<- s
    }
    
    getsolve <- function()
    {
        m
    }
    
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


## Function cacheSolve:
## The function cacheSolve calcualtes the inverse of a matrix. If the matrix 
## inverse has already been cached the inverse is immediately returned. If 
## the matrix inverse has not been computed this function computes the matrix
## inverse (using the solve function from base) and caches the result for 
## later use.
## The cacheSolve function accepts a makeCacheMatrix object as input along with 
## additional parameters for use by the solve function. If the matrix inverse
## has been previously calculated (determined by calling the getsolve method on 
## the input object) it is immediately returned. Otherwise the matrix is 
## retreieved from the input object (via the get method), the matrix inverse is
## calculated and cached in the input object (using the setsolve method).
## 
## Note: that this function does not test if there is an inverse the matrix.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getsolve()
    if (!is.null(m))
    {
        message("getting cached data")
        return(m)
    }
    
    data <- x$get()
    m <- solve(data, ...)
    x$setsolve(m)
}
