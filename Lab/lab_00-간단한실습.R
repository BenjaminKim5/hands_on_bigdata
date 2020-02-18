## 
## lab_00_간단한실습.R
##
## R's 간단 실습
## 
##

# 간단실습 3-1
A_score <- c(90, 80, 75, 60, NA); A_score

# 간단실습 3-2
B_score <- c(90, 80, 75, 60, NULL); B_score

# 간단실습 3-3
str(A_score)
str(B_score)

# 간단실습 3-4
c(TRUE, FALSE) -> X
#x <- c(TRUE, FALSE)
y <- c(T, F)
z <- TRUE
x
y
z

# 간단실습 3-5
class(x)
class(y)
class(z)

# 간단실습 3-6
x <- TRUE
y <- F
result_1 <- x == y
result_2 <- x != y
result_1
result_2

# 간단실습 3-7
sex <- c("m", "f", "f", "m", "f"); sex
# sex <- factor(c("m", "f", "f", "m", "f")); sex
sex <- factor(sex); sex

# 간단실습 3-8
nlevels(sex)
levels(sex)
str(sex)

# 간단실습 3-9
x <- c("가", "나", "다"); x
class(x)

# 간단실습 3-10
# integer(정수)
x <- 1:10; x
# numeric(실수)
y <- c(0.1, 0.2); y
# complex(복소수)
z <- c(1+0i, 2+4i); z
class(x)
class(y)
class(z)

# 간단실습 3-11
x <- "데이터"
is.integer(x)
is.numeric(x)
is.double(x)
is.complex(x)
is.character(x)
is.na(x)

x <- c(90, 80, 75, 60, NA); x

# 간단실습 3-12
x <- c(1,2,3,4,5); x
typeof(x)

# 간단실습 3-13
is.integer(x)
is.character(x)
is.double(x)

# 간단실습 3-14
x <- c(1,2,3,4,5)
is.numeric(x)
is.double(x)
typeof(x)

# 간단실습 3-15
x <- c(1,2,3,4,5); x
typeof(x)

# 간단실습 3-16
y <- c(1,2,3,4,5, "한글"); y
typeof(y)

# 간단실습 3-17
x <- list(1,2,"3",4,5,6)
x[2]
x[3]
x[[3]]

# 간단실습 3-18
typeof(x[3])
typeof(x[[3]])

# 간단실습 3-19
# arr <- array(1:3, c(2,4,2))
arr <- array(1:4, c(2,4,2))
arr

# 간단실습 3-20
is.array(arr)
dim(arr)

# 간단실습 3-21
attr(arr, "dim") <- NULL
arr
dim(arr)

# 간단실습 3-22
is.array(arr)
is.vector(arr)

# 간단실습 3-23
mat1 <- matrix(1:10)
mat1

# 간단실습 3-24
mat2 <- matrix(1:50,10,5)
mat2

# 간단실습 3-25
df <- data.frame(ID=c("10001", "10002","10003", "10004"), Score=c(90,21,70,80))
df

ID <-c("10001", "10002","10003", "10004")
Score <- c(90,21,70,80)
df <- data.frame(ID, Score)


# 간단실습 3-26
names(df)
dim(df)
str(df)
summary(df)
nrow(df)
ncol(df)

# 간단실습 3-27
#1행 2열 선택
df[1,2]
#1행 1,2열 선택
df[1,c(1,2)]
#Score열 선택
df$Score
#Scroe가 60점 이상인 것 선택
df[df$Score >= 60, ]
#ID가 10001인 것 선택
df[df$ID == 10001, ]

# 간단실습 3-28
1 + 1
2 * 2
(1 + 2) - 1

# 간단실습 3-29
x <- c(1,2,3,4,5); x

# 간단실습 3-30
x <- c(1,2,3,4,5); x
y <- c(5,4,3,2,1); y
z <- x * y; z

# 간단실습 3-31
x <- c(1, 2, 3, 4, 5)
y <- c(1,2)
z <- x * y; z

# 간단실습 3-32
x <- c(1,2,3,4,5); x
y = c(1,2,3,4,5); y
z <<- c(1,2,3,4,5); z

