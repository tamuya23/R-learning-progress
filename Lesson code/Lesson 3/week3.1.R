##### Week 3
##### R objects and data structures


## Four standard data types or “modes” (模式)
4 + 5    # numeric

"Hello"  # character

4 > 5    # logical (is 4 greater than 5)

3 + 4i   # complex

## mode(): get or set the type or storage mode of an object
X <- 4 + 5 
mode(X)
typeof(X)

X <- 4L + 5L 
mode(X)
typeof(X)

X < 10 
mode(X < 10)


## Vector basics -----

# Combining elements with the c function
numVector <- c(2, 6, 8, 4, 2, 9, 4, 0)
numVector
mode(numVector)

chaVector <- c("Hello", "There")
chaVector
mode(chaVector)

logVector <- c(FALSE, TRUE, TRUE, FALSE, FALSE, TRUE)
logVector
mode(logVector)

comVector <- c(3+4i, 5+9i, 3+7i)
comVector
mode(comVector)


## Creating a sequence of numeric values with the seq function
seq(1, 10)
1:10

seq(1, 10, by = 0.5)
seq(5, -5, by = -2)

seq(1.3, 8.4, by = 0.3)
seq(1.3, 8.4, length = 10)

c(0:4, 5, 4:0)
2*1:10


## Creating a sequence of repeated Values
X <- 1:10
c(X, X, X, X)
rep(X, 4)
rep(1:10, 4)

rep("Hello", 5)

rep(c("A", "B", "C"), c(4, 1, 3))
rep(c("A", "B", "C"), c(3, 3, 3))

# rep(x, times = 1, length.out = NA, each = 1)
rep(c("A", "B", "C"), 3)
rep(c("A", "B", "C"), each = 3)
rep(c("A", "B", "C"), ,, 3)

# Every vector has three key properties:
# Its type/mode, which you can determine with typeof() or mode():
typeof(letters)
typeof(1:10)
mode(1:10)

# Its length, which you can determine with length():
x <- c("a", "bc", "defg")
length(x)

# You can explicitly manipulate the length of a vector through the length attribute
length(x) <- 5
x
length(x) <- 10
x

# Its element names, which you can query using names()
names(x)

genderFreq <- c(24, 17)
genderFreq
names(genderFreq) <- c("Female", "Male")
genderFreq 

names(genderFreq) <- NULL
genderFreq 

genderFreq <- c(Female = 24, Male = 17)
genderFreq 


## Numeric vectors: 
#  Double (In R, numbers are doubles by default)
#  Integer (place a L after the number)
typeof(1)
typeof(1L)
1.5L

## Double vs. Integer
x <- sqrt(2)^2
x
identical(x-2,0)
x - 2

# month.name是系统内建的一个数据集
month.name

month.data <- c(31,28,31,30,31,30,31,31,30,31,30,31)
names(month.data) <- month.name
month.data


## Logical vectors
#  only three possible values: FALSE, TRUE, and NA
#  usually constructed with comparison operators
1:10 %% 3 == 0
c(TRUE, TRUE, FALSE, NA)


## Character vectors: 
# length()统计向量长度（向量元素的个数）；nchar()统计向量元素的字符个数
x <- c("Hello", "World", "!")
x
length(x)#是否存在
nchar(x)#里面的元素是否有

length("")
nchar("")

# tolower(), toupper(), chartr()
DNA <- "AtGCttACC"
tolower(DNA)
toupper(DNA)
chartr("Tt", "Uu", DNA)


## Subscripting or Subsetting Vectors
## Extract subsets of data from a vector using square brackets [ ]
#  Subsetting with positive integers keeps the elements at those positions: 
x <- c("one", "two", "three", "four", "five")
x[]
x[c(3, 2, 5)]

# By repeating a position, you can actually make a longer output than input:
x[c(1, 1, 5, 5, 5, 2)]

# Negative values drop the elements at the specified positions:
x[c(-1, -3, -5)]

# It’s an error to mix positive and negative values:
x[c(1, -1)]

# Exclude values from a vector based on another vector
outlier <- c(1,4)
x[-outlier]


# Subsetting with a logical vector keeps all values corresponding to a TRUE value
x <- c(10, 3, NA, 5, 8, 1, NA)
mean(x)

x[!is.na(x)]  # All non-missing values of x  #na也可以做索引
mean(x[!is.na(x)])

mean(x, na.rm=TRUE)

x[x %% 2 == 0]  # All even (or missing!) values of x (%%: 余数)
x[x > 2] 
x[x > 2 & x <= 6]
x[x < 2 | x >= 6]

# If you have a named vector, you can subset it with a character vector:
x <- c(abc = 1, def = 2, xyz = 5)
x[c("xyz", "def")]

# 列出天数为30天的月份
month.data
names(month.data[month.data == 30])
