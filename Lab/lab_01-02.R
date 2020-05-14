##
## lab_01_02.R : R로 데이터 과학 맛보기
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

## --------------------------------------------------
## Step 1: 원본 데이터 가져오기
## File : data/lab_01-02_mtcars.csv
## library(readr)
## data1 <- read_csv("data/lab_01-02_mtcars.csv")

library(stringr)

data1 <- read.table("lab_01-02_mtcars_new.txt", header=T)

## 데이터 보는 방법 (2 종류)
data1
##View(data1)

## Top 6 line
head(data1)
## Top 10 line
head(data1, n=10)

## 행이름 바꾸기/저정하기  
rownames(data1)

## 열이름 바꾸기/지정하기 
colnames(data1)

## 데이터(레코드)의 특정 컬럼 값 보기
## $ <-- 컬럼지정용
data1$mpg

data1$wt


## --------------------------------------------------
## Step 2: 데이터 읽고 쓰기
## View(data1)
## View(rownames(data1))
head(data1)

## Model 컬럼 만들기 
data1$model <- rownames(data1)
head(data1)

## 열삭제
rownames(data1) <- NULL
head(data1)

## maker 컬럼 만들기 
data1$maker <- word(data1$model, 1)
head(data1)

## --------------------------------------------------
## Step 3: 데이터 살펴보기
## model, maker 컬럼 확인
View(data1)

## --------------------------------------------------
## Step 4: 데이터 편집 (dplyr)
## %>%
library(dplyr)

data1.small.narrow <-                
  data1 %>% filter(data1$cyl == 4) %>% select(maker, model, mpg, cyl) 
data1.small.narrow

makers = 
  data1 %>% 
  group_by(maker) %>%               # 제조사 기준으로 데이터를 집계한다.
  summarize( maker.mpg = mean(mpg)) # 제조사별 평균 mpg
head(makers)

data1.makers <- merge(data1, makers, by = 'maker')
head(data1.makers)

## --------------------------------------------------
## Step 5: 요약통계
table(data1$cyl)

table(data1$qsec, data1$cyl)

## --------------------------------------------------
## Step 6: 시각화 (ggplot2)
library(ggplot2)

## 히스토그램
hist(data1$mpg)

## 두 속성간의 관계를 스케터플롯
plot(data1$wt, data1$mpg)

## 2개의 그래프 표시
par(mfrow=c(1,2))
plot(mpg ~ cyl, data1)
plot(mpg ~ factor(cyl), data1)

## 3개 변수로 사용 그래프
qplot(wt, mpg, data=data1, color=wt)

## 여러 속성간의 관계를 스케터플롯
## x=wt, y=mpg, factor=cyl
qplot(wt, mpg, data=data1, shape=factor(cyl))
## x=wt, y=mpg, color=cyl
qplot(wt, mpg, data=data1, color=factor(cyl))

## End ##