c(1,2,3,4,5) -> xx ; xx
c(1,2,3,4,5) ->> zz ; zz

# 간단실습 3-33
1 + 1
1 - 1
1 * 1
1 / 1
#2를 3번 곱하는 거듭제곱
2 ^ 3
2 ** 3
#7을 3으로 나눈 나머지 값
7 %% 3
#7을 3으로 나눈 몫 값
7 %/% 3

# 간단실습 3-34
#기준 조건 비교대상 
#1하고 1이 같은가?
1 == 1

#1하고 1이 다른가?
1 != 1

#1이 2보다 큰가?
1 > 2

#1이 2보다 작은가?
1 < 2

#1이 2보다 크거나 같은가?
1 >= 2

#1이 2보다 작거나 같은가?
1 <= 2

# 간단실습 3-35
x <- c(1, 0, 1, 0); x
y <- c(0, 0, 1, 1); y

(x == 0) & (y == 0)
(x == 0) && (y == 0)

# 간단실습 3-36
x <- c(1, 0, 1, 0); x
y <- c(0, 0, 1, 1); y

(x == 0) | (y == 0)
(x == 0) || (y == 0)

# 간단실습 3-37
x <- c(1, 0, 1, 0); x
y <- c(0, 0, 1, 1); y

x == y
!(x == y)
x != y

(x == 0) | (y == 0)
(x == 0) || (y == 0)
!(x == 0) | (y == 0)
!(x == 0) || (y == 0)

# 간단실습 3-38
x <- c(TRUE, FALSE, TRUE, FALSE); x
y <- c(TRUE, FALSE, FALSE, TRUE); y
xor(x, y)

# 간단실습 3-39
x <- c(1, 2, 1, 0); x
y <- c(0, 0, 1, 1); y
xor(x, y)

# 간단실습 3-40
x <- TRUE; x
y <- c(TRUE, TRUE); y
z <- c(TRUE, FALSE, FALSE); z
isTRUE(x)
isTRUE(y)
isTRUE(z)

# 간단실습 3-42
myfunction1 <- function(x, y){
  z <- x * y
  return(z)
}

myfunction1(2, 4)
myfunction1(0, 2)

# 간단실습 3-43
myfunction2 <- function(){
  x <- 1:10
  return(x)
}
xx <- myfunction2()

# 간단실습 3-44
myfunction3 <- function(x, y=4){
  z <- x * y
  return(z)
}
myfunction3(2)
myfunction3(2, 3)

# 간단실습 3-45
myfunction4 <- function(x, y){
  result_sum <- sum(x, y)
  result_max <- max(x, y)
  return(c(result_sum, result_max))
}
myfunction4(2, 5)

# 간단실습 3-46
x <- c(1, 2, 3, 4, 5); x
max(x)
min(x)
sum(x)
mean(x)
median(x)
summary(x)

# 간단실습 3-47
y <- c(3, 5, 8, 11, 1); y
cumsum(y)
#3, 3+5=8, 8+8=16, 16+11=27, 27+1=28
cumprod(y)
#3, 3*5=15, 15*8=120, 120*11=1320, 1320
diff(y)
#5-3=2, 8-5=3, 11-8=3, 1-11=-10
order(y)
#5=다섯번째 위치에 있는 1이 가장 적으므로 5, 그 다음 3부터 순서대로 이므로 3의 위치 1
rank(y)
#각 위치의 순위이므로 3은 2위, 마지막 1은 1위
range(y)
#1부터 11까지의 수가 있으므로 1과 11

# 간단실습 3-48
#전역변수
x <- 1; y <- 2; z <- 3;
ft <- function(x)
{
  #지역 변수
  y <- x + 1
  #매개 변수, 지역 변수, 전역 변수
  print(x); print(y); print(z)
}

x; y; z;
ft(x)
ft(2)

# 간단실습 3-49
x <- 3; x
y <- 3; y
ft <- function()
{
  x <- 1 
  y <<- 1 
}
ft()
x; y

# 간단실습 3-51
x <- c(1, 2, 3, 4, 5)
if(any(x==1)) "x에 1이 있다"

# 간단실습 3-53
x <- 2
{ 
  if(x > 0){ 
    x <- x * x
  }else{
    x <- x * 0
  }
  print(x)
}

