library(lattice)
attach(mtcars)

# create factors with value labels
gear.f<-factor(gear,levels=c(3,4,5),
               labels=c("3gears","4gears","5gears"))
cyl.f <-factor(cyl,levels=c(4,6,8),
               labels=c("4cyl","6cyl","8cyl"))

# scatterplots for each combination of two factors
# xyplot(mpg~wt|cyl.f*gear.f,
#        main="Scatterplots by Cylinders and Gears",
#        ylab="Miles per Gallon", xlab="Car Weight")

# scatterplots for each combination of two factors
xyplot(mpg~wt, type=c("p","r"))

# bar chart
barchart(yield ~ variety | site, data = barley)

age <- round(runif(10, 10, 80), 2)
gender <- sample(c('male', 'female'), 10, replace = T)
education <- sample(c('educated', 'uneducated'), 10, replace = T)
head(cbind.data.frame(age, gender, education))

barchart(age ~ education | gender, data = barley)

# kernel density plot
densityplot(~mpg, 
            main="Density Plot",
            xlab="Miles per Gallon")

histogram(~ mpg)
# xyplot(mpg ~ am | cyl, panel = lattice.getOption("panel.smoother"))

# box plot 

bwplot(voice.part ~ height, data=singer, xlab="Height (inches)")

# pie chart

library(latticetools)
install.packages('devtools')
require(devtools)
devtools::install_github("https://github.com/m-jahn/lattice-tools")

data("USMortality")

# xyplot( ~ Rate | Sex, USMortality,
#         main = "US mortality rates by sex",
#         scales = list(draw = FALSE), cex = 0.7,
#         panel = function(x, ...) {
#           panel.piechart(x, ...)
#         }
# )

xyplot( ~ Rate | Sex, USMortality,
        panel = function(x, ...) {
          panel.piechart(x, ...)
        }
)