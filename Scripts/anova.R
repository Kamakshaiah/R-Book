# one-way anova
# markdf$satisfaction <- colMeans(markdf[, c('sat1', 'sat2', 'sat3')] # don't run
markdf$satisfaction <- apply(markdf, 1, median)
markdf$satisfaction <- as.numeric(markdf$satisfaction)
head(markdf$satisfaction)

# aov(salary ~ satisfaction, data = markdf)
aov_fit <- aov(salary ~ satisfaction, data = markdf)
summary(aov_fit)
summary.lm(aov_fit)

