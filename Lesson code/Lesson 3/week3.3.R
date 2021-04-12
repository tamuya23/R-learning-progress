##### Week 3
##### R objects and data structures
##### Multi-Mode Data Structures


### Lists: Recursive Vectors ---

## Creating an empty list
emptyList <- list()
emptyList


## Creating a non-empty list
v <- c(5, 7, 8, 2, 4, 3, 9, 0, 1, 2)
m <- matrix( LETTERS[1:6], nrow = 3)

unnamedList <- list(v, m)
unnamedList


## Creating a list with element names
namedList <- list(VEC = v, MAT = m)
namedList

namedList <- list(VEC = c(5, 7, 8, 2, 4, 3, 9, 0, 1, 2), 
                  MAT = matrix( LETTERS[1:6], nrow = 3))
namedList


## List attributes
length(emptyList)
length(namedList)

names(emptyList)
names(namedList)

mode(emptyList)
mode(namedList)


## Subscripting lists
## Subsetting the List

namedList[ ]

subList <- namedList[1]      # Return first element
subList

length(subList)
class(subList)

# class():  the type of objects
# mode():   the type of data held in an object
# typeof(): the (R internal) type or storage mode of objects

M
class(M)
mode(M)
typeof(M)

namedList[-1]
namedList[c(FALSE, TRUE)]
namedList["MAT"]


## Reference list elements
#  [[]]: directly reference the objects within list & drop names
namedList[[1]]
namedList[[2]]

namedList[1]


# Referencing named elements with $
namedList$VEC
namedList$MAT


## Adding list elements
#  Directly adding an element with a specific name or in a specific position
emptyList[[1]] <- LETTERS[1:5]   # Add an element
emptyList

emptyList <- list()              # Recreate the empty list
emptyList$ABC <- LETTERS[1:5]    # Add an element
emptyList

emptyList[[3]] <- "Hello"
emptyList


#  Combing lists together
list1 <- list(A = 1, B = 2)      # Create list1
list2 <- list(C = 3, D = 4)      # Create list2
c(list1, list2)                  # Combine the lists


## Motivation for lists
## Perform a T-Test
test <- t.test(1:10, y = c(7:20)) 
test                       

class(test)
mode(test)
names(test)
?t.test

test$estimate
test$null.value
test$p.value
test$method

print.default(test)



### Data frames -----
##  A data frame is a named list with a number of constraints: can only hold same-length vectors
##  individual*variable table

# create a data frame
weather <- data.frame(Day = c("Saturday", "Sunday", "Monday", "Tuesday", "Wednesday"),
                      Date = c("Jul 4", "Jul 5", "Jul 6", "Jul 7", "Jul 8"),
                      TempF = c(75, 86, 83, 83, 87),
                      stringsAsFactors = FALSE)
weather

# Number of columns
length(weather)   

# 分别使用names()和colnames()函数查询数据框的列名
names(weather)
colnames(weather)

# 使用row.names()函数查询行(row)的名称
row.names(weather)

# 将数据框weather的第一列的列名改为“星期"
names(weather)[1] <- "星期"
names(weather)

# 一次性更改所有weather数据框的列名
names(weather) <- c("星期","日期","华氏温度")
weather

# str() focuses on the structure, not the contents
str(weather)


## Selecting Columns from data frame
weather[[3]]          # The “third” column
weather$华氏温度      # The “TempF” column

weather[3]
weather[-3]

# 如果使用X[n]方式也可取得X对象的第n列，但返回的是数据框
# 如果使用X[-n]方式，则表示取得X对象的非第n列，返回的也是数据框
# 对于数据框X而言，当使用X[,n]时，所得结果是一个向量


## Adding Columns from data frame
weather$摄氏温度 <- round((weather$华氏温度 - 32) * 5/9)
weather


## Subscripting columns
weather$华氏温度[]        # All values of 华氏温度 column
weather$华氏温度[1:3]     # First 3 values of the 华氏温度 column
weather$华氏温度[-(1:3)]

weather$华氏温度[c(FALSE, TRUE, FALSE, FALSE, TRUE)]
weather$华氏温度[weather$华氏温度 > 85]
weather$Day[weather$华氏温度 > 85]


## 若想取得数据框的值，可以将数据框当做矩阵处理
nrow(weather)
ncol(weather)

weather[,]

weather[,"星期"]
weather[,1]

weather[1:4,]

weather[1:4, 1:3]
weather[-1,-3]

weather[c(FALSE, TRUE, FALSE, FALSE, TRUE),]
weather[weather$华氏温度 > 85,]
weather[weather$星期!="Sunday",]

weather[weather$华氏温度 > 85, c("星期", "摄氏温度")]


## 使用rbind()函数增加数据框的行数据
weather.new <- rbind(weather, c("Thursday", "Jul 9", 89, 32))
weather.new

# 使用索引值增加数据框的行数据
weather.new[c("7", "8"),] <- c("Thursday", "Friday", "Jul 10", "Jul 11", 90, 95, 32, 34)
weather.new


## 使用cbind()函数增加数据框的列数据
weather.new$城市 <- "上海"
weather.new

# 为weather.new增加两个列数据
天气 <- c("小雨", "大雨", "多云", "多云", "晴", "晴", "阴", "小雨")
空气质量 <- c("良", "良", "良", "轻度污染", "轻度污染", "中度污染", "良", "良")
info <- data.frame(天气, 空气质量)
weather.new <- cbind(weather.new, info)
weather.new


## 将矩阵（matrix）转化为数据框
m <- matrix(c(1, 2, 3, 4), nrow = 2)
mm <- data.frame(m)
mm
str(mm)

mm <- data.frame(t(m))
mm
str(mm)