#### Week 6
#### Importing & Exporting Data ------


### File Navigation
##  file.choose function allows to browse and select a file to import
file.choose()

##  File > Import Dataset > From Text/Exccel/... and navigate to the file to import


### Reading in Text & CSV Files #一般返回数据框
##  read.table(): reads tabular information from a text file & returns a data frame

##  default: sep = " " (the separator is ‘white space’), header = FALSE
##  Remove any spaces from variable names or data fields before using read.table()
##  skip：number of lines of the data to skip before reading data
##  nrows: the maximum number of rows to read in


## 读入剪贴板数据
read.table(file="clipboard", sep = "\t", header = TRUE)


学生名单 <- read.table("学生名单.csv", header = TRUE, sep = ",", 
                       stringsAsFactors = FALSE)
head(学生名单)
?read.table

学生名单 <- read.table("学生名单.csv", header = TRUE, sep = ",", 
                       skip = 2, nrows = 3, stringsAsFactors = FALSE)
head(学生名单)


## read.csv(): a wrapper for read.table() with header = TRUE & sep = ","
学生名单 <- read.csv("学生名单.csv", stringsAsFactors = FALSE)
head(学生名单, 10)
?read.csv


## readr: 自动将文本读入为字符串格式，不需要设置factorAsString = FALSE，不使用行名
install.packages(c("readr","readxl"))
library("readr")
library("readxl")

# read_delim()：读取使用任意分隔符的文件 
# read_csv()：  读取逗号分隔文件 (comma-separated values)
# read_csv2()： ; for field separator and , for decimal point (read.csv2)
# read_tsv()：  读取制表符分隔文件 (tab-separated values)
# read_table(): whitespace-separated values
# read_csv() and read_tsv() are special cases of the general read_delim()
?read_delim

# skip = n: 跳过前n行
# comment = "#": 丢弃所有以#开头的行
# col_names = c(): 手动设置命名列名 (默认col_names = TRUE)
# col_names = FALSE: 不要将第一行作为列标题，而是将各列依次标注为 X1至Xn
# na = ".": 设定使用.来表示文件中的缺失值

学生名单 <- read_csv("学生名单.csv")
学生名单 <- read_csv("学生名单.csv", 
                     locale = locale(encoding = stringi::stri_enc_get()))

# stri_enc_get(): returns a string with current default character encoding
stringi::stri_enc_get()

学生名单 <- read_csv("学生名单.csv", skip = 3, col_names = "姓名",
                     locale = locale(encoding = stringi::stri_enc_get()))

# GBK主要用于中文编码，包含全部中文字符，utf8包含全世界所有国家需要用到的字符
# utf8比较灵活，长度在1-6个字节，GBK长度为2个字节，utf8比GBK占用更多的数据库存储空间


# readxl包有两个函数：一个是read_excel，用来读取excel的xls和xlsx文件
#                     另外一个是excel_sheets，用来查看excel文件中的表的名字

excel_sheets("学生名单.xlsx")

学生名单xls <- read_excel("学生名单.xlsx")
学生名单xls <- read_excel("学生名单.xlsx", skip = 3, col_names = "姓名")



### 合并数据: merge()
Sq1 <- read.table(file = "squid1.txt", header=TRUE)
head(Sq1)
Sq2 <- read.table(file = "squid2.txt", header=TRUE)
head(Sq2)

Merged <- merge(Sq1, Sq2, by = "Sample")
head(Merged)
str(Merged)

# all = TRUE：全连接，匹配不上的na也放进来
Merged <- merge(Sq1, Sq2, by = "Sample", all = TRUE)
str(Merged)



### Exporting Text Files:  
##  write.table(x, file = "", append = FALSE, quote = TRUE, sep = " ", eol = "\n",
##              na = "NA", dec = ".", row.names = TRUE, col.names = TRUE,
##              qmethod = c("escape", "double"), fileEncoding = "")

# quote = FALSE：读出时字符变量加不加引号
write.table(Merged,
            file = "MergedSquid.txt",
            sep = " ", quote = FALSE, append = FALSE, na = "NA")   

write.table(Merged,
            file = "MergedSquid.txt",
            sep = " ", quote = FALSE, append = TRUE, na = "下课了")   

write.table(Merged,
            file = "MergedSquid.txt",
            sep = " ", quote = FALSE, append = TRUE, na = "下课了", 
            col.names = FALSE)  


write.table(Merged,
            file = "MergedSquid1.txt",
            sep = " ", append = FALSE, na = "NA", row.names = FALSE)  

write.table(Merged,
            file="MergedSquid2.txt",
            sep = " ", append = FALSE, na = "NA", col.names = FALSE)

  
## write_csv(), write_tsv() & write_delim(): 默认使用UTF-8编码,不输出行名

#  write_delim(x, path, delim = " ", na = "NA", append = FALSE, col_names = !append)
#相对于write.table函数，write_delim函数默认输出列名，factor强制转化为character

write_csv(Merged, "MergedSquid.csv", na = "NA", append = FALSE, col_names = TRUE)

write_delim(Merged, "MergedSquid.txt", 
            delim = " ", na = "NA", append = FALSE, col_names = TRUE)
