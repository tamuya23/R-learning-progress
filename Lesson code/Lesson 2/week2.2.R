##### Week 2
##### R对象（object）命名 & R的基本数学运算


# R语言是一门松散的面向对象（object-oriented）编程语言
# Everything has a name and can be classified into different types of “objects” 
# For example, “data” objects, “function” objects, “statistical model” objects & "graph" objects


## 对象命名原则
# R的基本命名规则包括以下几点：
# 1）对象名称只能包含字母、数字、底线（“_”）和点号（“.”）
# 2）对象名称开头必须是英文字母或点号（“.”），当以点号（“.”）开头时，接续的第二个字母不可是数字
# 3）下列名称是R语言的保留字，不可当作是对象名称
#    break, if, else, TRUE, FALSE, for, function, Inf, NA, NaN, next, repeat, return, while
# 4）R对英文字母大小写是敏感的(case sensitive)，所以basket与Basket会被视为两个不同的对象

## 在名称中间加上点号（“.”），又称点式风格（Dotted Style），R语言的许多函数采用此点式命名
## 驼峰式（Camel Case）：组成对象名称的每一个英文字母开头大写，如my.First.R.Course


## 基本数学运算
# 四则运算: R 的四则运算是指加（ + ） 、减（ - ） 、乘（ * ）和除（ / ）

# 余数和整除:
# 余数（mod）所使用的符号是“%%”，可计算出除法运算中的余数
# 整除所使用的符号是“%/%”，指在除法运算中只保留整数部分
# x == y *(x %/% y) + (x %% y)
x <- 9 %% 5
x

x <- 9 %/% 2
x

# 次方的符号是“**”或“^”，平方根的计算是使用函数sqrt()
(x <- 3 ** 2)
(x <- 3 ^ 2)
(x <- sqrt(64))

# 绝对值的函数名称是abs()
(x <- abs(-5))

# exp()是指自然数e的x次方
x <- exp(1)
x

# 以自然数e为底的对数: log()
# 以10为底的对数: log10()
# 以2为底的对数: log2()
# 以m为底的对数，logm(x): log(x, m)

1.28e4
3.65e-3

# 可以直接使用科学符号执行四则运算
6e5 / 3e2

# 圆周率
pi

# R 语言提供许多的三角函数
# sin()、cos()、tan()、asin()、acos()、atan()、sinh()、cosh()、tanh()、asinh()、acos()、atan()

# 四舍五入函数: round(x, digits = k)，表示将实数x，以四舍五入方式，计算至第k位小数
round(98.5623, digits = 2)
round(98.5623, 2)

# 使用round()函数时，如果第2个参数是负值，表示计数是以四舍五入取整数
# 例如，若参数是“-2”，表示取整数至百位数。若参数是“-3”， 表示取整数至千位数
round(1234,-2)
round(1234,-3)


# signif(x, digits = k)，也是一个四舍五入的函数，其中x是要做处理的实数，k是有效数字的个数
# signif(79843.597, digits = 6)，代表取6个数字，从左边算第7个数字以四舍五入的方式处理
signif(79843.597, 6)


# R语言有3个近似函数
# floor(x)：可得到小于等于x的最近整数
floor(234.56)
floor(-234.56)

# ceiling(x)：可得到大于等于x的最近整数
ceiling(234.56)
ceiling(-234.56)

# trunc(x)：可直接取整数
trunc(234.56)
trunc(-234.56)

# factorial(x)：返回 x的阶乘
factorial(7)

# cumulative calcualtion: cumsum(), cumprod(), cummin(), cummax()
cumsum(1:10)
cumprod(1:10)
cummin(c(3,6,1,7))
cummax(c(3,6,1,7))

# Logical comparison: <, <=, >, >=, ==, !=


## R语言控制运算的优先级
# 当 R语言碰上多种计算同时出现在一个指令内时，除了括号“（）”最优先外，其余计算优先次序如下
# 1） 指数
# 2） 乘法、除法、求余数（%%）、求整数（%/%），依照出现顺序运算
# 3） 加法、减法，依照出现顺序运算

# R 语言可以处理无限大的值，使用Inf表示，如果是负无限大则是-Inf
5 / 0
999 / Inf 
999 / -Inf 

# 在其他程序语言中，TRUE和FALSE被称为布尔值（Boolean Value），但在R语言中称为逻辑值（Logical Value）
is.infinite(10 - Inf)
is.infinite(10 + Inf)
is.infinite(1e100)

is.finite(1e100)

# 在R语言中，Not a Number（NaN）可以解释为非数字或无定义数字
Inf / Inf

# R 语言将NaN当作一个数字，可以使用NaN参加四则运算，但所得结果均是NaN
NaN + 999

# 使用is.nan（）函数可检测x是否为NaN，如果是则返回TRUE，否则范围FALSE
is.nan(Inf/Inf)
is.nan(999)

is.finite(NaN)
is.infinite(NaN)

# Not Available称为缺失值NA，可以将NA当作一个有效数值应用在四则运算中，通常计算结果是NA
# NA represents an unknown value so missing values are "contagious"; 
# almost any opreation invloving an unknow value will also be unknown
NA + 100

# is.na（x）函数可判断x是否为NA，如果是则返回TRUE，否则返回FALSE
is.na(Inf/Inf)
is.na(NA!=NA)