#################################
##### Homework 2: Solutions -----

rm(list = ls())


#### Question 1: Display the value of pi to 16 significant digits.

# options(): allow the user to set and examine a variety of global options which 
#            affect the way in which R computes and displays its results

op <- options()

options("digits")
getOption("digits")

options(digits=16)
pi

round(pi, digits=15)
signif(pi, 16)

options(op)      # reset (all) initial options

# format(): format an R object for pretty printing
format(pi, digits = 16)

## end of Q1 ----



#### Question 2
## Q2.1
lengthCT <- c(75,85,91.6,95,NA,105.5,106)      # NA stands for missing data
TB <- c(0,0,1,NA,0,0,0)
ave.lengthCT <- mean(lengthCT, na.rm = TRUE)   # 用na.rm计算时去除NA的影响
ave.lengthCT

## Q2.2
farm <- c("MO","MO","MO","MO","LN","SE","QM") 
month <- c(11,07,07,NA,09,09,11)
Boar <- cbind(month, lengthCT, TB)             # cbind组合三个向量并赋值给Boar
class(Boar)                                    # matrix
Boar

Boar[5,3]   # 尝试提取元素：row=5，col=3
dim(Boar)
nrow(Boar)
ncol(Boar)

## Q2.3
D <- matrix(c(1,4,2,2,2,3,3,1,0), nrow = 3)
D

transD <- t(D)  # 转置矩阵
transD

invD <- solve(D)  # 逆矩阵
invD

D%*%invD
round(D%*%invD)

## end of Q2 ----



#### Question 3
n <- 1:20
tri.number <- n*(n+1)/2

names(tri.number) <- letters[n]
tri.number

tri.number[c("a","e","i","o","u")]
tri.number[c("a","e","i","o")]

subset(tri.number, names(tri.number)=="a"|
                   names(tri.number)=="e"|
                   names(tri.number)=="i"|
                   names(tri.number)=="o"|
                   names(tri.number)=="u")

## end of Q3 ----



#### Question 4
## method 1
square.number <- list(a=c(0,1,4,9),b=16,c=25,d=36,e=49,f=NA,g=64,h=NA,i=81,g=NA)
str(square.number)


## method 2
m <- matrix(0:99, nrow = 10)
m

square.number <- list()

for (i in 1:ncol(m))
{
     index <- as.integer(sqrt(m[,i]))==sqrt(m[,i])
     ifelse(sum(index) > 0,
            square.number[[i]] <- m[index,i],
            square.number[[i]] <- NA)
}
str(square.number)


## method 3
square.number <- list()
square.number <- c()

for(i in 0:9)
{
  x <- 0:9+i*10
  x <- x[sqrt(x)%%1 == 0]                  # %%: 余数
  if (length(x) == 0)  x <- NA
  square.number<-c(square.number, list(x))
}
str(square.number)

## end of Q4 ----



#### Question 5
head(iris)
str(iris)

iris.num4 <- iris[,1:4]
iris.num4 <- iris[,-5]
str(iris.num4)
colMeans(iris.num4)

## end of Q5 ----



#### Question 6
islands
str(islands)

## Q6.1
sort(islands, decreasing = TRUE)[30:35]       # 降序排列第30到第35名的岛名称和面积
rev(sort(islands))[30:35]

## Q6.2 
sort(islands, decreasing = TRUE)[1:15]        # 前15大的岛名称和面积（降序）
head(sort(islands, decreasing = TRUE), 15)

sort(islands)[1:15]                           # 后15大的岛名称和面积（升序）
head(sort(islands), 15)
tail(sort(islands, decreasing = TRUE), 15)    # 后15大的岛名称和面积（降序）

## Q6.3
names(islands[1:length(islands) %% 2 == 1])   # 奇数位的岛名称
names(islands[1:length(islands) %% 2 == 0])   # 偶数位的岛名称

## Q6.4
islands.noname <- islands
names(islands.noname) <- NULL
islands.noname[1:length(islands) %% 2 == 1]   # 奇数位的岛面积
islands.noname[1:length(islands) %% 2 == 0]   # 偶数位的岛面积

## end of Q6 ----