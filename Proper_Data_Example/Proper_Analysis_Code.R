# load packages
library(ggplot2)
library(dplyr)

# read raw data
iris = read.csv("./Proper_Data_Example/Proper_Raw_Data.csv") 

# quick summaries (numeric and visual)
summary(iris)
plot(iris)

# linear regression of sepal length as a function of sepal width
summary(lm(iris$Sepal.Length ~ iris$Sepal.Width))

# quick plot of same regression
plot(x=iris$Sepal.Width,y=iris$Sepal.Length)
abline(lm(iris$Sepal.Length ~ iris$Sepal.Width))

# pretty plot of same, but divided by iris species
plot1 = ggplot(iris, aes(x=Sepal.Width,y=Sepal.Length,color=Species)) +
  geom_point() +
  stat_smooth(se=FALSE, method = "lm") +
  ggtitle("Sepal Lengths and Widths with LM Regression by Species")
# View
plot1

# Save to file
ggsave(plot1, filename = "./Proper_Data_Example/Plot1.jpg", dpi = 200)

# stat summaries by species for Sepal Length
Sep_Length_Summary = iris %>%
  group_by(Species) %>%
  summarize(N=n(), Min = min(Sepal.Length), Mean = mean(Sepal.Length), Max = max(Sepal.Length),
            SD = sd(Sepal.Length))
# View
Sep_Length_Summary

# Find points for +/- SD Error bars
summary = Sep_Length_Summary %>%
  mutate(MinErrorBar = Mean - SD, MaxErrorBar = Mean + SD)
# View
summary

# Write to file
sink("./Proper_Data_Example/Output_Summary.txt")
summary
sink(NULL)

