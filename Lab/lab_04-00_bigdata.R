##
## lab_04_00.R : Big data opportunities 문장 분석 
##
## update: 20.02.18

## 기본환경 설정
getwd()
setwd("D:/500_Lab/Lab200219/Lab")
getwd()

## enviroment clean: 환경데이터 제거하기
rm(list=ls())
## Plots clean: Plot  제거하기
#dev.off()
if(!is.null(dev.list())) dev.off()

install.packages(c("stringr", "wordcloud2"))
install.packages("rJava")
install.packages("KoNLP")

library(stringr)
library(wordcloud2)
library(rJava)
library(KoNLP)
useSejongDic()

# Sys.setenv(JAVA_HOME='D:\\Java\\jre1.8.0_241')

# # tmp <- read.table("big_data_text", header = FALSE, fill = TRUE)
# tmp <- read.table("big_data_text", header = FALSE)
# head(tmp)

# 
# wordcloud2(tmp)
# 

## Step 1: 데이터 읽기
text <- readLines("data/big_data_text", encoding="UTF-8")
tmp <- text

tmp <- gsub("Big", "", tmp)
tmp <- gsub("Data", "", tmp)
tmp <- gsub("data", "", tmp)
tmp <- gsub("Enabling", "", tmp)
tmp <- gsub("enables", "", tmp)
tmp <- gsub(" and ", "", tmp)
tmp <- gsub(" for ", "", tmp)
tmp <- gsub(" of ", "", tmp)
tmp <- gsub(" to ", "", tmp)
tmp <- gsub(" as ", "", tmp)
# tmp <- gsub(" an ", "", tmp)
# tmp <- gsub(" g ", "", tmp)
# tmp <- gsub(" a ", "", tmp)
tmp <- str_trim(tmp)
text0 <- tmp

## Step 2: 명사만 추출
text1 <- sapply(text0, extractNoun, USE.NAMES = F)
# text1

## Step 3: 
text2 <- unlist(text1)
# text2
text2 <- Filter(function(x){nchar(x) >= 3}, text2)


## Step 4: 
text3 <- table(text2)
# text3

## Step 6: 
wordcloud2(text3, size = 1)
wordcloud2(text3, size = 1,shape = 'star')

## error: JAVA_HOME cannot be determined from the Registry

## End ##

