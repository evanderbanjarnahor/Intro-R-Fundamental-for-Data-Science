library(dplyr)
library(ggplot2)

dataset <- read.csv('R script report//Dataset_superstore_simple.csv')

ggplot(dataset, aes(x=sales, y = profit)) + geom_point(colour = "yellow")

ggplot(dataset, aes(x= sales)) + geom_histogram(binwidth = 500)

ggplot(dataset, aes( x= segment, y = sales)) + geom_bar(stat = 'identity',width = 0.5, fill = 'blue')

ggplot(dataset, aes( x= segment, y = sales)) + geom_bar(stat = 'identity',width = 0.5, aes(fill =category))

sales_per_segment <- dataset %>% group_by(segment)%>%
  summarize(total_sales = sum(sales))
ggplot(sales_per_segment, aes( x = '', y = total_sales, fill=segment)) + geom_bar(stat='identity', width = 1) + coord_polar('y', start = 0)

dataset$order_date <- as.Date(dataset$order_date)
dataset$order_mounth <- as.Date(cut(dataset$order_date, breaks ='month'))

ggplot(dataset, aes(x = order_mounth, y = sales)) + stat_summary(fun.y = sum, geom ='line')

monthly_sales <- dataset %>% group_by(order_mounth)%>% summarise(sales = sum(sales))

ggplot(monthly_sales, aes(x=order_mounth, y=sales)) + geom_line() + geom_point(colour = 'blue')
