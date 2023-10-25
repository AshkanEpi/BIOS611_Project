setwd(getwd())
library(tidyverse)

data1 <- read_csv("source/CVD_cleaned.csv")

figure1 <- ggplot(data1) + geom_boxplot(aes(x=FriedPotato_Consumption))
figure2 <- ggplot(data1) + geom_histogram(aes(x=BMI))

ggsave(filename = "figures/figure1.png", plot = figure1)
ggsave(filename = "figures/figure2.png", plot = figure2)