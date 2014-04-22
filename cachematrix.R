## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function


makeCacheMatrix <- function(x = matrix()) {
  
## assigning NULL to variable inv (current environment)
      inv <- NULL 

## set value of matrix
      set <- function(y){

## assignes value y from parent environment      
      x <<- y
      
## search through parent environments for an existing definition of variable inv and set to NULL
      inv <<- NULL
   }
  
## get matrix value cached with set
  get <- function()x

## cached value of inverse matrix is saved in inv
  setInverse <- function(inverse) inv <<- inverse

## initialisation of inverse value of inv
  gettInverse <- function() inv 

## creates a list for the respective functions
      list(set = set, get = get, 
       setInverse = setInverse, 
       getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
## if any inverse has already been calculated, the value will be initialised
          inv <- x$getInverse()
          
## checks if the variable cacheSolve has run before
          if (!is.null(inv)) {
            
## creates a message and returns the cached data 
          message("getting cached data")
          return(inv)
        }

## get the value of the input matrix
        matrix <- x$get()
        
## calculate the inverse of the matrix
        inv <- solve(matrix,...)
        
## run the setinverse function on inv to cache inv
        x$setInverse(inv)
        
## returns the inverse saved in variable inv
        inv
    }

