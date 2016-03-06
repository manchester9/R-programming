# makeCacheMatrix(): creates a special “matrix” object that can cache its inverse.
# cacheSolve(): computes the inverse of the “matrix” returned by makeCacheMatrix(). 
# If the inverse has already been calculated and the matrix has not changed, it’ll retrieves the inverse from the cache directly.


# makeCacheMatrix returns a list containing the below functions:
# 1. set the matrix
# 2. get the matrix
# 3. set the inverse
# 4. get the inverse

makeCacheMatrix <- function(x = matrix()) {
	matrixInverse = NULL
	set = function(y) {
		x <<- y
		matrixInverse <<- NULL
	}
	get = function() x 
	setMatrixInverse = function(matrixInverse2) matrixInverse <<- matrixInverse2
	getMatrixInverse = function() matrixInverse
	list(set = set, get = get, setMatrixInverse = setMatrixInverse, getMatrixInverse = getMatrixInverse)
}

# cacheSolve calculates the inverse of the matrix created in makeCacheMatrix
# If the inverted matrix does not exist in cache, it is created in the working environment and
# its inverted value is stored in cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	i1 = x$getMatrixInverse() 
	if(!is.null(i1)) {
	message("getting cached data")
	return (i1)
	}
	data = x$get()
	matrixInverse = solve(data,...)
	x$setMatrixInverse(matrixInverse)
	matrixInverse
}