# 간단실습 3-55
x <- 0
{ 
  if(x > 0){ 
    x <- x * x
  }else if(x == 0){
    x <- 1
  }else{
    x <- x * 0
  }
  print(x)
}

# 간단실습 3-57
x <-2 
ifelse(x > 0, {x <- x * x}, {x <- x * 0})

# 간단실습 3-59
ft <- function(x){ 
  if(x > 0){ 
    x <- x * x
  }else if(x == 0){
    x <- 1
  }else{
    x <- x * 0
  }
  return(x)
}
ft(2)
ft(0)
ft(-1)

# 간단실습 3-61
ftswitch <- function(x)
{
  switch(x,
         "1" = "하나",
         "2" = "둘",
         "3" = "셋",
         "4" = "넷",
         "기타")
}
ftswitch(1)
ftswitch(3)
ftswitch(5)

# 간단실습 3-63
for(i in 1:10){
  print(i)
}

# 간단실습 3-64
x <- c("a","b","c","d","e")
for(test in x){
  print(test)
}

# 간단실습 3-65
ftfor <- function(x){
  for(i in 1:x){
    print(i)
  }
}
ftfor(5)

# 간단실습 3-66
ftfor <- function(x){ 
  i <- 0
  for(j in 1:x){
    i <- i + j
    print(c(i,j))
  }
}
ftfor(5)

# 간단실습 3-67
for(i in 1:10){
  if(i == 5) next
  print(i)
}

# 간단실습 3-68
for(i in 1:10){
  if(i == 5) break
  print(i)
}

# 간단실습 3-70
i <- 0
while(i < 5){
  i <- i + 1
  print(i)
}

# 간단실습 3-71
i <- 0
while(i < 10){
  i <- i + 1
  if(i==5) next
  print(i)
}

# 간단실습 3-72
i <- 0
while(i < 10){
  i <- i + 1
  if(i == 5) break
  print(i)
}

#참고
install.packages("sqldf")
library(sqldf)
sqldf('select * from iris limit 3')
sqldf('select * from iris where "Sepal.Length" > 7')


# 간단실습 4-1
install.packages('dplyr')
library(dplyr)
install.packages("tidyr")
library(tidyr)

# 간단실습 4-2
iris

# 간단실습 4-3
#iris data를 tbl_iris 변수에 넣자.
tbl_iris <- tbl_df(iris)

#tbl_iris data를 확인해보자.
tbl_iris

# 간단실습 4-4
iris$Sepal.Len
tbl_iris$Sepal.Len

# 간단실습 4-5
class(iris)
class(tbl_iris)

# 간단실습 4-6
str(mtcars)
glimpse(mtcars)

# 간단실습 4-7
result1 <- tbl_iris[tbl_iris$Species=="setosa",  ]
result2 <- summary(result1)
print(result2)

result1 <- tbl_iris %>% 
  filter(Species == 'setosa') %>% 
  summary() %>% 
  print()

# 간단실습 4-9
tbl_iris
gather(tbl_iris, Type, value, Sepal.Length:Petal.Width)

# 간단실습 4-11
mtcars_10 <- head(mtcars, 10) %>% print()
spread(mtcars_10, gear, mpg)

# 간단실습 4-13
mtcars_name <- data.frame(Names = rownames(mtcars)); mtcars_name

# 간단실습 4-14
result <- separate(mtcars_name, Names, c("A", "B"), sep = " ", fill='right', extra='merge'); result

# 간단실습 4-16
mtcars_name <- unite(result, Names, A, B, sep=' '); mtcars_name

# 간단실습 4-18
filter(tbl_iris, Species=='versicolor')

# 간단실습 4-20
slice(tbl_iris, 6:15)

# 간단실습 4-22
select(tbl_iris, Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)

# 간단실습 4-23
select(tbl_iris, starts_with("S"))

# 간단실습 4-23
vars <- c("Sepal.Length", "Petal.Length")
select(tbl_iris, one_of(vars))

# 간단실습 4-24
tbl_iris2 <- tbl_iris
colnames(tbl_iris2) <- sprintf("x%d", 1:5)
tbl_iris2

