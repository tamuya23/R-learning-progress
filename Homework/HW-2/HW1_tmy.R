##Homework II (Due March 25 12pm, 2021)
#2020111522 
## Question 1

options(digits = 4)      #The first way(global set the digits to 17)
pi
## Question 2

#2.1
  
length<-c(75,85,91.6,95,NA,105.5,106)
length
tb<-c(0,0,1,NA,0,0,0)
tb
lengthAverage <- sum(length,na.rm=TRUE)/6
lengthAverage

#2.2
  
place<-c("MO","MO","MO","MO","LN","SE","QM")
month<-c(11,07,07,NA,09,09,11)
Boar<-cbind(place,month,length,tb)  #bind in to a matrix
Boar                                
#the cbind functions automatically change numeric into characteristic
result<-c("dim"=dim(Boar),"nrow"=nrow(Boar),"ncol"=ncol(Boar))
result

#2.3
  
m1 <- matrix(c(1,4,2,2,2,3,3,1,0),nrow=3,ncol=3)
t(m1)
m2 <- solve(m1)
m1%*%m2

## Question 3

#3.1
  
result <- c(1,1)
for (i in 1:20 ){result[i]=i*(i+1)/2}
result

#3.2
  
names(result) <- letters[1:20]
result

#3.3
  
vowel <- c("a","e","i","o","u")
outcome = result[vowel]
outcome

## Question 4

oriMat=matrix(0:99,nrow =10,byrow = TRUE) 
turnMat <- oriMat-floor(sqrt(oriMat))^2          #use floor
turnMat[turnMat!=0] <- NA                        #set the number which differs from the original one as NA
turnMat <- turnMat+oriMat                        #NA plus digits equals still NA
tapply(turnMat,rep(1:nrow(turnMat),ncol(turnMat)),function(i)i) #change into list


## Question 5
    
turnMatrix <- as.matrix(iris)       #change into matrix
delete = turnMatrix[,-5]            #delete a column
delete=apply(delete,2,as.numeric)   #change into numeric
delete
apply(delete,2,mean)
    
## Question 6
    
#6.1
      
a <- sort(islands,decreasing = TRUE)  
a[30:35]
    
#6.2
      
a <- sort(islands,decreasing = TRUE)[1:15]
b <- sort(islands,decreasing = FALSE)[1:15]
c(a,b)

#6.3
      
names(islands[seq(1,48,2)])
names(islands[seq(2,48,2)])
    
#6.4
     
a <- sort(islands)  
names(a) <- NULL  
a[seq(1,48,2)]  
a[seq(2,48,2)]
    