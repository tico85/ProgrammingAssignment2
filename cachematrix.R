## These two functions combined will return the inverse of a solvable matrix, returning
## the value from the cache if it is availble there. 

## This function clears the existing cache and sets a list of functions that will be used
## to resolve the CacheSOlve funtion

makeCacheMatrix <- function(x = matrix()) {

    imatcache<<- NULL
    
    get <- function() x 
    setimatrix <- function(imat) imatcache <<- imat 
    getimatrix <- function() imatcache 
    list(get = get,
         setimatrix = setimatrix,
         getimatrix = getimatrix)

    }



## This function returns the inverse of a matrix, returning it from the cache if it is
## available 

cacheSolve <- function(x, ...) {
        
    
    imatcache <- x$getimatrix()
    if(!is.null(imatcache)){
        message("Inverted Matrix Returned from cache")
        return(imatcache)
    }
    calc<-x$get()
    traccalc<<-x$get()
    imat <- solve(calc)
    x$setimatrix(imat)
    imat
    
}

