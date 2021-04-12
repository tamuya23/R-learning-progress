##### Week 6
####  Functions & Flow control


####  Chapter 6: An Introduction to Functions ("A Beginner's Guide to R")

## CodParasite: presence/absence of the parasite in fish, number of parasites 
## per fish, and length, weight, age, stage, sex, and location of host fish

Parasite <- read.table(file="CodParasite.txt", header = TRUE)
str(Parasite)


## NAs
NAPerVariable <- function(X1) {
  D <- is.na(X1)
  colSums(D)
}

# 函数中最后一行代码将是返回的信息
NAPerVariable(Parasite)

  
## Zeros
ZerosPerVariable <- function(X1) {
  D1 = X1 == 0
  colSums(D1)
}
ZerosPerVariable(Parasite)


ZerosPerVariable <- function(X1) {
  D1 = X1 == 0
  colSums(D1, na.rm = TRUE)
}
ZerosPerVariable(Parasite)


# NAs or zeros
VariableInfo <- function(X1, Choice1) {
  if (Choice1 == "Zeros") {D1 = X1 == 0}
  if (Choice1 == "NAs")   {D1 <- is.na(X1)}
  colSums(D1, na.rm = TRUE)
}

VariableInfo(Parasite, "Zeros")
VariableInfo(Parasite, "NAs")
VariableInfo(Parasite)


# Add default value
VariableInfo <- function(X1, Choice1 = "Zeros") {
  if (Choice1 == "Zeros") {D1 = X1 == 0}
  if (Choice1 == "NAs")   {D1 <- is.na(X1)}
  colSums(D1, na.rm = TRUE)
}

VariableInfo(Parasite)


# Misspelling
VariableInfo(Parasite, "Zeroos")

VariableInfo <- function(X1, Choice1 = "Zeros") {
  if (Choice1 == "Zeros") {D1 = X1 == 0}
  if (Choice1 == "NAs")   {D1 <- is.na(X1)}
  if (Choice1 != "Zeros" & Choice1 != "NAs") 
     {print("You made a typo")} else {
      colSums(D1, na.rm = TRUE)}
}

VariableInfo(Parasite,"abracadabra")

# Replace the first two if commands in the function with ifelse:
ifelse(Choice1 == "Zeros", D1 <- (X1 == 0), D1 <- is.na(X1))


VariableInfo <- function(X1, Choice1 = "Zeros") {
  ifelse(Choice1 == "Zeros", D1 <- (X1 == 0), D1 <- is.na(X1))
  colSums(D1, na.rm = TRUE)
}

VariableInfo(Parasite, "Zeros")



###  Flow control

## if语句
electric1.1 <- function(usage, unitPrice = 50)
{
  net.price <- usage * unitPrice     #计算电费
  if (usage > 200) {                 #如果使用超过200度
    net.price <- net.price * 1.15    #电费加收15%
  } 
  round(net.price)                   #电费取整数
}  

electric1.1(150)
electric1.1(usage = 150)
electric1.1(usage = 250)


electric1.2 <- function(usage, unitPrice = 50)
{
  net.price <- usage * unitPrice                   #计算电费
  if (usage > 200) net.price <- net.price * 1.15   #如果使用超过200度电费加收15%
  round(net.price)                                 #电费取整数
}


## if…else语句
electric2 <- function(usage, unitPrice = 50)
{
  net.price <- usage * unitPrice       #计算电费
  if (usage > 100)                     #如果使用超过100度
     net.price <- net.price * 1.15     #电费加收15%
  else
     net.price <- net.price * 0.85     #电费减免15%
  round(net.price)                     #电费取整数
}

electric2(80)
electric2(200)


## if语句也可有返回值
electric3.1 <- function(usage, unitPrice = 50)
{
  net.price <- usage * unitPrice                   #计算基本电费
  adjustment <- if (usage > 100) 1.15 else 0.85    #计算调整比率
  total.price <- net.price * adjustment            #重新计算电费               
  round(total.price)                               #电费取整数
}

electric3.1(80)
electric3.1(200)


electric3.2 <- function(usage, unitPrice = 50)
{
  net.price <- usage * unitPrice                   #计算电费
  total.price <- net.price * if (usage > 100) 1.15 else 0.85                  
  round(total.price)                               #电费取整数
}

electric3.2(80)
electric3.2(200)


## if…else if … else if … else语句
electric4 <- function(usage, unitPrice = 50)
{
  if (usage > 120)                            #如果使用超过120度
     net.price <- usage * unitPrice * 1.15    #电费加收15%
  else if (usage < 80)                        #如果使用少于80度
     net.price <- usage * unitPrice * 0.85    #电费减免15%
  else
     net.price <- usage * unitPrice           #正常收费
  round(net.price)                           #电费取整数
}

electric4(100)
electric4(150)


VariableInfo <- function(X1, Choice1 = "Zeros") {
  if (Choice1 == "Zeros") colSums(X1 == 0, na.rm = TRUE)
  else if (Choice1 == "NAs") colSums(is.na(X1))
  else print("You made a typo")
}

VariableInfo(Parasite,"blablabaa")


## ifelse()函数

electric1.1(c(150,250))
#electric2(c(150,250))
#electric3.1(c(150,250))
#electric4(c(150,250))


ifelse(c(1,5)>3,10,1)

# rbinom(n, size, prob), Bernoulli trial (size=1)
ifelse(rbinom(10,1,0.5), "Head", "Tail")


electric5.1 <- function(usage, unitPrice = 50)
{
  net.price <- usage * unitPrice        #计算电费
  net.price = net.price * ifelse((usage > 100), 1.15, 0.85) 
  round(net.price)                    #电费取整数
}

electric5.1(c(80,200))


electric5.2 <- function(usage, poor = FALSE, unitPrice = 50)
{
  net.price <- usage * unitPrice        #计算电费
  net.price <- net.price * ifelse (usage > 100, 1.15, 0.85)
  net.price <- net.price * ifelse (usage <= 100 & poor, 0.7, 1)
  round(net.price)                      #电费取整数
}

usageinfo <- c(80,80,200,200)
poorinfo <- c(TRUE,FALSE,TRUE,FALSE)
electric5.2(usageinfo, poorinfo)


testinfo <- data.frame(usageinfo, poorinfo)
with(testinfo, electric5.2(usageinfo, poorinfo))