select(tbl_iris2, num_range("x", 1:2))

# 간단실습 4-25
select_if(tbl_iris, is.double)

# 간단실습 4-28
tbl_iris
mutate(tbl_iris, SepalLengthAndWidth = Sepal.Length * Sepal.Width)

# 간단실습 4-30
transmute(tbl_iris, SepalLengthAndWidth = Sepal.Length * Sepal.Width)

# 간단실습 4-31
x <- data.frame(A=c('a','b','c'), B=c('t','u','v'), C=c(1,2,3))
y <- data.frame(A=c('a','b','c'), B=c('t','u','w'), D=c(3,2,1))
x
y

# 간단실습 4-33
bind_cols(x, y)

# 간단실습 4-35
left_join(x, y, by=c('A','B'))

# 간단실습 4-37
right_join(x, y, by=c('A','B'))

# 간단실습 4-39
inner_join(x, y, by=c('A','B'))

# 간단실습 4-41
full_join(x, y, by=c('A','B'))

# 간단실습 4-42
x <- data.frame(A=c('a','b','c'), B=c('t','u','v'), C=c(1,2,3), stringsAsFactors = F)
y <- data.frame(A=c('a','b','c'), B=c('t','u','w'), C=c(1,2,4), stringsAsFactors = F)
x
y

# 간단실습 4-43
bind_rows(x, y)

# 간단실습 4-45
intersect(x,y)

# 간단실습 4-47
setdiff(x,y)

# 간단실습 4-49
union(x,y)

# 간단실습 5-1
install.packages('XML')
library(XML)

# 간단실습 5-2
url <- 'http://openapi.seoul.go.kr:8088/(인증키)/xml/SebcPublicEnterpriseKor/1/1000/'
indata <- xmlToDataFrame(url)
View(indata)

# 간단실습 5-3
indata <- indata[-1:-2,-1:-3] 

# 간단실습 5-4
install.packages("jsonlite")
library(jsonlite)

# 간단실습 5-5
data2 <- fromJSON("https://api.github.com/users/hadley/orgs")
data2 <- as.data.frame(data2)
colnames(data2)
View(data2)

# 간단실습 5-6
data <- fromJSON("C:/r_temp/전국초등학교통학구역표준데이터.json")
names(data)
data <- as.data.frame(data$records)
View(data)

# 간단실습 5-7
install.packages(c("DBI","RODBC"))
library(DBI)
library(RODBC)

# 간단실습 5-8
con <- odbcConnect('test', uid='test', pwd='test1!')
data <- sqlQuery(con,"select * from table.name")
data
odbcCloseAll()

# 간단실습 5-9
install.packages('RMySQL')
library(RMySQL)

# 간단실습 5-10
data <- dbConnect(MySQL(), user="test", password="test!1", host="000.000.000.000", dbname="data", client.flag=CLIENT_MULTI_RESULTS)
head(dbGetQuery(data, "SELECT * FROM table.name"))
dbDisconnect(data)

# 간단실습 5-11
install.packages(c("readr","DBI","pool","dplyr","dbplyr","RSQLServer"))
library(readr)
library(DBI)
library(pool)
library(dplyr)
library(dbplyr)
library(RSQLServer)

# 간단실습 5-12
NHIS_OPEN_GJ_2015 <- read_csv("C:/r_temp/NHIS_OPEN_GJ_2015.CSV", locale = locale(encoding = "euc-kr"))
data <- NHIS_OPEN_GJ_2015[1:100, 1:7]
colnames(data) <- c("Year", "UID", "Sex", "Age", "CityCode", "height", "Weight")

# 간단실습 5-13
con <- dbPool(RSQLServer::SQLServer(), server="test.database.windows.net", database="test_server", properties=list(user=" 0000 ", password="0000000"))
dbListTables(con)
dbWriteTable(con, "NHIS_OPEN_GJ_2015", data, overwrite=TRUE, row.names = TRUE)
dbListTables(con)
dbReadTable(con, "NHIS_OPEN_GJ_2015")

# 간단실습 5-14
result <- tbl(con, "NHIS_OPEN_GJ_2015") %>% filter(Weight >= 80)
result
poolClose(con)

