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

#Residuals:
  Min      1Q  Median      3Q     Max 
-22.435  -6.924  -1.294   4.885 123.213 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)   22.65752    0.84147  26.926   <2e-16 ***
  CityHalifax    1.38345    1.01512   1.363   0.1731    
CityMontreal   2.17045    0.96572   2.248   0.0247 *  
  CityToronto    1.35515    0.95908   1.413   0.1578    
CityVancouver  1.10304    0.96802   1.139   0.2546    
CityWinnipeg  -0.01167    1.30174  -0.009   0.9928    
---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 10.74 on 2195 degrees of freedom
Multiple R-squared:  0.003497,	Adjusted R-squared:  0.001227 
F-statistic: 1.541 on 5 and 2195 DF,  p-value: 0.1739


ANOVA(ANOVA, type = "2")

# don't push your whole project and don't push your gitignore!
