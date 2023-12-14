proportion <- function(x){
  PercTable(x, useNA= "always", rfrq="001")
}

# Function for normal statistics
normal_stat <- function(data, col) {
  data %>%
    summarise(Mean = mean({{ col }}, na.rm = TRUE), 
              SD = sd({{ col }}, na.rm = TRUE))}

# Function for skewed statistics
skewed_stat <- function(data, col) {
  data %>%
    summarise(Median = median({{ col }}, na.rm = TRUE), 
              IQR = IQR({{ col }}, na.rm = TRUE))}

train1_test1 <- function(data, outcome){
  temp <- data %>% group_by({{ outcome }}) %>% mutate(train1=runif(length({{ outcome }}))<0.5) %>% ungroup()
  test1 <<- temp %>% filter(train1==FALSE) %>% select(-train1)
  train1 <<- temp %>% filter(train1==TRUE) %>% select(-train1)
}