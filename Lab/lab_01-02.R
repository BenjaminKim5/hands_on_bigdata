## 
## R로 데이터 과학 맛보기
## 
##

## 기본환경 설정
getwd()
setwd("C:/500_Lab/Lab190522/Lab")
getwd()

## Step 1: 원본 데이터 가져오기
## File : data/lab_01-02_mtcars.csv
##library(readr)
##data1 <- read_csv("data/lab_01-02_mtcars.csv")

library(stringr)
data1 <- read.table("lab_01-02_mtcars_new.txt", header=T)

data1
##View(data1)

## Top 6 line
head(data1)
## Top 10 line
head(data1, n=10)

rownames(data1)

colnames(data1)

data1$mpg

## Step 2: 데이터 읽고 쓰기
data1$model <- rownames(data1)
rownames(data1) <- NULL
head(data1)

data1$maker <- word(data1$model, 1)
head(data1)

## Step 3: 데이터 살펴보기


## Step 4: 데이터 편집 (dplyr)
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

## Step 5: 요약통계
table(data1$cyl)

table(data1$qsec, data1$cyl)

## Step 6: 시각화 (ggplot2)
library(ggplot2)

hist(data1$mpg)

## 두 속성간의 관계를 스케터플롯
plot(data1$wt, data1$mpg)

par(mfrow=c(1,2))
plot(mpg ~ cyl, data1)
plot(mpg ~ factor(cyl), data1)

qplot(wt, mpg, data=data1, color=wt)

## 여러 속성간의 관계를 스케터플롯
## x=wt, y=mpg, factor=cyl
qplot(wt, mpg, data=data1, shape=factor(cyl))
## x=wt, y=mpg, color=cyl
qplot(wt, mpg, data=data1, color=factor(cyl))

## End