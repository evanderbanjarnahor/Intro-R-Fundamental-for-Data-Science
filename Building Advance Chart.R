library(dplyr)
library(ggplot2)

dataset <- read.csv("Dataset_superstore_simple.csv")

plot1 <- ggplot( dataset, aes(x=sales,y=profit)) +
  geom_point(aes(colour = category), size = 1.5, shape = 16) +
  geom_smooth(method = 'lm', colour = '#b02aab', linetype = 'dashed', size = 1)+
  labs(title = 'Scatterplot Sales VS Profit',
       subtitle = 'Based on Dataset Super Store',
       caption = 'R Language')+
 xlim(c(0,7500)) + ylim(c(-2500,2500))+
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
  