# 간단실습 5-15
library(readr)
library(DBI)
library(dplyr)
library(dbplyr)
library(RSQLServer)

# 간단실습 5-16
con <- dbConnect(RSQLServer::SQLServer(), server="test.database.windows.net", database="test_server", properties=list(user="0000", password="00000000"))
dbListTables(con)
dbReadTable(con, "NHIS_OPEN_GJ_2015")

# 간단실습 5-17
result <- tbl(con, "NHIS_OPEN_GJ_2015") %>% filter(Weight >= 80)
result
dbDisconnect(con)

# 간단실습 5-18
con <- dbPool(RSQLServer::SQLServer(), server="test7.database.windows.net", database="test_server", properties=list(user="id", password="pass"))
con <- dbConnect(RSQLServer::SQLServer(), server="test7.database.windows.net", database="test_server", properties=list(user="id", password="pass"))
poolClose(con)
dbDisconnect(con)

# 간단실습 5-19
data <- data.frame(number=rnorm(n=100000000))
dim(data)

# 간단실습 5-20
#RData 파일 형식 쓰기
system.time({
  save(data, file="data.RData")
})
#csv 파일 형식 쓰기
system.time({
  write_csv(data, "data.csv")
})
#feather 파일 형식 쓰기
system.time({
  write_feather(data, "data.feather")
})
#fst 파일 형식 쓰기
system.time({
  write.fst(data, "data.fst")
})

# 간단실습 5-21
#RData 파일 형식 읽기
system.time({
  load("data.RData")
})
#csv 파일 형식 읽기
system.time({
  data1 <- read_csv("data.csv")
})
#feather 파일 형식 읽기
system.time({
  data2 <- read_feather("data.feather")
})
#fst 파일 형식 읽기
system.time({
  data3 <- read.fst("data.fst")
})

# 간단실습 6-1
NHIS_OPEN_GJ_2015 <- read_csv("C:/r_temp/test/NHIS_OPEN_GJ_2015.CSV", locale = locale(encoding = "euc-kr"))

# 간단실습 6-2
summary(NHIS_OPEN_GJ_2015)

# 간단실습 6-3
summary(as.factor(NHIS_OPEN_GJ_2015$성별코드))

# 간단실습 6-4
library(XML)
library(dplyr)

# 간단실습 6-5
url <- 'http://openapi.seoul.go.kr:8088/(인증키)/xml/SebcPublicEnterpriseKor/1/1000/'
indata <- xmlToDataFrame(url)
indata <- indata[-1:-2,-1:-3]
View(indata)

# 간단실습 6-6
result_1 <- indata %>% 
  select(H_KOR_CITY) %>% 
  group_by(H_KOR_CITY) %>% 
  count() %>% 
  print()

# 간단실습 6-7
result_1 <- indata %>% 
  #result_1에다 최종 결과값을 넣는다. indata를 사용한다.
  select(H_KOR_CITY) %>%
  #indata에서 H_KOR_CITY컬럼만 선택한다.
  group_by(H_KOR_CITY) %>% 
  #indata에서 H_KOR_CITY컬럼 기준으로 그룹화한다.
  count() %>% 
  #H_KOR_CITY컬럼기준으로 몇개인지 카운트한다.
  print()
#결과를 출력한다.

# 간단실습 6-8
mean(result_1$n)

# 간단실습 6-9
result_1 <- indata %>% 
  select(H_KOR_CITY) %>% 
  group_by(H_KOR_CITY) %>% 
  count() %>%
  ungroup() %>% 
  summarise(Mean=mean(n),Mean2=sum(n)/n(),Sum=sum(n),Count=n()) %>% 
  print()

# 간단실습 6-10
result_1 <- indata %>% 
  select(H_KOR_CITY) %>% 
  group_by(H_KOR_CITY) %>% 
  count() %>%
  ungroup() %>% 
  summarise(SD=sd(n)) %>% 
  print()

# 간단실습 6-11
result_1 <- indata %>% 
  select(H_KOR_CITY) %>% 
  group_by(H_KOR_CITY) %>% 
  count() %>%
  ungroup() %>% 
  summary() %>% 
  print()

