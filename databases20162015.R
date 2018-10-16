library(ggplot2)
library(reshape2)


database2017 <- function(){
  xa2017 <- data.frame(StudentsGrades2017)
  pass2017 <- data.frame(Pass=colSums(xa2017[,-1]>4.99, na.rm = TRUE))
  fail2017 <- data.frame(Fail=colSums(xa2017[,-1]<5, na.rm = TRUE))
  Avarage2017 <- data.frame(Avarage=colMeans(StudentsGrades2017[,-1], na.rm = TRUE))
  Avarageround2017 <- round(Avarage, 2)
  colos2017 <- as.character(colnames(StudentsGrades2017[,-1]))

  test  <- data.frame(colos2017,
                      Avarageround2017,
                      pass2017 ,
                      fail2017)

  melted <- melt(test, "colos2017")
  melted$courses2017 <- ''
  melted[melted$variable == 'Avarage',]$courses2017 <- "Av"
  melted[melted$variable != 'Avarage',]$courses2017 <- "F/P"

  ggplot(melted, aes(x = courses2017, y = value, fill = variable, label = value )) +
    #geom_col() + facet_grid(~ colos)
    geom_bar(stat =  'identity', position = 'stack') + facet_grid(~ colos2017)+
    theme_classic() +
    geom_text(size = 3, position = position_stack(vjust = 0.5))
}

database2016 <- function(){
    xa2016 <- data.frame(StudentsGrades2016)
    pass2016 <- data.frame(Pass=colSums(xa2016[,-1]>4.99, na.rm = TRUE))
    fail2016 <- data.frame(Fail=colSums(xa2016[,-1]<5, na.rm = TRUE))
    Avarage2016 <- data.frame(Avarage=colMeans(StudentsGrades2016[,-1], na.rm = TRUE))
    Avarageround2016 <- round(Avarage, 2)
    colos2016 <- as.character(colnames(StudentsGrades2016[,-1]))

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
}


database2015 <- function(){
    xa2015 <- data.frame(StudentsGrades2015)
    pass2015 <- data.frame(Pass=colSums(xa2015[,-1]>4.99, na.rm = TRUE))
    fail2015 <- data.frame(Fail=colSums(xa2015[,-1]<5, na.rm = TRUE))
    Avarage2015 <- data.frame(Avarage=colMeans(StudentsGrades2015[,-1], na.rm = TRUE))
    Avarageround2015 <- round(Avarage, 2)
    colos2015 <- as.character(colnames(StudentsGrades2015[,-1]))

    test  <- data.frame(colos2015,
                        Avarageround2015,
                        pass2015 ,
                        fail2015)

    melted <- melt(test, "colos2015")
    melted$courses2015 <- ''
    melted[melted$variable == 'Avarage',]$courses2015 <- "Av"
    melted[melted$variable != 'Avarage',]$courses2015 <- "F/P"

    ggplot(melted, aes(x = courses2015, y = value, fill = variable, label = value )) +
      #geom_col() + facet_grid(~ colos)
      geom_bar(stat =  'identity', position = 'stack') + facet_grid(~ colos2015)+
      theme_classic() +
      geom_text(size = 3, position = position_stack(vjust = 0.5))

}
