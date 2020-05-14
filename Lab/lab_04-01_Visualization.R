##
## lab_04_01.R : Visualization 
##
## update: 20.02.18
## update: 20.05.15

# remove.packages(c("ggplot2", "data.table"))
# install.packages('ggplot2', dep = TRUE)
# install.packages('data.table', dep = TRUE)

# install.packages("ggplot2")
library(ggplot2)

##  Chicken weight
## 
##  ChickWeight dataset is a data frame 
##   = 병아리들의 무게 데이터
##  어린 병어리들에게는 각각 특정한 식단이 주어집니다.
##  다이어트(Diect)에는 네 가지 유형이 있으며 농부는 병아리중 
##  어느 것이 병아리를 가장 빠르게할지 알고 싶어한다.
##   


  #'ChickWeight'라는 데이터를 사용하겠다는 명령어
  data(ChickWeight) 
  View(ChickWeight)

  ## Step 1: Time vs weight / Diect 
  ##  geom_smooth(추세선)
  #ggplot(ChickWeight, aes(x=Time, y=weight, colour=Diet)) + geom_smooth(alpha=.4, size=3)
  h <- ggplot(ChickWeight, aes(x=Time, y=weight, colour=Diet))
  h + geom_smooth(alpha=.4, size=3)
  
  
  ## Step 2: Time vs weight / Diect
  ##  geom_point(산점도 / 산포도)
  h <- ggplot(ChickWeight, aes(x=Time, y=weight, colour=Diet))
  h + geom_point(alpha=.3) + geom_smooth(alpha=.2, size=1)
  
  ## Step 3: Time = 21 
  ##  geom_density(커널밀도)
  h <- ggplot(subset(ChickWeight, Time==21), aes(x=weight, colour=Diet))
  h + geom_density()

##  Motor Trend Card 
## 
##  mtcars dataset is a data frame 
##   = Motor Trend Card Road Tests
##  Motor Trend US magazine(1974)에 실린 데이터
##  
  
  ## Step 4:
  data(mtcars)
  View(mtcars)
  
  p <- qplot(wt, mpg, colour=hp, data=mtcars)
  m <- mtcars[1:10,]
  p %+% m

  ## 실런더
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

##  The internet movie database, http://imdb.com/
## 
##  movies dataset is a data frame 
##   = internet movie database
##  
##  
  ## Step 5:
  install.packages("ggplot2movies")
  library(ggplot2movies)
  
  data(movies)
  View(movies)
  
  # 사용자 평가
  m <- ggplot(movies, aes(x = rating))
  m + geom_histogram()
  
  m <- ggplot(movies, aes(x = rating))
  m + geom_histogram(aes(fill = ..count..))

##  US economic time series
## 
##  economics dataset is a data frame 
##   = internet movie database
##  
##  
  ## Step 6:
  data(economics)
  View(economics)
  
  # 실업의 중간 기간 (주별)
  b <- ggplot(economics, aes(x = date, y = unemploy))
  b + geom_point(colour="red")

##
##
##
  
  library(reshape2)
  library(plyr)

  ## function 선언
  rescale01 <- function(x)(x - min(x))/diff(range(x))

  ec_scaled <- data.frame(date = economics$date, 
                          colwise(rescale01)(economics[,-(1:2)]))
  ecm <- melt(ec_scaled, id="date")
  
  f <- ggplot(ecm, aes(date, value))
  f + geom_line(aes(linetype = variable))
  
  ##
  df <- data.frame(x = rnorm(5000), y = rnorm(5000))
  h <- ggplot(df,aes(x,y))
  h + geom_point(alpha=1/10)
  
  p <- ggplot(mtcars, aes(wt, mpg))
  p + geom_point(aes(shape=factor(cyl)), size=4)
                 
  w <- ggplot(diamonds, aes(clarity, fill = cut))
  w + geom_bar(aes(order=desc(cut)))

  ##  
  df2 <- data.frame(x = 1:5, y = 1:25, z = 1:25)
  s <- ggplot(df2, aes(x = x, y = y))
  s + geom_point(aes(shape=z), size = 4) + scale_shape_identity()
  
  d <- ggplot(diamonds, aes(carat, price))
  d + stat_bin2d(bins = 25, colour = "grey50") 

#googleVis
# install.packages("googleVis")
  library(googleVis)

  data(Fruits)
  View(Fruits)
  
  M2 <- gvisMotionChart(Fruits, idvar="Fruit", timevar="Date",
                        date.format = "%Y%m%d") 
  plot(M2)
  
## END ##  


