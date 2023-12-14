#Loading libraries
source("scripts/libraries.R")
source("scripts/functions.R")

#Loading in our data
setwd("~/work")
data1 <- read_csv("dataset/data1.csv")

p10 <- ggplot(data1, aes(x=BMI, y=`Heart Disease`, fill=`Heart Disease`)) +
  geom_violin() +
  stat_summary(fun = mean, geom = "point", color = "black", size = 3) +
  xlim(c(18,60)) +
  theme_minimal()

p11<- ggplot(data1, aes(x=`Alcohol Consumption`, y=`Heart Disease`, fill=`Heart Disease`)) +
  geom_violin() +
  stat_summary(fun = median, geom = "point", color = "black", size = 3) +
  xlim(c(0,20)) +
  theme_minimal()

p12 <- ggplot(data1, aes(x=`Fruit Consumption`, y=`Heart Disease`, fill=`Heart Disease`)) +
  geom_violin() +
  stat_summary(fun = median, geom = "point", color = "black", size = 3) +
  theme_minimal()

p13 <- ggplot(data1, aes(x=`Vegetable Consumption`, y=`Heart Disease`, fill=`Heart Disease`)) +
  geom_violin() +
  stat_summary(fun = median, geom = "point", color = "black", size = 3) +
  theme_minimal()

p14 <- ggplot(data1, aes(x=`Fries Consumption`, y=`Heart Disease`, fill=`Heart Disease`)) +
  geom_violin() +
  stat_summary(fun = median, geom = "point", color = "black", size = 3) +
  theme_minimal()
combined_plot2 <- p10 + p11 + p12 + p13
ggsave("~/work/figures/combined_plot2.png", combined_plot2, width = 15, height = 10)