# 간단실습 6-12
library(XML)
library(dplyr)
url <- 'http://openapi.seoul.go.kr:8088/6e4748666e697a6f313236416d4c5775/xml/SebcPublicEnterpriseKor/1/1000/'
indata <- xmlToDataFrame(url)
indata <- indata[-1:-2,-1:-3]
result_1 <- round(prop.table(table(indata$H_KOR_CITY))*100,1)
result_1 <- as.data.frame(result_1)
result_1

# 간단실습 6-13
result_2 <- indata %>% 
  select(H_KOR_CITY) %>% 
  group_by(H_KOR_CITY) %>% 
  summarise(Count=n()) %>%
  mutate(TotalCount=sum(Count)) %>% 
  mutate(Percent=round((Count/TotalCount)*100,1)) %>% 
  mutate(CumTotal=cumsum(Count), CumPer=cumsum(Percent)) %>% 
  select(H_KOR_CITY, Count, CumTotal, TotalCount, Percent, CumPer)
result_2

# 간단실습 6-14
round(0.5,0)
round(0.4,0)
round(0.5,0)
round(0.6,0)

# 간단실습 6-15
rou <- function(x, n)
{
  d=10^n
  x=x*d
  r=trunc(x+0.5)
  x=r
  x=x/d
  return(x)
}

# 간단실습 6-16
rou(0.4,0)
rou(0.5,0)
rou(0.6,0)

# 간단실습 6-17
x <- 0:50
quantile(x)
quantile(x, c(0.05, 0.1, 0.9, 0.95))

# 간단실습 6-18
NHIS_OPEN_GJ_2015 <- read_csv("C:/r_temp/NHIS_OPEN_GJ_2015.CSV", locale = locale(encoding = "euc-kr"))

# 간단실습 6-19
glimpse(NHIS_OPEN_GJ_2015)

# 간단실습 6-20
quantile(NHIS_OPEN_GJ_2015$`신장(5Cm단위)`)
quantile(NHIS_OPEN_GJ_2015$`체중(5Kg 단위)`)

# 간단실습 6-21
quantile(NHIS_OPEN_GJ_2015$`신장(5Cm단위)`,c(0.9, 0.99))
quantile(NHIS_OPEN_GJ_2015$`체중(5Kg 단위)`,c(0.9, 0.99))

# 간단실습 6-22
x <- data.frame(x=rnorm(n=5000, mean=0, sd=1))
ggplot(data=x, aes(x)) + geom_histogram()

# 간단실습 6-23
shapiro.test(x$x)

# 간단실습 6-24
data <- NHIS_OPEN_GJ_2015 %>% 
  select(성별코드, 흡연상태)

table(data)

# 간단실습 6-25
summary(table(data))

# 간단실습 6-26
chisq.test(data$성별코드, data$흡연상태)

# 간단실습 6-27
data <- NHIS_OPEN_GJ_2015 %>% select(성별코드, `신장(5Cm단위)`)
head(data)

# 간단실습 6-28
table(data)

# 간단실습 6-29
t.test(data$성별코드, data$`신장(5Cm단위)`)

# 간단실습 6-30
data <- NHIS_OPEN_GJ_2015 %>% select(흡연상태, `체중(5Kg 단위)`)
head(data)

# 간단실습 6-31
table(data)

# 간단실습 6-32
data <- data %>% 
  mutate(흡연상태=as.factor(흡연상태))
result_1 <- lm(`체중(5Kg 단위)`~흡연상태, data=data)
result_2 <- aov(`체중(5Kg 단위)`~흡연상태, data=data)
anova(result_1)
anova(result_2)

# 간단실습 7-1
data <- NHIS_OPEN_GJ_2015 %>% 
  select(`신장(5Cm단위)`, `체중(5Kg 단위)`)
head(data)

# 간단실습 7-4
cor(data$`신장(5Cm단위)`, data$`체중(5Kg 단위)`,  method="pearson")

# 간단실습 7-5
cor(data, method="pearson")

# 간단실습 7-6
cor.test(data$`신장(5Cm단위)`, data$`체중(5Kg 단위)`)

# 간단실습 7-7
data <- NHIS_OPEN_GJ_2015 %>% select(`체중(5Kg 단위)`, 허리둘레, `신장(5Cm단위)`)

