library(ggplot2)
library(reshape2)

xa2016 <- data.frame(StudentsGrades2016)
View(xa2016)
pass2016 <- data.frame(pass=colSums(xa2016[,-1]>4.99, na.rm = TRUE))
View(pass2016)
fail2016 <- data.frame(fail=colSums(xa2016[,-1]<5, na.rm = TRUE))
View(fail2016)
Avarage2016 <- data.frame(Avarage=colMeans(StudentsGrades2016[,-1], na.rm = TRUE))
Avarageround2016 <- round(Avarage, 2)
colos2016 <- as.character(colnames(StudentsGrades2017[,-1]))

test  <- data.frame(colos2016,
                    Avarageround2016,
                    pass2016 ,
                    fail2016)

melted <- melt(test, "colos2016")
melted$courses2016 <- ''
melted[melted$variable == 'Avarage',]$courses2016 <- "Av"
melted[melted$variable != 'Avarage',]$courses2016 <- "F/P"

ggplot(melted, aes(x = courses2016, y = value, fill = variable, label = value )) +
  #geom_col() + facet_grid(~ colos)
  geom_bar(stat =  'identity', position = 'stack') + facet_grid(~ colos2016)+
  theme_classic() +
  geom_text(size = 3, position = position_stack(vjust = 0.5))
