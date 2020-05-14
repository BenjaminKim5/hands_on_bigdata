##
## lab_03_01.R : 기술통계함수
##
## update: 20.02.18
## update: 20.05.14


## 기본환경 설정
getwd()
setwd("D:/500_Lab/Lab200515/Lab")
getwd()

## enviroment clean: 환경데이터 제거하기
rm(list=ls())
## Plots clean: Plot  제거하기
#dev.off()
if(!is.null(dev.list())) dev.off()

## ======================================
## Step 1: max(), main(), sum(), median()
##
x1 <- c(1,2,3,4,5,6,100)
x1

## max() 최대값
max(x1)
## [1] 100

## min() 최소값
min(x1)
## [1] 1

## sum() 합계
sum(x1)
## [1] 121

## mean() 평균
mean(x1)
## [1] 17.28571

## median() 중간값
median(x1)
## [1] 4

## summary() 요약통계 반환
summary(x1)
## Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
## 1.00    2.50    4.00   17.29    5.50  100.00 

## ======================================
## Step 2: cumsum(), cumprod(), diff(), order(), rank(), range()
##
y1 <- c(3, 5, 8, 11, 1)
y1

## cumsum() 설정된 지점까지 누적함
cumsum(y1)
## [1]  3  8 16 27 28

## cumprod() 설정된 지점까지 누적곱
cumprod(y1)
## [1]    3   15  120 1320 1320

## diff() 차이를 계산, B-A
diff(y1)
## [1]   2   3   3 -10

## order() 정렬하기 위한 각 원소의 인덱스를 반환
order(y1)
## [1] 5 1 2 3 4
## (5)1-(1)3-(2)5-(3)8-(4)11

## rank() 각 원소의 순위를 출력
rank(y1)
## [1] 2 3 4 5 1

# range() 최소값과 최대값을 반환
range(y1)
## [1]  1 11


## ======================================
## Step 3: rowMeans(), colMeans()
##

# Sys.setlocale("LC_ALL", "korean")
x2 <- read.csv("data/기술통계함수데이터.csv")
View(x2)
head(x2)
str(x2)

## 행 평균
rowMeans(x2)
## [1] 45 55 65 75

# mean(c(30, 60))
# mean(c(40, 70))
# mean(c(50, 80))
# mean(c(60, 90))

## 열 평균
colMeans(x2)
## English    Math 
## 45      75 

# mean(c(30, 40, 50, 60))
# mean(c(60, 70, 80, 90))

## ======================================
## Step 4: rowCounts()
##
# install.packages("matrixStats")
library(matrixStats)
x3 <- matrix(0:11, nrow = 4, ncol = 3)
x3[2:3, 2:3] <- 2:5
x3[3, 3] <- NA_integer_
print(x3)

print(rowCounts(x3, value = 2))
## [1]  0  1 NA  0

print(colCounts(x3, value = 2))
## [1]  1  1 NA

print(colCounts(x3, value = NA_integer_))
## [1] 0 0 1

print(rowCounts(x3, value = 2, na.rm = TRUE))
## [1] 0 1 1 0

print(colCounts(x3, value = 2, na.rm = TRUE))
## [1] 1 1 0

print(rowAnys(x3, value = 2))
## [1] FALSE  TRUE  TRUE FALSE

print(rowAnys(x3, value = NA_integer_))
## [1] FALSE FALSE  TRUE FALSE

print(colAnys(x3, value = 2))
## [1] TRUE TRUE   NA

print(colAnys(x3, value = 2, na.rm = TRUE))
## [1]  TRUE  TRUE FALSE

print(colAlls(x3, value = 2))
## [1] FALSE FALSE FALSE


## End ##