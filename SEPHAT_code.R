library(ggplot2)
dat = read.csv("./SEPHAT.csv")

# quickly plot relative abundance
p = ggplot(dat, aes(x=Week, y= RelAbund, color=Location, group = Location)) +
  geom_point() + stat_smooth(method = "lm") 
p

# Can make the plot nicer, if we want
ggplot(dat, aes(x=Week, y= RelAbund, color=Location, group = Location)) +
  geom_point() + stat_smooth() + theme_minimal() +
  scale_color_brewer(labels = c("Hatchery","Sewage Plant"),type = "qual", palette = 2) +
  labs(y="Relative Abundance of Coliform Bacteria")

# Build a statistical model of relative abundance, explained by location and week
model = aov(RelAbund ~ Location * factor(Week), data = dat)
summary(model)
TukeyHSD(model)$Location

#### None of the above works unless data is TIDY ####

