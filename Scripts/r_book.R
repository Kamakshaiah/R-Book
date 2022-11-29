# R BOOK NOTES

# R Studio review

# SESSIONS

sessionInfo()

# I/O

# inputs
c()
# :
seq()
assign()
sample()
readline()
readLines()
readClipboard()

# output
print()
sprintf()
cat

# FILE MANAGEMENT

getwd()
dirname('~')
list.dirs() # or dir()
list.files()
dir.create('mydir')
setwd('mydir')
setwd('~') # to come back to home directory
unlink('mydir', recursive = TRUE) # to delete directory
sink() # to sink results

# FILE I/E

readline()
readLines()
readClipboard()

# write

write.csv(obj, path)

x <- readClipboard() # copy the path to clipboard from files url
pathch <- gsub("\\\\", "/", x)
file_path <- file.path(pathch, "air-quality.csv")
write.csv(airquality, file_path) # check the path for the file 'air-quality.csv'


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

# DATA STRUCTURES

# vectors 
x <- 1:10
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

# lists

li <- list(a=1, b=2, c="hi")
typeof(li)
class(li)
mode(li)
dim(li) # NULL
length(li)

# inside elements

names(li)
li
li$a
typeof(li$a)

# list insertion or append

li$d <- 1:5
li$d
typeof(li$d)
class(li$d)
is.vector(li$d)
mean(li$d)

li$name <- c('I am kamakshaiah') # c() is must
li$name
strsplit(li$name, " ")

# functions in lists

li$f <- function(){print('hello world!')}
typeof(li$f) # closure
li$f()

# data matrix


# data frames

typeof(airquality)
names(airquality)
df <- data.frame(airquality)
names(df)
df[1:6, 1:2]

head(subset(df, subset = !is.na(Solar.R) ))

# ASSIGNMENT OPERATORS

# functional scoping 

new_counter <- function() {
  i <- 0
  function() {
    i <<- i + 1
    i
  }
}

