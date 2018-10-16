xa <- data.frame(StudentsGrades2017)
View(xa)
pass <- data.frame(pass=colSums(xa[,-1]>4.99, na.rm = TRUE))
View(pass)
fail<- data.frame(fail=colSums(xa[,-1]<5, na.rm = TRUE))
View(fail)
lessons2017 <- data.table(merge.data.frame(pass,fail))
View(lessons2017)



library(reshape2)
llll <- dcast(melt(as.matrix(pass)), Var2~paste0('r', Var1), value.var='value')
View(llll)

kkkk <- dcast(melt(as.matrix(fail)), Var2~paste0('r', Var1), value.var='value')
View(kkkk)

colos <- as.character(colnames(StudentsGrades2017[,-1]))
View(colos)

p <- plot_ly(data.13, x = ~Less2017, y = ~value, type = 'bar',
             name = ~variable, color = ~variable) %>%
  layout(yaxis = list(title = 'Lessons'), barmode = 'stack')

df <- data.frame(A = sample(), 
                 B = sample(c('Y', 'N'), 30, T), 
                 C = rep(LETTERS[1:3], 10))

ggplot(df) + geom_bar(aes(B, fill = C), position  = 'stack', width = 0.9) + 
  facet_wrap(~A, nrow = 1) + theme(panel.spacing = unit(0, "lines"))


Avarage <- data.frame(Avarage=colMeans(StudentsGrades2017[,-1], na.rm = TRUE))
Avarageround <- round(Avarage, 2)
View(Avarageround)

