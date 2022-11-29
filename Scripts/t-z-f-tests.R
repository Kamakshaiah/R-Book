# age vs. growth
bhel <- read.csv(file.choose())
min(bhel$Age)
max(bhel$Age)
bhel$age_cats <- cut(bhel$Age, c(40, 50, 60))
table(bhel$age_cats)
t.test(bhel$Growth ~ bhel$age_cats) # p-value = 0.03423

# bivariate normality
ks.test(bhel$Growth, bhel$Age)
qqplot(bhel$Growth, bhel$Age)

# z tests

iqlevels <- c(88, 92, 94, 94, 96, 97, 97, 97, 99, 99, 105, 109, 109, 109, 110, 112, 112, 113, 114, 115)
# mu = 100, sd = 15
n <- length(iqlevels)
mu = 100; sd=15

# calculate the z-statistic
z_stat <- (mean(iqlevels) - mu) / (sd / sqrt(n))
print(z_stat)

pvalue <- 2*pnorm(q=z_stat, lower.tail=FALSE) # pvalue =  0.3631737
print(pvalue)

# two sample z tests

iqcitya = c(82, 84, 85, 89, 91, 91, 92, 94, 99, 99,
          105, 109, 109, 109, 110, 112, 112, 113, 114, 114)

iqcityb = c(90, 91, 91, 91, 95, 95, 99, 99, 108, 109,
          109, 114, 115, 116, 117, 117, 128, 129, 130, 133)

z_stat <- (mean(iqcitya) - mean(iqcityb)) / sqrt((sd^2 / length(iqcitya)) + (sd^2/length(iqcitya)))
print(z_stat)

2*pnorm(q=abs(z_stat), lower.tail=FALSE) # pvalue = 0.08576545 

z_test <- function(x, y=NULL, mu=0, std = 1, type='one'){
  if (type == 'one'){
    z_stat <- (mean(x) - mu) / (sd / sqrt(n))
    pvalue <- 2*pnorm(q=z_stat, lower.tail=FALSE)
    return(c(z_stat, pvalue))
  } else {
    z_stat <- (mean(x) - mean(y)) / sqrt((sd^2 / length(x)) + (sd^2/length(y)))
    pvalue <- 2*pnorm(q=abs(z_stat), lower.tail=FALSE)
    return(c(z_stat, pvalue))
  }
}

# f test 

salesA <- round(runif(12)*100, 2)
salesB <- round(runif(12)*100, 2)

var.test(salesA, salesB)
