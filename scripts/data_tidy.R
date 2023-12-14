#Loading libraries
source("scripts/libraries.R")
source("scripts/functions.R")

#Loading in our data
setwd("~/work")
data1 <- read_csv("source/CVD_cleaned.csv")

#Clean up
data1$`Heart Disease` <- data1$Heart_Disease
data_c <- data1[,sapply(data1, is.character)]

data_c$`Heart Disease` <- data_c$Heart_Disease
data_c$`General Health` <- case_when(
  data_c$General_Health %in% c("Excellent", "Very Good", "Good") ~ "Good or better",
  data_c$General_Health %in% c("Fair", "Poor") ~ "Fair or worse",
  TRUE ~ NA_character_  
)
data_c$Diabetes <- case_when(
  data_c$Diabetes %in% c("Yes", "Yes, but female told only during pregnancy") ~ "Yes",
  data_c$Diabetes %in% c("No", "No, pre-diabetes or borderline diabetes") ~ "No",
  TRUE ~ NA_character_  
)
data_c$`Check up` <- case_when(
  data_c$Checkup %in% c("Never", "5 or more years ago") ~ "Never or more than 5 years ago",
  data_c$Checkup %in% c("Within the past 2 years", "Within the past 5 years", "Within the past year") ~ "Within the past 5 years",
  TRUE ~ NA_character_  
)
data_c$`Female Sex` <- case_when(
  data_c$Sex %in% c("Female") ~ "Yes",
  data_c$Sex %in% c("Male") ~ "No",
  TRUE ~ NA_character_  
)
data_c$`Age` <- case_when(
  data_c$Age_Category %in% c("18-24", "25-29", "30-34", "35-39", "40-44", "45-49", "50-54") ~ "Less than 55 years",
  TRUE ~ "More than 55 years" 
)
data_c$`Smoking` <- case_when(
  data_c$Smoking_History == "Yes" ~ "Yes",
  TRUE ~ "No" 
)

Exercise_d <- data_c %>% group_by(Heart_Disease, Exercise) %>% summarise(n=n())
Checkup_d <- data_c %>% group_by(Heart_Disease, `Check up`) %>% summarise(n=n())
GH_d <- data_c %>% group_by(Heart_Disease, `General Health`) %>% summarise(n=n())
Depression_d <- data_c %>% group_by(Heart_Disease, Depression) %>% summarise(n=n())
Arthritis_d <- data_c %>% group_by(Heart_Disease, Arthritis) %>% summarise(n=n())
Diabetes_d <- data_c %>% group_by(Heart_Disease, Diabetes) %>% summarise(n=n())
Sex_d <- data_c %>% group_by(Heart_Disease, `Female Sex`) %>% summarise(n=n())
Age_d <- data_c %>% group_by(Heart_Disease, `Age`) %>% summarise(n=n())
Smoke_d <- data_c %>% group_by(Heart_Disease, `Smoking`) %>% summarise(n=n())

Raw <- bind_rows(Exercise_d, Checkup_d, GH_d, Depression_d, Arthritis_d, Diabetes_d, Sex_d, Age_d, Smoke_d)

Raw2<- Raw %>% pivot_longer(cols = c(Exercise, `Check up`, `General Health`, Depression, Arthritis, Diabetes, `Female Sex`, Age, Smoking),
                            names_to = "Factor", values_to = "Category")
Raw2$total <- if_else(Raw2$Heart_Disease == "No", 283883, 24971)
Raw2$Percentage <- Raw2$n/Raw2$total*100
Raw2$`Heart Disease` <- Raw2$Heart_Disease

data1$`Alcohol Consumption` <- data1$Alcohol_Consumption
data1$`Fruit Consumption` <- data1$Fruit_Consumption
data1$`Vegetable Consumption` <- data1$Green_Vegetables_Consumption
data1$`Fries Consumption` <- data1$FriedPotato_Consumption

data2 <- read_csv("source/CVD_cleaned.csv")
data2 <- data2 %>% rename_with(~ gsub("_", "", .x))
data2$Height <- data2$`Height(cm)`
data2$Weight <- data2$`Weight(kg)`
data2 <- data2 %>% select(-c(`Height(cm)`, `Weight(kg)`))
data2$HeartDisease <- if_else(data2$HeartDisease=="Yes", 1,0)

#saving datasets
# Assuming df is your data frame
write_csv(data_c, "dataset/data_c.csv")
write_csv(Raw2, "dataset/raw2.csv")
write_csv(data1, "dataset/data1.csv")
write_csv(data2, "dataset/data2.csv")