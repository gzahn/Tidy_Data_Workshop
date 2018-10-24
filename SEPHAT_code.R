library(ggplot2)
dat = read.csv("./SEPHAT.csv")

ggplot(dat, aes(x=Week, y= RelAbund, color=Location, group = Location)) +
  geom_point() + stat_smooth(method = "lm") 

model = aov(RelAbund ~ Location * factor(Week), data = dat)
summary(model)
TukeyHSD(model)$Location

