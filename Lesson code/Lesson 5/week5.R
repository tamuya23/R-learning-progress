#### Week 5
## Introuction to R graphics & colors
## Standard R plots

x <- c(1,3,4,6,8,9,12)
y <- c(5,8,6,10,9,13,12)

# Quick plotting starts like this:
plot(x,y)


## More advanced plotting, however, involves a step-wise approach:
# • Set up an empty plotting region (type="n")
# • Draw the axes
# • Draw the points or other shapes
# • Write the title(s)
# • Add regression, LOESS lines etc


############
par(tck=0.02, las=1, cex.axis=1.3, cex.lab=1.2, mgp=c(3,0.5,0), bty="L")

# par: parameter
# type="n": R Beginner p140,142
# cex: character expansion
# mgp分别对应坐标轴标题、坐标轴标签和轴线，默认值：c(3,1,0)

plot(x,y)

plot(x, y, type="n")
plot(x, y, type="n", xlab="", ylab="")

plot(x, y, type="n", axes=FALSE, xlab="", ylab="")
points(x, y, pch=16)    # pch: plot symbol#前面必须由plot，pch对应所画的点的形状
axis(1)#画上坐标轴
axis(2)
title(xlab="X-Axis", ylab="Y-Axis")
box(bty="o")#画边框bty是边框的参数


############
par(tck=0.02, las=1, cex.axis=1.3, cex.lab=1.2, mgp=c(3,0.5,0))#las 刻度轴上的标签和两条轴的防线
plot(x, y, pch=16, xlab="X-Axis", ylab="Y-Axis", bty="o")
plot(x, y, pch=18, xlab="X-Axis", ylab="Y-Axis", bty="L")


############
# You could then add a regression line to the graph by typing
abline(lm(y ~ x), col="red")


#############
## color in R

## R语言中的默认颜色
## 通过col参数自定义颜色, col参数设置的以下四种方法是等价的
## 1. 数字: 如1代表当前palette的第1种颜色，2代表当前palette的第2种颜色等
## 2. 颜色名: 如”red”, ”blue”
## 3. 使用rgb()函数得到的返回值
## 4. 使用十六进制颜色代码

barplot(1:4, col = c(2, "red", rgb(1, 0, 0), "#FF0000"))


## color palette: 调色板，简单来说就是颜色的列表
palette()
barplot(1:8, col = 1:8)
barplot(1:8, col = palette())


## R语言的色彩系统中有两大类颜色系统:一类是预设的调色板，获取任意数量的色彩组合
## R语言自带的grDevices包有5个预设(built-in)的调色板
## rainbow(n), heat.colors(n), terrain.colors(n), topo.colors(n), cm.colors(n)

## 这5个调色板排列着无数的色彩组合,取色也很简单，使用预设调色板名称+色彩个数即可：
rainbow(10)

op <- par(mfrow = c(1, 2))#一行两列
pie(rep(1, 12), col = rainbow(12), border = rainbow(12), 
    labels = "", main = "rainbow12", radius = 1.1)
pie(rep(1, 1000), col = rainbow(1000), border = rainbow(1000), 
    labels = "", radius = 1.1, main = "rainbow1000")
par(op)


## 将5个调色板的色彩过渡效果全部显示出来
op <- par(mfrow=c(1,5), mar=c(0.5,0.5,2,0.5), xaxs="i", yaxs="i")
#预设一个一行五列的空间
#mar是margin的意思，表示四个坐标轴距离边缘的距离

n <- 1000

# border是边缘线的颜色，horiz表示柱子是横着的，这边间隔很小，所以就有渐变的效果了
barplot(rep(1,n), col=rainbow(n), border=rainbow(n), 
        horiz=TRUE, axes=FALSE, main="Rainbow Color")
barplot(rep(1,n), col=heat.colors(n), border=heat.colors(n), 
        horiz=TRUE, axes=FALSE, main="Heat.Colors")
barplot(rep(1,n), col=terrain.colors(n), border=terrain.colors(n), 
        horiz=TRUE, axes=FALSE, main="Terrain.Colors")
