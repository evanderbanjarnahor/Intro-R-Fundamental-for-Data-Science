library(dplyr)

dataset <- read.csv('Dataset_superstore_simple.csv')

dataset2 <- filter(dataset, segment=='Consumer')

dataset2 <- mutate(dataset2, avg_price = sales/quantity)

dataset2 <- select(dataset2, c(order_id,order_date,sales, avg_price))

dataset3 <- dataset %>% filter(segment=='Consumer')%>% mutate(avg_price = sales/quantity)%>% select(c(order_id,order_date,sales, avg_price))
