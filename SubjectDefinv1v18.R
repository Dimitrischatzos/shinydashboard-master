FailPassHeader <- Cources_Sheet1$Cources
View(FailPassHeader)
fail
View(fail)
pass
View(pass)
fail2015
pass2015
fail2016
pass2016

tfail2017 <- transpose(fail)
tpass2017 <- transpose(pass)
tfail2016 <- transpose(fail2016)
tpass2016 <- transpose(pass2016)
tfail2015 <- transpose(fail2015)
tpass2015 <- transpose(pass2015)

View(t)

FailPass2017 <- data.frame(fail,pass)
FailPass2016 <- data.frame(fail2016,pass2016)
FailPass2015 <- data.frame(fail2015,pass2015)
AllFailPass <- data.frame(FailPass2017, FailPass2016, FailPass2015)
View(AllFailPass)

LessonsFailPass <- data.frame(fail,pass,fail2016,pass2016,fail2015,pass2015)
View(LessonsFailPass)

failpassv1 <-function(){xronos1 <- c('2015', '2016', '2017')
denperna1 <- c(tfail2017$V1, tfail2016$V1, tfail2015$V1)
perna1 <- c(tpass2017$V1, tpass2016$V1, tpass2015$V1)
dedomena1 <- data.frame(xronos1, denperna1, perna1)

p <- plot_ly(dedomena1, x = ~xronos1, y = ~denperna1, type = 'bar',
             name = 'Fail', text = denperna1, textposition = 'auto', marker = list(color = c("red"))) %>%
  add_trace(y = ~perna1, name = 'Pass', text = perna1, textposition = 'auto', marker = list(color = c("blue"))) %>%
  layout(title="Courses",
         barmode = 'stack',
         xaxis = list(title = "Years"),
         yaxis = list(title ="Students"))}

failpassv2 <-function(){xronos2 <- c('2015', '2016', '2017')
denperna2 <- c(tfail2017$V2, tfail2016$V2, tfail2015$V2)
perna2 <- c(tpass2017$V2, tpass2016$V2, tpass2015$V2)
dedomena2 <- data.frame(xronos2, perna2, denperna2)

p <- plot_ly(dedomena2, x = ~xronos2, y = ~denperna2, type = 'bar',
             name = 'Pass', text = denperna2, textposition = 'auto', marker = list(color = c("red"))) %>%
  add_trace(y = ~perna2, name = 'Fail', text = perna2, textposition = 'auto', marker = list(color = c("blue"))) %>%
  layout(title="Courses",
         barmode = 'stack',
         xaxis = list(title = "Years"),
         yaxis = list(title ="Students"))}

failpassv3 <-function(){xronos3 <- c('2015', '2016', '2017')
denperna3 <- c(tfail2017$V3, tfail2016$V3, tfail2015$V3)
perna3 <- c(tpass2017$V3, tpass2016$V3, tpass2015$V3)
dedomena3 <- data.frame(xronos3, perna3, denperna3)

p <- plot_ly(dedomena3, x = ~xronos3, y = ~denperna3, type = 'bar',
             name = 'Fail', text = denperna3, textposition = 'auto', marker = list(color = c("red"))) %>%
  add_trace(y = ~perna3, name = 'Pass', text = perna3, textposition = 'auto', marker = list(color = c("blue"))) %>%
  layout(title="Courses",
         barmode = 'stack',
         xaxis = list(title = "Years"),
         yaxis = list(title ="Students"))}

failpassv4 <-function(){xronos4 <- c('2015', '2016', '2017')
denperna4 <- c(tfail2017$V4, tfail2016$V4, tfail2015$V4)
perna4 <- c(tpass2017$V4, tpass2016$V4, tpass2015$V4)
dedomena4 <- data.frame(xronos4, perna4, denperna4)

p <- plot_ly(dedomena4, x = ~xronos4, y = ~denperna4, type = 'bar',
             name = 'Fail', text = denperna4, textposition = 'auto', marker = list(color = c("red"))) %>%
  add_trace(y = ~perna4, name = 'Fail', text = perna4, textposition = 'auto', marker = list(color = c("blue"))) %>%
  layout(title="Courses",
         barmode = 'stack',
         xaxis = list(title = "Years"),
         yaxis = list(title ="Students"))}

