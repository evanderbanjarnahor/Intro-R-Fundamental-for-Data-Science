library(dplyr)
library(ggplot2)

dataset <- read.csv('Coba_Report.csv')

select(dataset, category, subject, lecturer)

dataset_result <- select(dataset, -c(category,section))

#Data Frame sumarization
select(dataset_result, c(subject, lecturer,post.reply)) 

data_Loebis <- dataset %>% filter(lecturer == 'M.E. Loebis')

data_Loebis_filter <- dataset %>% filter(lecturer == 'M.E. Loebis')%>% 
  select(c(category,subject, lecturer,section, post.reply, 
           number.of.assignment, number.of.quiz))
  
data_Loebis_filter1 <- dataset %>% filter(lecturer == 'M.E. Loebis',subject=='TOEFL IBT PREP. INTERMEDIATE A 1203' )%>% 
  select(c(category,subject, lecturer,section, post.reply, 
           number.of.assignment, number.of.quiz))

data_Silitonga <- dataset %>% filter(lecturer == 'Roedy Silitonga')

data_Silitinga_filter <- dataset %>% filter(lecturer == 'Roedy Silitonga')%>% 
  select(c(category,subject, lecturer,section, post.reply, 
           number.of.assignment, number.of.quiz))

data_Silitonga_filter1 <- dataset %>% filter(lecturer == 'Roedy Silitonga',subject=='ACADEMIC SKILL A 1149')%>% 
  select(c(category,subject, lecturer,section, post.reply, 
           number.of.assignment, number.of.quiz))



#Building simple Chart

ggplot(data_Silitonga, aes(x=subject, y = number.of.quiz)) + geom_point(colour = "yellow")

ggplot(data_Silitonga, aes(x=post.reply)) + geom_histogram(binwidth = 500)

ggplot(data_Silitonga, aes( x= subject, y = number.of.quiz)) + geom_bar(stat = 'identity',width = 0.5, fill = 'blue')

ggplot(data_Silitonga, aes( x= subject, y = number.of.quiz)) + geom_bar(stat = 'identity',width = 0.5, aes(fill =category))

post_per_subject <- data_Silitonga %>% group_by(subject)%>%
  summarize(total_post = sum(post.reply))

ggplot(post_per_subject, aes( x = '', y = total_post, fill=subject)) + geom_bar(stat='identity', width = 1) + coord_polar('y', start = 0)

#dataset$order_date <- as.Date(dataset$order_date)
#dataset$order_mounth <- as.Date(cut(dataset$order_date, breaks ='month'))

ggplot(data_Silitonga, aes(x =subject, y = total.assignment.quiz..including.uts.)) + stat_summary(fun.y = sum, geom ='line')

monthly_post <- data_Silitonga %>% group_by(subject)%>% summarise(post.reply = sum(post.reply))

ggplot(monthly_post, aes(x=subject, y=reply.post)) + geom_line() + geom_point(colour = 'blue')

#Building Advance Chart

plot1 <- ggplot( data_Silitonga, aes(x=post.reply,y=total.assignment.quiz..including.uts.)) +
  geom_point(aes(colour = subject), size = 1.5, shape = 16) +
  geom_smooth(method = 'lm', colour = '#b02aab', linetype = 'dashed', size = 1)+
  labs(title = 'Scatterplot Post.Reply VS Total.Assignment',
       subtitle = 'Based on Dataset Roedy Silitonga',
       caption = 'R Language')+
  xlim(c(0,7.5)) + ylim(c(-2.5,2.5))+
  theme(
    plot.title = element_text(colour = 'blue', size = 16, face ='bold'),
    plot.subtitle = element_text(colour = 'black', size = 12, face ='italic'),
  )
plot1  

plot2 <- plot1 + 
  theme(
    legend.position = c(0.8, 0.2),
    legend.title = element_text(colour = 'blue', size = 12, face ='bold'),
    legend.text = element_text(colour = 'black'))

plot2 

ggsave('plot1.png')
ggsave('plot2.png')

