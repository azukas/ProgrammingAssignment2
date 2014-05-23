# R commands to test the CacheMatrix object
# Need to source the file cachematrix.R first before running these commands
b <- 5
A <- matrix(trunc(rnorm(b*b)*100), b,b)   # Create a test matrix
s <- makeCacheMatrix()     # Make the CacheMatrix object
s$set(A)                   # Assign a matrix to the CacheMatrix object
print(s$get())
# Should respond with something like the following:
# [,1] [,2] [,3] [,4] [,5]
# [1,]   99  -88  -64 -117  -65
# [2,] -179 -107   30   -9   75
# [3,]  -24  -55  225  137  -72
# [4,]   54   -2  -12   61 -102
# [5,]  110   -2   14   -3    9
print(s$getsolve())
# Shoudl respond with NULL; we have not yet cached the object created with makeCacheMatrix
cacheSolve(s)   # cache the matrix associated with "s"
print(s$getsolve())
# Should respond with something like the following:
# [,1]          [,2]          [,3]         [,4]         [,5]
# [1,] -0.0001435148  0.0002051036 -0.0005383524  0.001394498  0.008751801
# [2,] -0.0015111877 -0.0082647505  0.0008677325 -0.006495153 -0.008711081
# [3,]  0.0022023343 -0.0043613122  0.0054101602 -0.008747287 -0.003604624
# [4,] -0.0064303747  0.0062601439 -0.0026618170  0.011442385  0.009776368
# [5,] -0.0041510616  0.0045275453 -0.0025303848 -0.001066214  0.011074837