# press option + "-" to insert "<-" 
# perss cmd + return to run the current line or the selection

x = 5
print(x)
y = 3*x + 17
print(y)

cat(x)

x = 1:5
x

x = -1:-100
print(x)

x = -1:-100
cat(x)
 
x = 0:50 * 2 + 1  # 1 3 5 7 ... 101
print(x)

seq(1, 100)

seq(1, 100, 5)

seq(0, 50, 3)

seq(0, 100, 10)

?seq # get help about something
help(seq)

seq(-10)

seq(1, 100, length.out=7)

x = 1:100
y = matrix(x, nrow=10)
print(y)

y[3, 4]
y[1:5, 3:7]

y[2:4, ] # removing something in before or after comma means it is the whole range
y[,]

x[10:50]

y[1:6, -3:-10] # remove 3:10 from the whole range 

c(1,5,7) # con-cat

c(10:0,1:10) # con-cat

z = t(y) # transpose
print(z)

class(2)
class("salam")
class(1.4)

c(1, 2, "salam") # everything is casted to a shared type
class(c)

z = data.frame(Name = c("Ahmad", "Taghi", "Gholi"), Height = c(100, 200, 300), Weight = c(30, 40, 50))
print(z)

z[2,2]
class(z[,1])
class(z[1,])
class(z[,3])

ls()
rm(y)
ls()

?sum

sum(z[,2])
sum(z$Height) # both are the same

w = z
w$Height[2] <- w$Height[2] + 10
w # matrix and array are copied into each other, not refferences like python
z # z is not changed unlike python

median(hahaha = 1:10) # error because hahaha is not a variable in median
median(hohoho <- 1:10) # works fine, 1:10 is assigned to hohoho then passed to median

dim(1:10)

x <- matrix(1:10^4, nrow = 100)
dim(x)

setwd("~/SUT/Probability_Statistics/Probability_Statistics/Assignments")
x <- read.csv("cars.csv")

y = 1:50
sum(y)
var(y)

sum((y-mean(y))^2)/length(y)
sum((y-mean(y))^2)/(length(y) - 1)
var(y)

sample1 <- sample(1:5, 5)
sample1

sample1 <- sample(1:5, 7)
# Error in sample.int(length(x), size, replace, prob) : 
# cannot take a sample larger than the population when 'replace = FALSE'

sample1 <- sample(1:5, 200, replace = T)
sample1
mean(sample1)

sapply(1:100, function(i) print(i^2))

simul1 <- function(n) {
  s <- sample(0:1, n, replace = T)
  return(sum((s-mean(s))^2)/n)
}

simul2 <- function(n) {
  s <- sample(0:1, n, replace = T)
  return(sum((s-mean(s))^2)/(n-1))
}

simul1(50)

mean(sapply(1:1000, function(x) simul1(5)))
mean(sapply(1:1000, function(x) simul2(5)))

#### Data Visualization ####
plot(z[,-1]) # Scatter Plot
barplot(z[,2])

s <- rbinom(10000, 10, .3)
mean(s)
min(s)
max(s)
range(s)
hist(s)

pdf("plots.pdf")
plot(z[,-1])
barplot(z[,2])
hist(s)
dev.off()


#### 100 Histograms ####
pdf("hist100.pdf")
sapply(seq(0, 1, .01), function(p) hist(rbinom(10^5, 70, p), breaks=30))
dev.off()

#### Instaling Packages ####
install.packages(c("ggplot2", "reshape2"))
install.packages(c("reshape2"))
library(ggplot2)


### Example Data ####
data(iris)
ls()
dim(iris)
iris
plot(iris[,1:2])

ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species))+geom_point()

pdf("iris.pdf")
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species, size=Petal.Length))+geom_point()
dev.off()
