library(ggplot2)

?economics
a <- ggplot(economics, aes(date, unemploy))
# b <- ggplot(seals, aes(x = long, y = lat)

a + geom_polygon()

# lines 

b <- ggplot(seals, aes(x = long, y = lat))
b + geom_abline(aes(intercept = 0, slope = 1))
b + geom_hline(aes(yintercept = lat))
b + geom_vline(aes(xintercept = long))
b + geom_segment(aes(yend = lat + 1, xend = long + 1))
b + geom_spoke(aes(angle = 1:1155, radius = 1))

# univariate

ggplot(mpg, aes(hwy)) + geom_histogram(binwidth = 5)

c <- ggplot(mpg, aes(hwy)); c2 <- ggplot(mpg)
c + geom_histogram(binwidth = 5)

c + geom_area(stat = "bin")
# x, y, alpha, color, fill, linetype, size
c + geom_density(kernel = "gaussian")
# x, y, alpha, color, fill, group, linetype, size, weight
c + geom_dotplot()
# x, y, alpha, color, fill
c + geom_freqpoly()
# x, y, alpha, color, group, linetype, size
c + geom_histogram(binwidth = 5)
# x, y, alpha, color, fill, linetype, size, weight
c2 + geom_qq(aes(sample = hwy))
# x, y, alpha, color, fill, linetype, size, weight

# bar plot
names(mtcars)
head(mtcars)
ggplot(mtcars, aes(gear)) +  geom_bar() 
