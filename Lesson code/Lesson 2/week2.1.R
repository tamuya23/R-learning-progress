#######################################
#1:10%%####   Use R for the First Time   ####
#######################################

print("Hello! R")
print("Hello! R", quote = FALSE)

cat("Hello! R")    # Concatenate


# 有些计算机语言，变量在使用前要先定义，R语言则不需先定义，可在程序中直接设定使用
x <- 5
x

a <- print("Hello! R")
a
class(a)

# 在 Workspace窗口中，如果单击“Environment”标签，则可以看到至今所使用的对象变量及此对象变量的值

# 若在Console窗口输入ls()，可以列出目前Environment所记录的所有对象变量
ls()

# 增加对象变量y、z，并设定对象变量y等于10，对象变量z值等于对象变量x 加上对象变量y
y <- 10
z <- x + y
ls

# 此时在 Console窗口输入ls()，可以看到有4个对象变量: a,x,y和z
ls()

# 使用R时，如果某个对象变量不再使用，则可以使用rm()函数，将此对象变量删除
rm(a,z)
ls()
objects()


# 使用save()函数保存工作成果
save(x, y, file="xyvar.rda")

# 使用load()函数，直接下载先前保存的值
# 也可以直接单击RStudio窗口右下方Files/Plots窗口的“xyvar.rda”文件
load("xyvar")

# save.image()函数可以将整个Workspace（对象变量和对象变量的值）保存在系统默认的“.RData”文件内
save.image()

# 移除Workspace中的所有对象
rm(list=ls())
# rm(list=objects())


## 启动 RStudio后，基本上所有执行过的命令均会被记录在Workspace窗口的History标签选项内
# To Console：将所单击的命令，重载到Console窗口
# To Source：将所单击的命令，重载到Source Editor窗口

# 如果你想将此历史记录保存，可以使用savehistory()函数，然后此历史记录会被存入“.Rhistory”文件内
# 你可以通过查看RStudio窗口右下方的 Files/Pilots窗口，看到此文件

# 将历史文件储存至“week2.1.Rhistory”文件内
savehistory(file="week2.1.Rhistory")

# 加载“.Rhistory”
loadhistory()
loadhistory(file="week2.1.Rhistory")

# 搜索路径
search()
searchpaths()

# 在 Console窗口，输入q()，来结束使用RStudio
q()


#############################################
#### RStudio Projects
## R experts keep all the files associated with a project together: 
## input data, R scripts, analytical results, figures. 
## This is such a wise and common practice that RStudio has built-in support for this via projects.

# Set your working directory
setwd("D:\\R\\R语言课程")
setwd("D:/R/R语言课程")


## Click File → New Project, then click "New Directory" and "New Project". 

# Check that the “home” directory of your project is the current working directory:
getwd()

# Inspect the folder associated with your project — notice the .Rproj file. 
# Quit RStudio. Double-click that file to reopen the project.


# 单击储存按钮，也可以执行RStudio的File/Save As命令，选择适当的文件夹，再输入适当的文件名
# 此例的命件名是week2.1，R语言默认的文件名扩展名是R


# "~" is a convenient shortcut to your home directory: relative path
setwd("~/Week 2")

# source("filename"): 在当前会话中执行一个脚本;如果文件名中不包含路径，R假设此脚本在当前工作目录中
# 在RStudio的Source Editor区有“Source”标签
# 如果这时单击此标签，这个动作被称为Sourcing a Script
# 其实这就是执行Source Editor工作区的程序（这个动作也会同时储存程序代码）

# source('~/week2.1.R', encoding = 'UTF-8')
# source('~/week2.1.R')
