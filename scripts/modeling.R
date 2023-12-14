#Loading libraries
source("scripts/libraries.R")
source("scripts/functions.R")

#Loading in our data
setwd("~/work")
data2 <- read_csv("dataset/data2.csv")
data2 <- data2 %>% 
  mutate_if(is.character, as.factor)

#training our data
train1_test1(data=data2, outcome=`HeartDisease`)
# Selecting variables and creating the formula
variables <- names(train1 %>% select(-c(SkinCancer, OtherCancer, HeartDisease, Weight, Height)))
formula1 <- as.formula(paste("HeartDisease", "~", paste(variables, collapse = " + ")))

# Constructing the GBM model
model <- gbm(formula1, data=train1, distribution="bernoulli")

# Open a PNG graphics device
png("~/work/figures/relative_influence_plot.png", width = 1000, height = 1000)

# Create the plot
summary(model, plotit = TRUE)

# Close the graphics device
dev.off()

model_sum <- summary(model)
save(model_sum, file = "~/work/tables/model_summary.RData")

prob <- predict(model, newdata=test1, type="response")
predictions <- ifelse(prob > 0.5, 1, 0)


# Assuming 'predictions' and 'test1$HeartDisease' are your predicted and actual values
# Convert them to factors with levels in the order of 1 then 0
predictions_factor <- factor(predictions, levels = c(1, 0))
heart_disease_factor <- factor(test1$HeartDisease, levels = c(1, 0))

# Create the confusion matrix
conf_matrix <- confusionMatrix(predictions_factor, heart_disease_factor)

# Display the confusion matrix
save(conf_matrix, file = "~/work/tables/confusion.RData")

#Making a ROC curve
png("~/work/figures/ROC.png", width = 500, height = 500)
roc_obj <- roc(test1$HeartDisease, prob)
plot(roc_obj, main="ROC Curve")
abline(h=0, v=1, col="gray")
dev.off()

model_auc <- auc(roc_obj)
save(model_auc, file = "~/work/tables/model_auc.RData")