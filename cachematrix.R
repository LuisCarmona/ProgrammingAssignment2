## This function creates a special "matrix" object that can cache its inverse.


## The "makeCacheMatrix" function creates a special "matrix" object that can cache its inverse.
## This function also creates a special "matrix", which is a list containing
## a function to:
##   - set the value of the matrix
##   - get the value of the matrix
##   - set the value of the inverse matrix
##   - get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
      m<-NULL
     set<-function(y){
         x<<-y
         m<<-NULL
     }
     get<-function() x
     setmatrix<-function(solve) m<<- solve
     getmatrix<-function() m
     list(set=set, get=get,
         setmatrix=setmatrix,
        getmatrix=getmatrix)
}


## This "cacheSolve" function computes the inverse of the special "matrix" returned by
## "makeCacheMatrix" function above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
         m<-x$getmatrix()
     if(!is.null(m)){
         message("getting cached data")
         return(m)
     }
     matrix<-x$get()
     m<-solve(matrix, ...)
     x$setmatrix(m)
     m
 }
        
        ## Return a matrix that is the inverse of 'x'
}