failpassv5 <-function(){xronos5 <- c('2015', '2016', '2017')
denperna5 <- c(tfail2017$V5, tfail2016$V5, tfail2015$V5)
perna5 <- c(tpass2017$V5, tpass2016$V5, tpass2015$V5)
dedomena5 <- data.frame(xronos5, perna5, denperna5)

p <- plot_ly(dedomena5, x = ~xronos5, y = ~denperna5, type = 'bar',
             name = 'Fail', text = denperna5, textposition = 'auto', marker = list(color = c("red"))) %>%
  add_trace(y = ~perna5, name = 'Pass', text = perna5, textposition = 'auto', marker = list(color = c("blue"))) %>%
  layout(title="Courses",
         barmode = 'stack',
         xaxis = list(title = "Years"),
         yaxis = list(title ="Students"))}

failpassv6 <-function(){xronos6 <- c('2015', '2016', '2017')
denperna6 <- c(tfail2017$V6, tfail2016$V6, tfail2015$V6)
perna6 <- c(tpass2017$V6, tpass2016$V6, tpass2015$V6)
dedomena6 <- data.frame(xronos6, perna6, denperna6)

p <- plot_ly(dedomena6, x = ~xronos6, y = ~denperna6, type = 'bar',
             name = 'Fail', text = denperna6, textposition = 'auto', marker = list(color = c("red"))) %>%
  add_trace(y = ~perna6, name = 'Pass', text = perna6, textposition = 'auto', marker = list(color = c("blue"))) %>%
  layout(title="Courses",
         barmode = 'stack',
         xaxis = list(title = "Years"),
         yaxis = list(title ="Students"))}

failpassv7 <-function(){xronos7 <- c('2015', '2016', '2017')
denperna7 <- c(tfail2017$V7, tfail2016$V7, tfail2015$V7)
perna7 <- c(tpass2017$V7, tpass2016$V7, tpass2015$V7)
dedomena7 <- data.frame(xronos7, perna7, denperna7)

p <- plot_ly(dedomena7, x = ~xronos7, y = ~denperna7, type = 'bar',
             name = 'Fail', text = denperna7, textposition = 'auto', marker = list(color = c("red"))) %>%
  add_trace(y = ~perna7, name = 'Pass', text = perna7, textposition = 'auto', marker = list(color = c("blue"))) %>%
  layout(title="Courses",
         barmode = 'stack',
         xaxis = list(title = "Years"),
         yaxis = list(title ="Students"))}

failpassv8 <-function(){xronos8 <- c('2015', '2016', '2017')
denperna8 <- c(tfail2017$V8, tfail2016$V8, tfail2015$V8)
perna8 <- c(tpass2017$V8, tpass2016$V8, tpass2015$V8)
dedomena8 <- data.frame(xronos8, perna8, denperna8)

p <- plot_ly(dedomena8, x = ~xronos8, y = ~denperna8, type = 'bar',
             name = 'Fail', text = denperna8, textposition = 'auto', marker = list(color = c("red"))) %>%
  add_trace(y = ~perna8, name = 'Pass', text = perna8, textposition = 'auto', marker = list(color = c("blue"))) %>%
  layout(title="Courses",
         barmode = 'stack',
         xaxis = list(title = "Years"),
         yaxis = list(title ="Students"))}

