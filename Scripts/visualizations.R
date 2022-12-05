# base plot command
plot(mtcars$mpg, mtcars$hp)
lines(lowess(mtcars$mpg, mtcars$hp), col = "blue")

# pairs
pairs(mtcars, panel = panel.smooth, main = "mtcars data")


# colors() # for list of colours
lines(lowess(mtcars$mpg, mtcars$hp), col = colors()[640])

# boxplot (with outliers)

summary(airquality$Month)
with(airquality, c(min(Month), max(Month)))
air_qual_month <- transform(airquality, Month = factor(Month))

head(air_qual_month)
levels(air_qual_month$Month)
# with(air_qual_month, boxplot(Ozone ~ month))

box_plot <- boxplot(Ozone ~ Month, data = air_qual_month)
box_plot$out
air_qual_month[box_plot$out, ]

