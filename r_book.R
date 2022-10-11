  # R BOOK NOTES

# ASSIGNMENT OPERATORS
# functional scoping 

new_counter <- function() {
  i <- 0
  function() {
    # do something useful, then ...
    i <<- i + 1
    i
  }
}

new_counter1 <- function() {
  i <- 0
  function() {
    # do something useful, then ...
    i <- i + 1
    i
  }
}

# relational operators
a = 12; b = 23
a<b

# arithmetic

a = 4; b = 8
b %% a
a = 3; b = 8
b %% a
b %/% a
a = 2.5; b= 5
b %/% a
b %% a
a = 3; b= 9
b %/% a
b %% a

# logical 

a; b

a=TRUE; b=TRUE
a & b 
a && b
a | b
a || b

a=TRUE; b=FALSE

# DATA TYPES

a = "this is a character"
is.character(x)
b = 123
is.numeric(x)
c = 12
is.integer(c)
typeof(c)
d = TRUE
is.logical(d)
is.complex(a+i*b) # throws error
e = complex(a, b)
is.complex(e)

# vectors 
x <- c(1:10)
typeof(x)
y <- c("a", "b", 1:10)
typeof(y)

c(x, 11)
z <- seq(1, 10, 0.5)
length(z)

assign("x", runif(10)) # use c() or colon
x

# factors

factdat <- c("male", "female", "male", "female",  "female", "male", "female",  "female", "male", "female")
length(factdat)
is.factor(factdat)
summary(factdat)

factdat <- factor(c("male", "female", "male", "female",  "female", "male", "female",  "female", "male", "female"))
length(factdat)
is.factor(factdat)
summary(factdat)

# data frames

typeof(airquality)
names(airquality)
df <- data.frame(airquality)
names(df)
df[1:6, 1:2]

head(subset(df, subset = !is.na(Solar.R) ))

# Help

sessionInfo()
version
ver = version
cat("I am using R with version", ver$version.string, "with in", ver$os)

environment()
ip <- as.data.frame(installed.packages())
names(ip)
head(ip["Package"])

# Functions

grep("mean", ls("package:base"))
ls("package:base")[c(grep("mean", ls("package:base")))]

help("mean")
example("mean")

c(1:10)
mean(c(1:10))
mean(c(1:10), trim = 5)

grep("cor", ls("package:base")) # no result
grep("cor", ls("package:stats")) # valid result
ls("package:stats")[c(grep("cor", ls("package:stats")))]

# datasets

ds <- data()
names(ds)
data()[[3]][1:5, 3]
grep("cars", data()[[3]][, 3]) # gives 48, 72 
data()[[3]][48, 3] # to cross check if the name is "cars"
data()[[3]][72, 3]


help("AirPassengers")

AirPassengers
typeof(AirPassengers)
attributes(AirPassengers)

typeof(BOD)
names(BOD)
head(BOD)
tail(BOD)

typeof(CO2)
names(CO2)
head(CO2)
tail(CO2)

help(mtcars)
typeof(mtcars)
names(mtcars)
head(mtcars)
tail(mtcars)

# data frames

getwd()
setwd("/media/ubuntu/C2ACA28AACA27895/Windows/My Writings/Books/R_Book/Datasets")
list.files()
read.csv("mark_dat.csv")

markdf <- read.csv("/media/mk/9C0C019D0C017394/WINDOWS/Writing/R/R_Book/Datasets/mark_dat.csv")
names(markdf)
typeof(markdf)

# PLOTS

plot(mtcars)
names(mtcars)
with(mtcars, plot(mpg, hp))
mtcarslm <- lm(hp ~ mpg, mtcars)
abline(mtcarslm)
lines(lowess(mtcars$mpg, mtcars$hp), col="blue")

plot(mtcars$wt, mtcars$mpg) 
abline(lm(mtcars$mpg ~ mtcars$wt, data = mtcars))
lines(lowess(mtcars$wt, mtcars$mpg), col="blue")

wt2 = mtcars$wt^2
mpgwtlm <- lm(mpg ~ wt + wt2, data=mtcars)
prdval <- predict(mpgwtlm, data.frame(mtcars, wt2))
lines(mtcars$wt, prdval, col="green")

par(mfrow=c(1, 2))
scatter.smooth(mtcars$mpg ~ mtcars$wt) 
scatter.smooth(mtcars$mpg ~ mtcars$hp)

help("par")

with(airquality, plot(Wind, Ozone))
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd = 2)

Wind2 <- airquality$Wind^2
ozwndlm <- lm(Ozone ~ Wind + Wind2, data = data.frame(airquality, Wind2))
prdvals <- predict(ozwndlm, data.frame(airquality, Wind2))
lines(airquality$Wind, prdvals, col = "darkgreen") # only predictive
scatter.smooth(airquality$Wind, prdvals, col = "darkgreen")

