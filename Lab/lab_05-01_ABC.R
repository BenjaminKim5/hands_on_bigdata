##
## ABCanalysis
## 
##

# install.packages("ABCanalysis")

library(ABCanalysis)

## sample data: SwissInhabitants

## ABCanalysis-package: Computed ABC analysis
data("SwissInhabitants")
View(SwissInhabitants)

abc=ABCanalysis(SwissInhabitants,PlotIt=TRUE)
SetA=SwissInhabitants[abc$Aind]
SetB=SwissInhabitants[abc$Bind]
SetC=SwissInhabitants[abc$Cind]

getwd()
setwd("C:/500_Lab/Lab190522/Lab")
getwd()

library(readr)
Sys.setlocale("LC_ALL", "korean")

# rm(abc)
abc_data <- read_csv("data/lab_05-01_ABC-data.csv")
View(abc_data)
abc_data2 <- data.frame(Product=abc_data$Product, Amount=abc_data$Amount)
View(abc_data2)
abc_test=ABCanalysis(abc_data2$Amount,PlotIt=TRUE)
SetA=abc_data2[abc_test$Aind]
SetB=abc_data2[abc_test$Bind]
SetC=abc_data2[abc_test$Cind]





a <- c(1,2,3,4)
b <- c(10,20,30,40)
c
d <- data.frame(c$b)




## ABCanalysis: Computed ABC analysis: calculates a division of the data in 3 classes A, B and 
data("SwissInhabitants")
abc=ABCanalysis(SwissInhabitants,PlotIt=TRUE)
A=abc$Aind
B=abc$Bind
C=abc$Cind
Agroup=SwissInhabitants[A]
Bgroup=SwissInhabitants[B]
Cgroup=SwissInhabitants[C]


## Standard Example
data("SwissInhabitants")
abc=ABCanalysisPlot(SwissInhabitants)
## Multiple plots in one Window:
m=runif(4,100,200)
s=runif(4,1,10)
Data=sapply(1:4,FUN=function(x,m,s) rnorm(1000,m,s),m,s)
# windows() #screen devices should not be used in examples etc
par(mfrow=c(2,2))

for (i in 1:4)
{
  ABCanalysisPlot(Data[,i],ResetPlotDefaults=FALSE)
}


data("SwissInhabitants")
vec=ABCplot(SwissInhabitants)