barplot(rep(1,n), col=topo.colors(n), border=topo.colors(n), 
        horiz=TRUE, axes=FALSE, main="Topo.Colors")
barplot(rep(1,n), col=cm.colors(n), border=cm.colors(n), 
        horiz=TRUE, axes=FALSE, main="Cm.Colors")

par(op)


## 也可以将不同色盘中截取的颜色相互混合使用
op<- par(mfrow=c(2,1), mar=c(0.5,0.5,2,0.5), xaxs="i", yaxs="i")
a <- heat.colors(10)
b <- topo.colors(10)
barplot(rep(1,10), col=a, border=a, main="Heat.Colors10", axes=FALSE)
barplot(rep(1,10), col=b, border=b, main="Topo.Colors10", axes=FALSE)
par(op)

c <- c(a[c(1,3,5,7,9)], b[c(2,4,6,8,10)])
barplot(rep(1,10), col=c, border=c, axes=FALSE, main="topo&heat 10")


## 调色板是可以改变的，比如系统中的彩虹调色板(rainbow color palette)
palette(rainbow(8))
barplot(1:8, col = rainbow(8))
barplot(1:8, col = 1:8)
palette(rainbow(24))
barplot(1:24, col = rainbow(24))
barplot(1:24, col = 1:24)
## 通过再次将palette设置为”default”得到默认调色板。
palette("default")


## R中可以用英文设置的颜色有657个，可以通过colors()函数查看，或者直接运行demo(“colors”)看示例图
head(colors(), 10)
colors()[33]

# magenta: 紫红色; maroon: 紫褐色
pie(rep(1, 20), col = c("magenta","magenta1","magenta2","magenta3","magenta4",
                        "maroon", "maroon1","maroon2","maroon3","maroon4"))
pie(rep(1,30), col = colors()[10:40])
# demo("colors")


## rgb(red, green, blue, alpha, names = NULL, maxColorValue = 1)
## rgb函数接入三个取值[0,1]的数字，分别对应”red”,”green”,”blue”
## 参数alpha是用来设置透明度的，对于特别密集的散点图很有用

# rgb()函数返回的值就是十六进制颜色代码
rgb(1, 0, 0)

barplot(1:3, col = c(rgb(1, 0, 0), rgb(0, 1, 0), rgb(0, 0, 1)))

barplot(1:12, col = rgb((0:11)/11, 0, 0))
barplot(1:12, col = rgb(0, (0:11)/11, 0))
barplot(1:12, col = rgb(0, 0, (0:11)/11))


# 将颜色名称转换为RGB色彩
col2rgb(c("blue", "yellow"))


## grey()或gray()
## gray(level, alpha = NULL)
## level: a vector of desired gray levels btw 0 and 1; 0 indicates "black" and 1 indicates "white"
gray(0:5/10)
barplot(1:6, col = gray(0:5/5))
barplot(1:6, col = gray(0))
barplot(1:6, col = gray(1))


## colorRampPalette()和colorRamp(): 传入希望的主要颜色，返回一个调色板函数
## colorRampPalette()像grey()一样返回渐变调色板函数, 入参为希望返回的调色板色彩数量
## colorRamp()返回对比调色板函数，入参为[0,1]之间的数列，数列中数字个数为函数返回的调色板色彩数

## colorRamp(colors, bias=1, space=c("rgb", "Lab"), interpolate=c("linear", "spline"), alpha=FALSE)
## colorRampPalette(colors, ...)

op <- par(mfrow = c(1, 2))

bp1 <- colorRampPalette(c("blue", "purple")) #生成一个调色板函数
bp2 <- colorRamp(c("blue", "purple"))

pie(rep(1, 12), labels = "", col = bp1(12), border = bp1(12), main = "colorRampPalette")
pie(rep(1, 12), labels = "", col = bp2(seq(0, 1,length = 12)), 
    border = bp2(seq(0,1,length = 12)), main = "colorRamp")

par(op)


