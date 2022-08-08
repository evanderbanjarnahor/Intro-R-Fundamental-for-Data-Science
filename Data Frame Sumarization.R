library(dplyr)

dataset <- read.csv('Dataset_superstore_simple.csv')

dataa <- dataset %>% filter(segment == 'Corporate')%>% 
  select(c(order_id,order_date, segment, category, sub_category,sales)) %>%
  head(10)

datab <- dataset %>% filter(category == 'Technology')%>% 
  select(c(order_id,order_date, segment, category, sub_category,sales)) %>%
  head(9)

datac <- select(dataa, c(order_id, sub_category, segment, sales))%>% head(9)

datad <- select(datab, c(order_id, sub_category, category, order_date))

bind_cols(datac, datad)