# 간단실습 7-8
set.seed(123)
idx <- sample(2, size=NROW(data), replace=T, prob=c(0.7, 0.3))
train_data <- data[idx==1, ]
test_data <- data[idx==2, ]

# 간단실습 7-9
train_result <- lm(`체중(5Kg 단위)`~허리둘레+`신장(5Cm단위)`, data=train_data)
summary(train_result)

# 간단실습 7-10
test_result <- predict(train_result, newdata=test_data)
test_result <- round(test_result, 0)
test_result <- test_result %>% 
  as.data.frame() %>% 
  mutate(raw_value=test_data$`체중(5Kg 단위)`)
names(test_result) <- c('result_value', 'raw_value')
result <- test_result %>% 
  mutate(Correct=ifelse(result_value==raw_value, 1, 0)) %>% 
  group_by(Correct) %>% 
  summarise(Count=n()) %>% 
  print()

# 간단실습 7-11
head(iris)

# 간단실습 7-12
set.seed(123)
idx <- sample(2, size=NROW(iris), replace=T, prob=c(0.7, 0.3))
train_data <- iris[idx==1, ]
test_data <- iris[idx==2, ]

# 간단실습 7-13
install.packages("party")
library(party)
iris_tree <- ctree(Species ~ ., data=train_data); iris_tree

# 간단실습 7-14
plot(iris_tree)
plot(iris_tree, type="simple")

# 간단실습 7-15
table(train_data$Species)
table(predict(iris_tree), train_data$Species)

# 간단실습 7-16
test_result <- predict(iris_tree, newdata=test_data)
table(test_data$Species)
table(test_result, test_data$Species)

# 간단실습 7-17
library(caret)
confusionMatrix(test_result, test_data$Species)

# 간단실습 7-18
set.seed(123)
idx <- sample(2, size=NROW(iris), replace=T, prob=c(0.7, 0.3))
train_data <- iris[idx==1, ]
test_data <- iris[idx==2, ]

# 간단실습 7-19
install.packages("randomForest")
library(randomForest)
iris_forest <- randomForest(Species ~ ., data=train_data, importance = T)
iris_forest

# 간단실습 7-20
table(train_data$Species)
table(iris_forest$predicted, train_data$Species)

# 간단실습 7-21
iris_forest$importance

# 간단실습 7-22
varImpPlot(iris_forest)

# 간단실습 7-23
test_result <- predict(iris_forest, newdata=test_data)
table(test_data$Species)
table(test_result, test_data$Species)

# 간단실습 7-24
library(caret)
confusionMatrix(test_result, test_data$Species)

# 간단실습 8-1
install.packages('ggplot2')
library(ggplot2)

# 간단실습 8-2
vignette("ggplot2-specs")
vignette("extending-ggplot2")

# 간단실습 8-3
ggplot(data, aes(x=length, y=width)) +
  geom_point(colour='blue') + 
  geom_smooth()

# 간단실습 8-4
ggplot(data=cars, aes(x=speed, y=dist))

# 간단실습 8-5
x <- ggplot(data=cars, aes(x=speed, y=dist))
summary(x)

# 간단실습 8-6
ggplot(data=cars, aes(x=speed, y=dist)) + 
  geom_point(colour="red")

# 간단실습 8-7
ggplot(mpg, aes(displ, hwy, colour = class)) +
  geom_point() +
  geom_smooth(se = FALSE, method = lm)

# 간단실습 8-8
ggplot(mpg, aes(displ, hwy, colour = class)) +
  geom_point(colour = 'red') +
  geom_smooth(se = FALSE, method = lm) 

# 간단실습 8-9
p <- ggplot(data=diamonds, aes(x=carat, y=price))
p + geom_smooth()

# 간단실습 8-10
p <- ggplot(data=diamonds, aes(x=carat,y=price))
p + geom_smooth(aes(group=cut))

# 간단실습 8-11
p <- ggplot(data=diamonds, aes(x=carat,y=price))
p + geom_smooth(aes(colour=cut))

# 간단실습 8-12
ggplot(data=diamonds, aes(x=price)) + geom_histogram() #-– (1)
ggplot(data=diamonds, aes(x=price)) + geom_histogram(aes(y=..count..)) #-– (2)