new_counter1 <- function() {
  i <- 0
  function() {
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

# PROGRAMMING

# conditionals 

# loops

# functions

  # in-built 
  # user defined
    # nested functions
  # infix

# HELP

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

# data sets

data() # datasets package
typeof(data())
names(data())
length(data()[[3]])
data()[[3]][1:10, 3]

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

# box plots

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

# OTHER PLOTS

# contours 
x <- -6:16
# plots_path <- readClipboard()
# file_path <- file.path(plots_path, 'contour.png')
# png(file_path)
contour(outer(x, x))
filled.contour(outer(x, x))

z <- outer(x, sqrt(abs(x)), FUN = "+")
contour(x, x, z)
filled.contour(x, x, z)
dev.off()

# perspective maps

# persp(x = seq(0, 1, length.out = 5),
#       y = seq(0, 1, length.out = 5),
#       z = outer(x, y, (function(x, y)x^2+y^2)(x, y)))

x <- seq(-10, 10, length= 30)
y <- x
f <- function(x, y) { r <- sqrt(x^2+y^2); 10 * sin(r)/r }
z <- outer(x, y, f)
z[is.na(z)]
z[is.na(z)] <- 1
op <- par(bg = "white")
persp(x, y, z, theta = 30, phi = 30, expand = 0.5, col = "lightblue")
persp(x, y, z, theta = 30, phi = 30, expand = 0.5, col = "lightblue",
      ltheta = 120, shade = 0.75, ticktype = "detailed",
      xlab = "X", ylab = "Y", zlab = "Sinc( r )"
) -> res

# MAPS

#install.packages('maps')
#library('maps')
## finding Indian info. 

head(map("world", namesonly = T, plot = F))

world <- map("world", plot = FALSE, namesonly = T)  
India <- world[grep("India", world)] 
data.frame(India)

lanka <- world[grep("Lanka", world)]  
lanka

# res <- grep('India', map("world", namesonly = T, plot = F))
# res
# map("world", namesonly = T, plot = F)[res]
# map("world", namesonly = T, plot = F)[839]

map("world", "India", fill = TRUE, col = "white", namesonly = TRUE)
map("world", regions = c(India, "Sri Lanka"), interior = TRUE, fill = T, col = "white", lty = 0, bg = "lightblue")
points(x = 83.3775, y = 17.7816,  col='red')
text(x = 83.3775, y = 17.7816, col='red')

# coordinates <- list(delhi=c(77.1025, 28.7041), visakha=c(83.2185, 17.6868), hyd = c(78.4867, 17.3850), kanya = c(77.5385, 8.0883))
# map("world", regions = c(India, "Sri Lanka"), interior = TRUE, fill = T, col = "white", lty = 0, bg = "lightblue")
# points(x = coordinates[[2]][1], y = coordinates[[2]][2], col = 'red')

longitudes <- runif(10, 72, 83)
latitudes <- runif(10, 8, 28)

coord_df <- data.frame(longitudes, latitudes)
head(coord_df)

map("world", regions = c(India, "Sri Lanka"), interior = TRUE, fill = T, col = "white", lty = 0, bg = "lightblue")

points(x = coord_df$longitudes, y = coord_df$latitudes, col = 'red', pch = 20)

# ggmap

# library(pacman)
# library(ggmap)
pacman::p_load(ggmap, osmdata)
# # map <- qmap('Telangana', zoom = 7, maptype = 'hybrid')
map <- get_map(location = getbb("telangana"), zoom = 6, source = "stamen")
# map <- get_map(getbb("karnataka"), zoom = 5, source = "stamen")
plot(map)

# sp

library(sp)
library(RColorBrewer)
# https://gadm.org/download_country.html
ind <- geodata::gadm("India", level = 0, path = tempdir())
# load("IND_1.RData")
spplot(ind)




# google vis

install.packages('googleVis')
library(googleVis)
gchart <-  gvisGeoChart(data = Exports, 
                        locationvar='Country',
                        colorvar='Profit',
                        options=list(projection="kavrayskiy-vii", 
                                     width=400, height=200))

plot(gchart)

# install.packages('mapproj')
# library(mapproj)
# map(database= "world", regions  = "India", exact=T, col="grey80", fill=TRUE, projection="gilbert", orientation= c(90,0,90))
# lat <- c(23.30, 28.38)
# lon <- c(80, 77.12) # Lon and Lat for two cities Bhopal and Delhi
# coord <- mapproject(lon, lat, proj="gilbert", orientation=c(90, 0, 90))
# points(coord, pch=20, cex=1.2, col="red")



# 3d

# non-linear

x <- -30:30
y <- 2*x + 2
y1 <- x^2 + 2*x + 2
y2 <- x^3 + x^2 + 2*x + 2
y3 <- x^4 + x^3 + x^2 + 2*x + 2

par(mfrow=c(2,2))
plot(x, y, type='l', col='blue', main='linear')
plot(x, y1, type='l', col='blue', main='sencond-order')
plot(x, y2, type='l', col='blue', main='third-order')
plot(x, y3, type='l', col='blue', main='forth-order')

# 

x <- -30:30
y <- x

f <- function(x, y) 2*x + y
f1 <- function(x, y) x^2 + 2*y + 2
f2 <- function(x, y) x^3 + y^2 + 2*x + 2
f3 <- function(x, y) x^4 + y^3 + x^2 + 2*y + 2

z <- outer(x, y, f)
z1 <- outer(x, y, f1)
z2 <- outer(x, y, f2)
z3 <- outer(x, y, f3)

par(mfrow=c(2,2))

persp(x, y, z, theta = 30, phi = 30, expand = 0.5, col = "lightblue")
persp(x, y, z1, theta = 30, phi = 30, expand = 0.5, col = "lightgreen")
persp(x, y, z2, theta = 30, phi = 30, expand = 0.5, col = "lightpink")
persp(x, y, z3, theta = 30, phi = 30, expand = 0.5, col = "lightyellow")

# actual data sets

z <- 2 * volcano     # Exaggerate the relief
x <- 10 * (1:nrow(z)) # 10 meter spacing (S to N)
y <- 10 * (1:ncol(z)) # 10 meter spacing (E to W)


# Don't draw the grid lines : border = NA
par(bg = "gray")
persp(x, y, z, theta = 135, phi = 30,
      col = "brown", scale = FALSE,
      ltheta = -120, shade = 0.75,
      border = NA, box = FALSE)
par()

# ANIMATIONS

# testit <- function(x)
# {
#   p1 <- proc.time()
#   Sys.sleep(x)
#   proc.time() - p1 # The cpu usage should be negligible
# }
# testit(3.7)

# png(file="example%02d.png", width=480, height=480)
# par(bg="grey")
for (i in c(5:1, "G0!")){
  Sys.sleep(1)
  plot.new()
  text(.5, .5, i, cex = 6 )
}
dev.off()



# Use image magik
system("convert -delay 80 *.png animated_count_down.gif")

# Remove png files
file.remove(list.files(pattern=".png"))

# maps

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

meanAboveBelow <- function(x, opt = "above"){
  m = mean(x)
  if (opt == "above"){
    x = x[x > m]
    return(mean(x))
  } else if (opt == "below"){
    x = x[x < m]
    return(mean(x))
  }
}

makeCats <- function(dat){
  max <- max(dat)
  min <- min(dat)
  q1 <- quantile(dat, 0.25)
  q2 <- quantile(dat, 0.50)
  q3 <- quantile(dat, 0.75)
  
  cats <- ifelse(dat > 0 & dat <= q1, 1, ifelse(dat > q1 & dat <= q2, 2, ifelse(dat > q2 & dat <= q3, 3, ifelse(dat > q3 & dat <= max, 4, 5))))
  return(cats)
  
}

# Accuracy measures for regression 

checkAccuracy <- function(actuals, predicted){
  
  mins <- apply(cbind.data.frame(actuals, predicted), 1, min)  
  maxs <- apply(cbind.data.frame(actuals, predicted), 1, max)
  mmacuracy <- mean(mins/maxs)
  mape <- mean(abs((predicted - actuals)/actuals))
  
  return(c(mmacuracy, mape))
  
}




