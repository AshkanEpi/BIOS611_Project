#Loading libraries
source("scripts/libraries.R")
source("scripts/functions.R")

#Loading in our data
setwd("~/work")
Raw2 <- read_csv("dataset/raw2.csv")


Exercise <- Raw2 %>% filter(Factor=="Exercise", is.na(Category)==F)
p1 <- ggplot(Exercise, aes(x = `Heart Disease`, y = Percentage, fill = Category)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = round(Percentage)), position = position_dodge(width = 0.9), vjust = -0.5) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme_minimal() + labs(title = "Exercise")
Check_up <- Raw2 %>% filter(Factor == "Check up", is.na(Category) == FALSE)
p2 <- ggplot(Check_up, aes(x = `Heart Disease`, y = Percentage, fill = Category)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = round(Percentage)), position = position_dodge(width = 0.9), vjust = -0.5) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme_minimal() + labs(title = "Checkup")
General_Health <- Raw2 %>% filter(Factor == "General Health", is.na(Category) == FALSE)
p3 <- ggplot(General_Health, aes(x = `Heart Disease`, y = Percentage, fill = Category)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = round(Percentage)), position = position_dodge(width = 0.9), vjust = -0.5) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme_minimal() + labs(title = "General Health")
Depression <- Raw2 %>% filter(Factor == "Depression", is.na(Category) == FALSE)
p4 <- ggplot(Depression, aes(x = `Heart Disease`, y = Percentage, fill = Category)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = round(Percentage)), position = position_dodge(width = 0.9), vjust = -0.5) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme_minimal() + labs(title = "Depression")
Arthritis <- Raw2 %>% filter(Factor == "Arthritis", is.na(Category) == FALSE)
p5 <- ggplot(Arthritis, aes(x = `Heart Disease`, y = Percentage, fill = Category)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = round(Percentage)), position = position_dodge(width = 0.9), vjust = -0.5) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme_minimal() + labs(title = "Arthritis")
Diabetes <- Raw2 %>% filter(Factor == "Diabetes", is.na(Category) == FALSE)
p6 <- ggplot(Diabetes, aes(x = `Heart Disease`, y = Percentage, fill = Category)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = round(Percentage)), position = position_dodge(width = 0.9), vjust = -0.5) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme_minimal() + labs(title = "Diabetes")
Female_Sex <- Raw2 %>% filter(Factor == "Female Sex", is.na(Category) == FALSE)
p7 <- ggplot(Female_Sex, aes(x = `Heart Disease`, y = Percentage, fill = Category)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = round(Percentage)), position = position_dodge(width = 0.9), vjust = -0.5) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme_minimal() + labs(title = "Female Sex")
Age <- Raw2 %>% filter(Factor == "Age", is.na(Category) == FALSE)
p8 <- ggplot(Age, aes(x = `Heart Disease`, y = Percentage, fill = Category)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = round(Percentage)), position = position_dodge(width = 0.9), vjust = -0.5) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme_minimal() + labs(title = "Age")
Smoking <- Raw2 %>% filter(Factor == "Smoking", is.na(Category) == FALSE)
p9 <- ggplot(Smoking, aes(x = `Heart Disease`, y = Percentage, fill = Category)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = round(Percentage)), position = position_dodge(width = 0.9), vjust = -0.5) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme_minimal() + labs(title = "Smoking History")
combined_plot <- p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8 + p9 
ggsave("~/work/figures/combined_plot.png", combined_plot, width = 15, height = 13)