# histogram

hist(mtcars$mpg)  
hist(mtcars$mpg, freq = FALSE); lines(density(mtcars$mpg), col = "red")  

# boxplots

airquality <- transform(airquality, Month = factor(Month))
boxplot(airquality$Ozone ~ airquality$Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")

# pie

par(mfrow = c(1, 2))
pie(BOD$demand,labels = BOD$Time)
# for lables in pie
bodlabels <- round(BOD$demand/sum(BOD$demand)*100, 1)
bodlabels <- paste(bodlabels, "%", "")
pie(BOD$demand, labels = bodlabels)

# learn legend

# UNIVARTIES

help("with")
help("by")

names(markdf)

with(markdf, mean(markdf$salary))
with(markdf, {
  cbind(mean(markdf$salary), sd(markdf$salary))
  }) # use list in stead of cbind()

summary(markdf$gender)
summary(markdf$age)
summary(markdf$salary) # use summary for entire dataset

summary(markdf)

# convert categorical
# method 1
# to find class width

(max(markdf$salary) - min(markdf$salary))/5

markdf$salary1 <- with(markdf, ifelse(salary >= 0 & salary < 20, 1, 
                                 ifelse(salary >= 20 & salary < 40, 2, ifelse(salary >= 40 & salary < 60, 3, 
                                        ifelse(salary >= 60 & salary < 80, 4,  5)))))

head(markdf)

markdf$salary2 <- with(markdf, ifelse(salary >= 0 & salary < 20, "0 to 20", 
                                      ifelse(salary >= 20 & salary < 40, "20 to 40", ifelse(salary >= 40 & salary < 60, "40 to 60", 
                                                                                   ifelse(salary >= 60 & salary < 80, "60 to 80",  "80 to 100")))))
head(markdf)

# method 2
markdf$salary3 <- cut(markdf$salary, c(0, 20, 40, 60, 80, 100), labels = FALSE)

head(markdf)

with(markdf, max(table(markdf$salary2)))
table(markdf$salary2)

# method 3
# using quantiles
per0 <- min(markdf$age)
per25 <- quantile(markdf$age, 0.25)
per75 <- quantile(markdf$age, 0.75)
per100 <- max(markdf$age)

markdf$age1[markdf$age > per0 & markdf$age <= per25] = "less than 25"
markdf$age1[markdf$age > per25 & markdf$age <= per75] = "less than 75"
markdf$age1[markdf$age > per75 & markdf$age <= per100] = "less than 100"

markdf$age1 <- factor(markdf$age1, levels = c("less than 25", "less than 75", "less than 100" ))

with(markdf, max(table(markdf$age1)))
table(markdf$age1)

# apply functions

mymat <- matrix(rnorm(30), 5, 6)
apply(mymat, 2, sum)

names(markdf)
apply(markdf[, 6:14], 2, median)

tapply(markdf$salary, markdf$gender, mean)

sapply(markdf[, 6:14], median)
lapply(markdf[, 6:14], median)
# freequency tables and crosstabs

tab <- table(markdf$gender, markdf$salary4)
tab
margin.table(tab)
margin.table(tab, 1)
margin.table(tab, 2)

prop.table(tab)
prop.table(tab, 1)
prop.table(tab, 2)

# multivariate tables

ftab <- ftable(markdf$gender, markdf$salary4, markdf$employment)

# formulas in tables

xtab <- xtabs(~ markdf$gender+markdf$salary4+markdf$employment, markdf)

# test of indepence
tab
chisq.test(tab)
fisher.test(tab)

# employment is strata
mantelhaen.test(markdf$gender, markdf$salary4, markdf$employment)

# loglinear model
  # mutual independence

library(MASS)
loglm( ~ markdf$gender+markdf$salary4+markdf$employment, xtab)

  # Partial Independence

llt <- loglin(xtab, list(c(1, 2), c(2, 3), c(3, 1))) 
1 - pchisq(llt$lrt, llt$df)

  # conditional independence

loglm(~ markdf$gender+markdf$salary4+markdf$employment+markdf$salary4*markdf$gender+markdf$employment*markdf$gender, xtab)

  # no three way interaction
A = markdf$salary4
B = markdf$employment
C = markdf$gender

loglm(~markdf$salary4+markdf$employment+markdf$gender+markdf$salary4*markdf$employment+markdf$salary4*markdf$gender+markdf$employment*markdf$gender, xtab)

dbinom(15, 30, 0.5) # 50 50 change for gender
dbinom(2, 5, 1/length(levels(factor(markdf$salary2)))) # less than 2 response for salary out of 5 responses, when prob = 20 %

hist(markdf$salary, freq = FALSE); lines(density(markdf$salary))

pnorm(75, mean(markdf$salary), sd(markdf$salary))
pnorm(75, min(markdf$salary), sd(markdf$salary))
pnorm(75, max(markdf$salary), sd(markdf$salary))

mean(markdf$sat1)
pexp(3, 1/2.66)

# t-test

t.test(markdf$salary, mu = 0)

# NON PARAMETRIC

# Sign test
nm <- length(which(markdf$gender == "male"))
binom.test(nm, 30)

nm1 <- length(which(markdf$employment == "top"))
nm2 <- length(which(markdf$employment == "middle"))
nm3 <- length(which(markdf$employment == "low"))

nm1; nm2; nm3
pttop <- prop.test(nm1, 30)
ptmid <- prop.test(nm2, 30)
ptlow <- prop.test(nm3, 30)

pttop$p.value; ptmid$p.value; ptlow$p.value

# normality 
# qqplot

hist(markdf$age, freq = FALSE); lines(density(markdf$age), col = "red")
t.test(markdf$age, mu =  0)

qqnorm(markdf$age)
qqline(markdf$age, col="red")

shapiro.test(markdf$age)
ks.test(markdf$age, "pnorm", mean(markdf$age), sd(markdf$age))


# BIVARIATE ANALYSIS

bhel <- read.csv(file.choose())
col <- read.csv(file.choose())
names(bhel)
names(col)
head(bhel)

bhel <- bhel[, !names(bhel) %in% c("X", "X.1")]
names(bhel)

col <- col[, !names(col) %in% c("X", "X.1")]
names(col)

t.test(bhel$Financial.Levergae, col$Financial.Levergae)
ks.test(bhel$Total.Debt, bhel$Total.Assets)

plot(ecdf(bhel$Total.Debt), col ="red")
plot(ecdf(bhel$Total.Assets), add = TRUE, col = "blue")

# correlation

cor(bhel$Financial.Levergae, col$Financial.Levergae)
cor(bhel$Financial.Levergae, col$Financial.Levergae, method = "spearman")
cor(bhel$Financial.Levergae, col$Financial.Levergae, method = "kendal")

cor.test(bhel$Financial.Levergae, col$Financial.Levergae)

# Regression

bhelregfit <- lm(bhel$Net.Profit.Margin ~ bhel$Financial.Levergae, data = bhel)
summary(bhelregfit)

bhelregfit$fitted.values
bhelregfit$residuals

par(mfrow=c(2, 2))
plot(bhelregfit)

bhel[c(4, 7, 11),]

bhel <- bhel[!names(bhel) %in% c("Year", "Growth")]
names(bhel)
head(bhel)

cor(bhel)

bhelmrout <- lm(bhel$Net.Profit.Margin ~ bhel$Financial.Levergae*bhel$Inflation.Rate, data=bhel)
summary(bhelmrout)

# canonical correlation

help("cancor")
hrdf <- read.csv(file.choose())
names(hrdf)
cancor(hrdf[, 4:6], hrdf[, 7:9])

# MANOVA

finmanova <- manova(cbind(bhel$Net.Profit.Margin, bhel$Return.on.Assets.ROA., bhel$Return.on.Equity.ROE.) ~ bhel$Financial.Levergae, data = bhel)
finmanova
summary(finmanova)
summary.aov(finmanova)

# Factor analysis

# alpha 

custdf <- read.csv(file.choose())

varmat <- diag(var(custdf))
varmat
v = mean(varmatvec)

covarmat <- cov(custdf)
covarmat
covarmat.up <- upper.tri(covarmat, diag = FALSE)
covarmat.up
covarmatvec <- covarmat[covarmat.up]
c = mean(covarmatvec)

alpha <- function(df){
  
  varmat <- diag(var(df))
  varmat
  v = mean(varmatvec)
  
  covarmat <- cov(df)
  covarmat
  covarmat.up <- upper.tri(covarmat, diag = FALSE)
  covarmat.up
  covarmatvec <- covarmat[covarmat.up]
  c = mean(covarmatvec)
  
  k = length(df)
  
  out <- (k*c)/(v + k*c)
  return(out)
}

alpha(custdf)

# bartletts test

bartlett.test(custdf)

# KMO

cormat <- cor(custdf)
cormat.up <- upper.tri(cor(custdf), diag = FALSE)
sum(cormat[cormat.up]^2)

covmat <- cov(custdf)
covmat.up <- upper.tri(covmat, diag = FALSE)
sum(covmat[covmat.up])

kmo.test <- function(df){
  cormat <- cor(custdf)
  cormat.up <- upper.tri(cor(custdf), diag = FALSE)
  r2 <- sum(cormat[cormat.up]^2)
  
  covmat <- cov(custdf)
  covmat.up <- upper.tri(covmat, diag = FALSE)
  u2 <- sum(covmat[covmat.up]^2)
  
  out <- (r2/(r2+u2))
  
  return(out)
}

# scree plot

screeplot(princomp(custdf, 3), type = "lines", col = "blue")

factanal(custdf, 3)
