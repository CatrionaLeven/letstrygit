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

ANOVA(ANOVA, type = "2")
