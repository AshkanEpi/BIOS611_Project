#Loading libraries
source("scripts/libraries.R")
source("scripts/functions.R")

#Loading in our data
setwd("~/work")
data1 <- read_csv("source/CVD_cleaned.csv")
data_c <- read_csv("dataset/data_c.csv")

look <- summary(data1)

proportions <- lapply(data_c, proportion)

BMI <- data1 %>% group_by(Heart_Disease) %>% normal_stat(BMI)
BMI2<- t.test(BMI ~ Heart_Disease,data = data1, var.equal=T)

alcohol <- data1 %>% group_by(Heart_Disease) %>% skewed_stat(Alcohol_Consumption)
alcohol2 <- wilcox.test(Alcohol_Consumption ~ Heart_Disease,data = data1)

fruit <- data1 %>% group_by(Heart_Disease) %>% skewed_stat(Fruit_Consumption)
fruit2<- wilcox.test(Fruit_Consumption ~ Heart_Disease,data = data1)

veggies <- data1 %>% group_by(Heart_Disease) %>% skewed_stat(Green_Vegetables_Consumption)
veggies2 <- wilcox.test(Green_Vegetables_Consumption ~ Heart_Disease,data = data1)

fries <- data1 %>% group_by(Heart_Disease) %>% skewed_stat(FriedPotato_Consumption)
fries2 <- wilcox.test(FriedPotato_Consumption ~ Heart_Disease,data = data1)

save(look, file = "~/work/tables/first_look.RData")
save(proportions, file = "~/work/tables/proportions.RData")
save(BMI, BMI2, file = "~/work/tables/BMI.RData")
save(alcohol, alcohol2, file = "~/work/tables/alcohol.RData")
save(fruit, fruit2, file = "~/work/tables/fruit.RData")
save(veggies, veggies2, file = "~/work/tables/veggies.RData")
save(fries, fries2, file = "~/work/tables/fries.RData")