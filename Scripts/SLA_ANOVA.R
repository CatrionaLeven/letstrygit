SLA <- read.csv("Data/SLA_Canadian cities.csv")

library(vegan)
library(car)
library(tidyverse)

glimpse(SLA)

unique(SLA$City)


## Histogram
histogram <- ggplot(SLA, aes(x = value, fill = City)) +
  facet_wrap(~City) +
  geom_histogram(bins = 50)

histogram


## one way anova

ANOVA <- lm(value ~ City, data = SLA)
summary(ANOVA)

Call:
  lm(formula = value ~ City, data = SLA)


ANOVA(ANOVA, type = "2")

# don't push your whole project and don't push your gitignore!

# whatever I've done next definitely doesn't work but I'm not entirely sure why. 

-SLA %>% group_by(City) %>% summarise(SLA.avg = mean(value)),
-SLA.sd = sd(value),
SLA.n = length (value),
SLA.se = sd(value)/sqrt(n())

ANOVA.fig <- ggplot(Summary, aes(City, SLA.avg, fill = City)) +
  geom_col() +
  geom_errorbar(aes(ymin = SLA.avg - SLA.se, ymax = SLA.avg +SLA.se), width = 0.2) +
  theme_classic() +
  ylim(0, 40)

ANOVA.fig

ggsave("Figures/SLA_barchart.JPEG")
