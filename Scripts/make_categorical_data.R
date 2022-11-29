markdf <- read.csv(file.choose())
markdf$salary
markdf$salary_cats <- cut(markdf$salary, c(0, 25, 50, 100))
markdf$salary_cats
is.factor(markdf$salary_cats)
levels(markdf$salary_cats)
markdf$salary_cats_numerical <- ifelse(markdf$salary_cats == levels(markdf$salary_cats)[1], 1, markdf$salary_cats == levels(markdf$salary_cats)[2], 2, 3)
markdf$salary_cats_numerical