# 간단실습 8-13
ggplot(data=diamonds, aes(x=price)) + geom_histogram(aes(y=..ncount..))

# 간단실습 8-14
x <- ggplot(diamonds, aes(price))
x + stat_bin(geom="bar") #-- (1)
x + stat_bin(geom="line") #-- (2)
x + stat_bin(aes(size=..ncount..), geom="point") #-- (3)

# 간단실습 8-15
result <- ggplot(iris, aes(Sepal.Length)) + geom_dotplot()
result

# 간단실습 8-16
summary(iris$Sepal.Length)
range(iris$Sepal.Length)

# 간단실습 8-17
result <- ggplot(iris, aes(Sepal.Length)) + geom_dotplot(binwidth = 3.6/ 30)
result

# 간단실습 8-18
result <- ggplot(iris, aes(Sepal.Length)) + geom_area(stat='count')
result

# 간단실습 8-19
table(iris$Sepal.Length)

# 간단실습 8-20
result <- ggplot(iris, aes(Sepal.Length)) + geom_bar()
result

# 간단실습 8-21
result <- ggplot(iris,aes(Sepal.Length)) + geom_bar() + coord_flip()
result

# 간단실습 8-22
result <- ggplot(iris, aes(Sepal.Length)) + geom_bar() + coord_flip() + scale_x_reverse()
result

# 간단실습 8-23
result <- ggplot(iris, aes(Sepal.Length)) + geom_bar(fill="deepskyblue4", alpha=0.3)
result

# 간단실습 8-24
result <- ggplot(iris,aes(Sepal.Length)) + geom_histogram(binwidth =0.5, fill="deepskyblue4", colour='black', alpha=0.3)
result

# 간단실습 8-25
View(pressure)

# 간단실습 8-26
result <- ggplot(pressure,aes(temperature, pressure)) + geom_line()
result

# 간단실습 8-27
result <- ggplot(pressure, aes(temperature, pressure)) + geom_area()
result

# 간단실습 8-28
result <- ggplot(pressure,aes(temperature, pressure)) + geom_step()
result

# 간단실습 8-29
result <- ggplot(iris,aes(Sepal.Length,Sepal.Width)) + geom_point()
result

# 간단실습 8-30
install.packages('ggThemeAssist')
library(ggplot2)
library(ggThemeAssist)

# 간단실습 8-31
gg <- ggplot(mtcars, aes(x = hp, y = mpg, colour = as.factor(cyl))) + geom_point() + theme()
gg

# 간단실습 8-32
ggThemeAssistGadget(gg)

# 간단실습 8-33
gg + theme(plot.subtitle = element_text(vjust = 1), plot.caption = element_text(vjust = 1))

gg <- gg + theme(plot.subtitle = element_text(vjust  =  1))
gg <- gg + theme(plot.caption = element_text(vjust  =  1))

# 간단실습 8-34
gg + theme(plot.subtitle = element_text(vjust = 1), 
           plot.caption = element_text(vjust = 1), 
           plot.background = element_rect(fill = "azure4", 
                                          colour = "yellow", size = 2, linetype = "dotdash"))

# 간단실습 8-35
gg + theme(plot.subtitle = element_text(vjust = 1), 
           plot.caption = element_text(vjust = 1), 
           panel.background = element_rect(fill = "cadetblue2", 
                                           colour = "black", size = 2, linetype = "dotted"))

# 간단실습 8-36
gg + theme(plot.subtitle = element_text(vjust = 1), 
           plot.caption = element_text(vjust = 1), 
           panel.grid.major = element_line(colour = "red", size = 1))

# 간단실습 8-37
gg + theme(plot.subtitle = element_text(vjust = 1), 
           plot.caption = element_text(vjust = 1), 
           panel.grid.minor = element_line(colour = "green4", size = 2, linetype = "longdash"))

# 간단실습 8-38
gg + theme(plot.subtitle = element_text(vjust = 1), 
           plot.caption = element_text(vjust = 1), 
           axis.text = element_text(size = 15, face = "bold", colour = "blue", vjust = -0.25, angle = 15))