failpassv9 <-function(){xronos9 <- c('2015', '2016', '2017')
denperna9 <- c(tfail2017$V9, tfail2016$V9, tfail2015$V9)
perna9 <- c(tpass2017$V9, tpass2016$V9, tpass2015$V9)
dedomena9 <- data.frame(xronos9, perna9, denperna9)

p <- plot_ly(dedomena9, x = ~xronos9, y = ~denperna9, type = 'bar',
             name = 'Fail', text = denperna9, textposition = 'auto', marker = list(color = c("red"))) %>%
  add_trace(y = ~perna9, name = 'Pass', text = perna9, textposition = 'auto', marker = list(color = c("blue"))) %>%
  layout(title="Courses",
         barmode = 'stack',
         xaxis = list(title = "Years"),
         yaxis = list(title ="Students"))}

failpassv10 <-function(){xronos10 <- c('2015', '2016', '2017')
denperna10 <- c(tfail2017$V10, tfail2016$V10, tfail2015$V10)
perna10 <- c(tpass2017$V10, tpass2016$V10, tpass2015$V1)
dedomena10 <- data.frame(xronos10, perna10, denperna10)

p <- plot_ly(dedomena10, x = ~xronos10, y = ~denperna10, type = 'bar',
             name = 'Fail', text = denperna10, textposition = 'auto', marker = list(color = c("red"))) %>%
  add_trace(y = ~perna10, name = 'Pass', text = perna10, textposition = 'auto', marker = list(color = c("blue"))) %>%
  layout(title="Courses",
         barmode = 'stack',
         xaxis = list(title = "Years"),
         yaxis = list(title ="Students"))}

failpassv11 <-function(){xronos11 <- c('2015', '2016', '2017')
denperna11 <- c(tfail2017$V11, tfail2016$V11, tfail2015$V11)
perna11 <- c(tpass2017$V11, tpass2016$V11, tpass2015$V11)
dedomena11 <- data.frame(xronos11, perna11, denperna11)

p <- plot_ly(dedomena11, x = ~xronos11, y = ~denperna11, type = 'bar',
             name = 'Fail', text = denperna11, textposition = 'auto', marker = list(color = c("red"))) %>%
  add_trace(y = ~perna11, name = 'Pass', text = perna11, textposition = 'auto', marker = list(color = c("blue"))) %>%
  layout(title="Courses",
         barmode = 'stack',
         xaxis = list(title = "Years"),
         yaxis = list(title ="Students"))}

failpassv12 <-function(){xronos12 <- c('2015', '2016', '2017')
denperna12 <- c(tfail2017$V12, tfail2016$V12, tfail2015$V12)
perna12 <- c(tpass2017$V12, tpass2016$V12, tpass2015$V12)
dedomena12 <- data.frame(xronos12, perna12, denperna12)

p <- plot_ly(dedomena12, x = ~xronos12, y = ~denperna12, type = 'bar',
             name = 'Fail', text = denperna12, textposition = 'auto', marker = list(color = c("red"))) %>%
  add_trace(y = ~perna12, name = 'Pass', text = perna12, textposition = 'auto', marker = list(color = c("blue"))) %>%
  layout(title="Courses",
         barmode = 'stack',
         xaxis = list(title = "Years"),
         yaxis = list(title ="Students"))}

failpassv13 <-function(){xronos13 <- c('2015', '2016', '2017')
denperna13 <- c(tfail2017$V13, tfail2016$V13, tfail2015$V13)
perna13 <- c(tpass2017$V13, tpass2016$V13, tpass2015$V13)
dedomena13 <- data.frame(xronos13, perna13, denperna13)

p <- plot_ly(dedomena13, x = ~xronos13, y = ~denperna13, type = 'bar',
             name = 'Fail', text = denperna13, textposition = 'auto', marker = list(color = c("red"))) %>%
  add_trace(y = ~perna13, name = 'Pass', text = perna13, textposition = 'auto', marker = list(color = c("blue"))) %>%
  layout(title="Courses",
         barmode = 'stack',
         xaxis = list(title = "Years"),
         yaxis = list(title ="Students"))}

