##
## Quiz 1.R : Quiz 1
##
## update: 20.02.18
## update: 20.05.14

## 문자형으로 이루어진 데이터 1, 2, 3, 4, 5 는 ITEM_ID 변수, 
## 숫자형으로 이루어진 데이터 10, 25, 100, 75, 30 은 INV_QTY 변수, 
## 문자형으로 이루어진 데이터 A, B C, A, B은 CLASS 변수로 
## 구성한 결과는? 

##Delete Data Set
# remove(ITEM_ID, INV_QTY, CLASS)
# remove(INV_frame)
# remove(dist_class)
ITEM_ID <- c("1", "2", "3", "4", "5")
INV_QTY <- c(10, 25, 100, 75, 30)
CLASS <- c("A", "B", "C", "A", "B")

INV_frame <- data.frame(ITEM_ID, INV_QTY, CLASS)
INV_frame 

## [1] 히스토그램
hist(INV_frame$INV_QTY)
hist(INV_frame$INV_QTY, main="재고분포")

## [2] 막대그래프
# remove.packages("descr")
install.packages("descr")
library(descr)

freq(INV_frame$CLASS, plot=T, main="CLASS(등급)")

dist_class <- table(INV_frame$CLASS)
dist_class
barplot(dist_class, main="CLASS-II(등급)", xlab = "등급", ylab = "건수")
barplot(dist_class, main="CLASS-II(등급)", xlab = "등급", ylab = "건수", names = c("A등급", "B등급", "c등급"), col = c("pink", "navy"))

## End ##
