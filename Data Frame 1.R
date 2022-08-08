library(dplyr)

dataset <- read.csv('Dataset_superstore_simple.csv')


select(dataset, order_id)

dataset_result <- select(dataset, -c(profit,sub_category))

select(dataset_result, c(order_id, sales, customer_id))                         