failpassv14 <-function(){xronos14 <- c('2015', '2016', '2017')
denperna14 <- c(tfail2017$V14, tfail2016$V14, tfail2015$V14)
perna14 <- c(tpass2017$V14, tpass2016$V14, tpass2015$V14)
dedomena14 <- data.frame(xronos14, perna14, denperna14)

p <- plot_ly(dedomena14, x = ~xronos14, y = ~denperna14, type = 'bar',
             name = 'Fail', text = denperna14, textposition = 'auto', marker = list(color = c("red"))) %>%
  add_trace(y = ~perna14, name = 'Pass', text = perna14, textposition = 'auto', marker = list(color = c("blue"))) %>%
  layout(title="Courses",
         barmode = 'stack',
         xaxis = list(title = "Years"),
         yaxis = list(title ="Students"))}

failpassv15 <-function(){xronos15 <- c('2015', '2016', '2017')
denperna15 <- c(tfail2017$V15, tfail2016$V15, tfail2015$V15)
perna15 <- c(tpass2017$V15, tpass2016$V15, tpass2015$V15)
dedomena15 <- data.frame(xronos15, perna15, denperna15)

p <- plot_ly(dedomena15, x = ~xronos15, y = ~denperna15, type = 'bar',
             name = 'Fail', text = denperna15, textposition = 'auto', marker = list(color = c("red"))) %>%
  add_trace(y = ~perna15, name = 'Pass', text = perna15, textposition = 'auto', marker = list(color = c("blue"))) %>%
  layout(title="Courses",
         barmode = 'stack',
         xaxis = list(title = "Years"),
         yaxis = list(title ="Students"))}

failpassv16 <-function(){xronos16 <- c('2015', '2016', '2017')
denperna16 <- c(tfail2017$V16, tfail2016$V16, tfail2015$V16)
perna16 <- c(tpass2017$V16, tpass2016$V16, tpass2015$V16)
dedomena16 <- data.frame(xronos16, perna16, denperna16)

p <- plot_ly(dedomena16, x = ~xronos16, y = ~denperna16, type = 'bar',
             name = 'Fail', text = denperna16, textposition = 'auto', marker = list(color = c("red"))) %>%
  add_trace(y = ~perna16, name = 'Pass', text = perna16, textposition = 'auto', marker = list(color = c("blue"))) %>%
  layout(title="Courses",
         barmode = 'stack',
         xaxis = list(title = "Years"),
         yaxis = list(title ="Students"))}

failpassv17 <-function(){xronos17 <- c('2015', '2016', '2017')
denperna17 <- c(tfail2017$V17, tfail2016$V17, tfail2015$V17)
perna17 <- c(tpass2017$V17, tpass2016$V17, tpass2015$V17)
dedomena17 <- data.frame(xronos17, perna17, denperna17)

p <- plot_ly(dedomena17, x = ~xronos17, y = ~denperna17, type = 'bar',
             name = 'Fail', text = denperna17, textposition = 'auto', marker = list(color = c("red"))) %>%
  add_trace(y = ~perna17, name = 'Pass', text = perna17, textposition = 'auto', marker = list(color = c("blue"))) %>%
  layout(title="Courses",
         barmode = 'stack',
         xaxis = list(title = "Years"),
         yaxis = list(title ="Students"))}

failpassv18 <-function(){xronos18 <- c('2015', '2016', '2017')
denperna18 <- c(tfail2017$V18, tfail2016$V18, tfail2015$V18)
perna18 <- c(tpass2017$V18, tpass2016$V18, tpass2015$V18)
dedomena18 <- data.frame(xronos18, perna18, denperna18)

p <- plot_ly(dedomena18, x = ~xronos18, y = ~denperna18, type = 'bar',
             name = 'Fail', text = denperna18, textposition = 'auto', marker = list(color = c("red"))) %>%
  add_trace(y = ~perna18, name = 'Pass', text = perna18, textposition = 'auto', marker = list(color = c("blue"))) %>%
  layout(title="Courses",
         barmode = 'stack',
         xaxis = list(title = "Years"),
         yaxis = list(title ="Students"))}

