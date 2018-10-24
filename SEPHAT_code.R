library(ggplot2)
dat = read.csv("./SEPHAT.csv")

# quickly plot relative abundance
ggplot(dat, aes(x=Week, y= RelAbund, color=Location, group = Location)) +
  geom_point() + stat_smooth(method = "lm") 

# Build a statistical model of relative abundance, explained by location and week
model = aov(RelAbund ~ Location * factor(Week), data = dat)
summary(model)
TukeyHSD(model)$Location

