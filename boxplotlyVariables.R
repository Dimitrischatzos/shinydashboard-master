library(plotly)

pbox1 <- function(){ plot_ly(type = 'box') %>%
add_boxplot(y = StudentsGrades2017$Optim, name = "Optim 2017", boxpoints = FALSE,
            marker = list(color = 'rgb(9,56,125)'), boxmean =TRUE,
            line = list(color = 'rgb(9,56,125)')) %>%
  add_boxplot(y = StudentsGrades2016$Optim, name = "Optim 2016", boxpoints = FALSE,
              marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
              line = list(color = 'rgb(9,56,125)')) %>%
  add_boxplot(y = StudentsGrades2015$Optim, name = "Optim 2015", boxpoints = FALSE,
              marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
              line = list(color = 'rgb(9,56,125)')) 
}
pbox2 <- function(){ plot_ly(type = 'box') %>%
    add_boxplot(y = StudentsGrades2017$Neteg, name = "Neteg 2017", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2016$Neteg, name = "Neteg 2016", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2015$Neteg, name = "Neteg 2015", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) 
}
pbox3 <- function(){ plot_ly(type = 'box') %>%
    add_boxplot(y = StudentsGrades2017$Wicom, name = "Wicom 2017", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2016$Wicom, name = "Wicom 2016", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2015$Wicom, name = "Wicom 2015", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) 
}
pbox4 <- function(){ plot_ly(type = 'box') %>%
    add_boxplot(y = StudentsGrades2017$Sensors, name = "Sensors 2017", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2016$Sensors, name = "Sensors 2016", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2015$Sensors, name = "Sensors 2015", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) 
}
pbox5 <- function(){ plot_ly(type = 'box') %>%
    add_boxplot(y = StudentsGrades2017$Entrep, name = "Entrep 2017", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2016$Entrep, name = "Entrep 2016", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2015$Entrep, name = "Entrep 2015", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) 
}
pbox6 <- function(){ plot_ly(type = 'box') %>%
    add_boxplot(y = StudentsGrades2017$`Iot-IP`, name = "Iot-IP 2017", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2016$`Iot-IP`, name = "Iot-IP 2016", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2015$`Iot-IP`, name = "Iot-IP 2015", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) 
}
pbox7 <- function(){ plot_ly(type = 'box') %>%
    add_boxplot(y = StudentsGrades2017$`5gplan`, name = "5gplan 2017", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2016$`5gplan`, name = "5gplan 2016", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2015$`5gplan`, name = "5gplan 2015", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) 
}
pbox8 <- function(){ plot_ly(type = 'box') %>%
    add_boxplot(y = StudentsGrades2017$Image, name = "Image 2017", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2016$Image, name = "Image 2016", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2015$Image, name = "Image 2015", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) 
}
pbox9 <- function(){ plot_ly(type = 'box') %>%
    add_boxplot(y = StudentsGrades2017$Optical, name = "Optical 2017", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2016$Optical, name = "Optical 2016", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2015$Optical, name = "Optical 2015", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) 
}
pbox10 <- function(){ plot_ly(type = 'box') %>%
    add_boxplot(y = StudentsGrades2017$Arasm, name = "Arasm 2017", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2016$Arasm, name = "Arasm 2016", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2015$Arasm, name = "Arasm 2015", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) 
}
pbox11 <- function(){ plot_ly(type = 'box') %>%
    add_boxplot(y = StudentsGrades2017$Bodysens, name = "Bodysens 2017", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2016$Bodysens, name = "Bodysens 2016", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2015$Bodysens, name = "Bodysens 2015", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) 
}
pbox12 <- function(){ plot_ly(type = 'box') %>%
    add_boxplot(y = StudentsGrades2017$Netauth, name = "Netauth 2017", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2016$Netauth, name = "Netauth 2016", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2015$Netauth, name = "Netauth 2015", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) 
}
pbox13 <- function(){ plot_ly(type = 'box') %>%
    add_boxplot(y = StudentsGrades2017$BigaData, name = "BigaData 2017", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2016$BigaData, name = "BigaData 2016", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2015$BigaData, name = "BigaData 2015", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) 
}
pbox14 <- function(){ plot_ly(type = 'box') %>%
    add_boxplot(y = StudentsGrades2017$SDR, name = "SDR 2017", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2016$SDR, name = "SDR 2016", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2015$SDR, name = "SDR 2015", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) 
}
pbox15 <- function(){ plot_ly(type = 'box') %>%
    add_boxplot(y = StudentsGrades2017$LowPow, name = "LowPow 2017", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2016$LowPow, name = "LowPow 2016", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2015$LowPow, name = "LowPow 2015", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) 
}
pbox16 <- function(){ plot_ly(type = 'box') %>%
    add_boxplot(y = StudentsGrades2017$Business, name = "Business 2017", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2016$Business, name = "Business 2016", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2015$Business, name = "Business 2015", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) 
}
pbox17 <- function(){ plot_ly(type = 'box') %>%
    add_boxplot(y = StudentsGrades2017$Service, name = "Service 2017", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2016$Service, name = "Service 2016", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2015$Service, name = "Service 2015", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) 
}
pbox18 <- function(){ plot_ly(type = 'box') %>%
    add_boxplot(y = StudentsGrades2017$CREA, name = "CREA 2017", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2016$CREA, name = "CREA 2016", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) %>%
    add_boxplot(y = StudentsGrades2015$CREA, name = "CREA 2015", boxpoints = FALSE,
                marker = list(color = 'rgb(9,56,125)'),boxmean =TRUE,
                line = list(color = 'rgb(9,56,125)')) 
}


