library(shiny)
require(shinydashboard)
library(ggplot2)
library(dplyr)
lessons2 <- read.csv("lessons2.csv",stringsAsFactors = F,header=T, sep = ",")
head(lessons2)
