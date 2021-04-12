##### Week 3
##### R objects and data structures
##### Single-Mode Data Structures


### Vector basics -----

## implicit coercion 
#  logical --> numeric 
x <- sample(20, 50, replace = TRUE)   
x
y <- x > 10
sum(y)      # how many are greater than 10?
mean(y)     # what proportion are greater than 10?

# sample(x, size, replace = FALSE, prob = NULL)
# If x has length 1, is numeric and x >= 1, sampling takes place from 1:x.

# sample.int(n, size = n, replace = FALSE, prob = NULL)
# The default for size is the number of items inferred from the first argument, 
# so that sample(x) generates a random permutation of the elements of x (or 1:x).
sample.int(10)


# numeric --> character
typeof(c(.295, .300, .250, .287, "zilch"))
c(.295, .300, .250, .287, "zilch")

typeof(c(TRUE, 1L))
typeof(c(1L, 1.5))
typeof(c(1.5, "a"))


## Recycling & Vectorization
sample(10) + 100    
runif(10) > 0.5#均匀分布

# What happens if you add, substract, multiply or divide two vectors of different lengths?
1:10 + 1:2
1:10 + 1:3

1:10 * 1:2
1:10 / 1:2
1:10 / 1:3



### Matrices -----

## Combining Vectors to create a matrix
cbind(1:3, 3:1, c(2, 4, 6), rep(1, 3))
#按照列来构建
cbind(1:3, 3:1, c(2, 4), 1)

rbind(1:3, 3:1, c(2, 4, 6), rep(1, 3))


## Creating a matrix with a single vector: column-major order
matrix(1:6)  #不指定按照列来构造

m <- matrix(1:12, nrow = 3, ncol = 4)
m

# equivalent to the above
matrix(1:12, nrow = 3)
matrix(1:12, ncol = 4)

# row-major order
matrix(1:12, nrow = 3, byrow = TRUE)

# create a 2x6 matrix
matrix(1:12, nrow = 2)

# create a 6x2 matrix
matrix(1:12, ncol = 2)

# matrix attributes
typeof(m)  # typeof determines the (R internal) type or storage mode of any object
mode(m) 

length(m)
dim(m)
dim(m)[1]
dim(m)[2]

nrow(m)
ncol(m)


# dimension names: age group and gender
freqMatrix <- matrix(c(75, 68, 52, 49, 38, 30), ncol = 2, byrow = TRUE)
freqMatrix

dimnames(freqMatrix) <- list(c("18-25", "26-35", "36+"), c("Female", "Male"))
freqMatrix

dimnames(freqMatrix)

freqMatrix <- matrix(c(75, 68, 52, 49, 38, 30), ncol = 2, byrow = TRUE)
rownames(freqMatrix) <- c("18-25", "26-35", "36+")
freqMatrix

colnames(freqMatrix) <- c("Female", "Male")
freqMatrix

# matrix exponential
M <- matrix(1:6, nrow = 3)
M
exp(M)

# diag(matrix)
diag(matrix(1:9, nrow = 3))

m
diag(m)

# diag(x, nrows, ncols)
diag(1:4)
diag(1,3,3)
diag(1,2,4)
diag(1:2,3,4)

# recycling 
matrix(1:4, ncol = 3, nrow = 3, byrow = TRUE)    # by default, byrow = FALSE

# "*" vs. "%*%" (matrix multiplication)
m
m*1:3

m%*%1:3
1:3%*%m


## Subscripting matrices
#  Blanks, Positives, & Negatives
m[,]

# extract rows
m[1, ]
m[1:2, ]
m[-3, ]

# extract columns
m[, 1]
m[, 1:3]
m[, -4]

# extract values from matrixes
m[1, 1]
m[3, 2]

# dropping dimensions
m[, 1]                 # Returns a vector
m[, 1, drop = FALSE]   # Use drop to maintain dimensions


## Character Values
freqMatrix[,"Female"]
freqMatrix[,"Female", drop = FALSE]

freqMatrix["18-25",]
freqMatrix[c("18-25", "36+"),]

## logical values
m[c(TRUE, FALSE, TRUE), ]

m[, 1]
m[, 1]!=2
m[m[, 1]!=2,]



### Arrays -----
##  An array is a single-mode structure that can have any number of dimensions 
##  Matrix is simply a two-dimensional array

#  Creating arrays
v <- c(4, 5, 2, 7, 6, 1, 5, 5, 0, 4, 6, 9)
v

m <- array(v, dim = c(3, 4))
m

a <- array(v, dim = c(2, 3, 2))
a

mode(a)
length(a)
dim(a)

a[,,1]
a[,,2]

a[-1,1:2,2]


## Form row and column sums and means for numeric arrays (or data frames)
#  rowSums():  row sum
#  colSums():  column sum
#  rowMeans(): row mean
#  colMeans(): column mean
m

rowSums(m)
rowMeans(m)
colSums(m)
colMeans(m)

rowSums(m[1,])
sum(m[1,])

rowSums(a[,,2])
rowSums(a) #奇怪的计算方式
