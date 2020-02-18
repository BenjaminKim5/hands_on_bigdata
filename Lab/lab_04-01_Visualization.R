##
## lab_04_01.R : Visualization 
##
## update: 20.02.18

# remove.packages(c("ggplot2", "data.table"))
# install.packages('ggplot2', dep = TRUE)
# install.packages('data.table', dep = TRUE)

# install.packages("ggplot2")
library(ggplot2)

## Step 1:
data(ChickWeight)
h <- ggplot(ChickWeight, aes(x=Time, y=weight, colour=Diet))
h + geom_smooth(alpha=.4, size=3)

## Step 2:
h <- ggplot(ChickWeight, aes(x=Time, y=weight, colour=Diet))
h + geom_point(alpha=.3) + geom_smooth(alpha=.2, size=1)

## Step 3:
h <- ggplot(subset(ChickWeight, Time==21), aes(x=weight, colour=Diet))
h + geom_density()

## Step 4:
data(mtcars)
p <- qplot(wt, mpg, colour=hp, data=mtcars)
m <- mtcars[1:10,]
p %+% m

c <- ggplot(mtcars, aes(factor(cyl)))
## 4-1
c + geom_bar()

## 4-2
c + geom_bar(fill = "red")

## 4-3
c + geom_bar(colour ="red")

## 4-4
c + geom_bar(fill="white", colour="red")

## 4-5
k <- ggplot(mtcars, aes(factor(cyl), fill = factor(vs)))
k + geom_bar()

## Step 5:
data(movies)
m <- ggplot(movies, aes(x = rating))
m + geom_histogram()

m <- ggplot(movies, aes(x = rating))
m + geom_histogram(aes(fill = ..count..))

data(economics)
b <- ggplot(economics, aes(x = date, y = unemploy))
b + geom_point(colour="red")

library(reshape2)
library(plyr)
rescale01 <- function(x)(x - min(x))/diff(range(x))
ec_scaled <- data.frame(date = economics$date, colwise(rescale01)(economics[,-(1:2)]))
ecm <- melt(ec_scaled, id="date")
f <- ggplot(ecm, aes(date, value))
f + geom_line(aes(linetype = variable))

df <- data.frame(x = rnorm(5000), y = rnorm(5000))
h <- ggplot(df,aes(x,y))
h + geom_point(alpha=1/10)

p <- ggplot(mtcars, aes(wt, mpg))
p + geom_point(aes(shape=factor(cyl)), size=4)
               
w <- ggplot(diamonds, aes(clarity, fill = cut))
w + geom_bar(aes(order=desc(cut)))

df2 <- data.frame(x = 1:5, y = 1:25, z = 1:25)
s <- ggplot(df2, aes(x = x, y = y))
s + geom_point(aes(shape=z), size = 4) + scale_shape_identity()

d <- ggplot(diamonds, aes(carat, price))
d + stat_bin2d(bins = 25, colour = "grey50") 

#googleVis
# install.packages("googleVis")
library(googleVis)
data(Fruits)
M2 <- gvisMotionChart(Fruits, idvar="Fruit", timevar="Date",
                      date.format = "%Y%m%d") 
plot(M2)

## END ##  