## RColorBrewer包 (https://colorbrewer2.org/)：实际用到的只有brewer.pal()函数
## 三类调色板: 序列型(sequential)、离散型(diverging)、分类型（qualitative)，
## 每个系列颜色数量是固定的,且颜色都比较协调
library("RColorBrewer")
require("RColorBrewer")

## 序列型调色板适用于从低到高排序明显的数据，浅色数字小，深色数字大
display.brewer.all(type = "seq")

## 离散型调色板适合有正有负、对极值和中间值比较注重的数据
display.brewer.all(type = "div")

## 分类型调色板适合区分分类型的数据
display.brewer.all(type = "qual")

display.brewer.all()



###################
## Plotting characters: an overview of R´s default plotting characters

# repeat function: rep(x, times = 1, length.out = NA, each = 1)
rep(c(1,2), 4)
rep(c(1,2), each = 4)

#文件内输出
pdf(file="~/characters.pdf", pointsize=14, width=3, height=7)

par(mgp=c(3,0.5,0), tck=0.02, cex.axis=1.1, cex.lab=1.1, las=1)

plot(rep(10, 25), 1:25,
     pch = 1:25,
     xlim = c(9, 11),
     xlab = "",
     ylab = "plotting characters")
text(rep(10.5, 25), 1:25, 1:25)
dev.off()


#################
# Use some of the above-mentioned commands to make our original plot look fancier:
op <- par(tck = 0.02,
          las = 1,               # axis labels always horizontal
          cex.axis = 1.1,
          cex.lab = 1.1,
          bty = "o",
          mgp = c(3,0.5,0),
          bg = "lemonchiffon")   # 柠檬纱色

plot(x, y, type="n", axes=FALSE, xlab="", ylab="")

# Once a plot is created, par("usr") returns a vector of the extreme coordinates of plotting region 
# These can be used to place text and legends into a corner of a plot 
# The coordinates are, in order, xleft (xl), xright (xr), ybottom (yb), and ytop (yt). 
u <- par("usr") #返回上一个图片的绘图区域
u


## rect(): draw rectangles with bottom-left corner at (xl, yb) & top-right corner at (xr, yt)
#  R Graphics p82-83
#  rect(min(x), min(y), max(x), max(y), col="gray", border = NULL)

## rect(): "col" provides the color to fill the rectangle 
##         "border" gives the color to draw the rectangle border
rect(u[1], u[3], u[2], u[4], col = rgb(191,226,248,max=255), border = "red")

# x <- c(1,3,4,6,8,9,12)
# y <- c(5,8,6,10,9,13,12)
points(x, y, pch = 16, cex = 1.3, col = rgb(102,78,145,max=255))
axis(1)
axis(2)
title(xlab="X-Axis", ylab="Y-Axis")
box(lwd=2)   #添加图形外框
abline(lm(y~x), lwd=2, col=2)   #添加趋势线

par(op)
op


## R语言内置颜色图片
ncol <- 8
id <- length(colors())
nrow <- ceiling(id/ncol)

png("RColors.png", width = 2000, height = 4000, units = "px")   #输入png的图片格式

par(mar=c(0,0,0,0))

plot(0, 0, type = "n", 
     xlim = c(0, 1), ylim = c(0, 1), 
     #axes = FALSE, 
     xlab = "", ylab = "")

rect(rep((0:(ncol - 1)/ncol), nrow), 
     sort(rep((0:(nrow - 1)/nrow), ncol), decreasing = TRUE), 
     rep(((1:ncol)/ncol), nrow), 
     sort(rep((1:nrow/nrow), ncol), decreasing = TRUE), 
     border = "grey80", 
     col = colors()[1:(nrow*ncol)])

text(rep((0:(ncol - 1)/ncol), nrow) + 0.0625,         # 1/ncol/2 = 1/8/2 = 0.0625
     sort(rep((0:(nrow - 1)/nrow), ncol), decreasing = TRUE) + 0.006,   # 1/nrow/2 = 1/83/2 = 0.006
     col = "grey20",
     paste0(1:id, "-", colors())[1:(nrow*ncol)], cex=1.5) 

dev.off()
print(paste0("Saved to ", getwd(), "/", "RColors.png"))   
