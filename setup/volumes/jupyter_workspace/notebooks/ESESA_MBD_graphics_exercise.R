### MBD - Graphics BD exercise ###

# Master Big Data
## Graphic database exercise 28/03/2023
#- Bueká Torao

sessionInfo()


## Installing libraries:
install.packages('RMySQL')
#install.packages("LDAvis")
#install.packages("pdftools")
#install.packages("tm")
#install.packages("SnowballC")
#install.packages("evaluate")
#update.packages("tm",  checkBuilt = TRUE)
# A. Carga de librerias ---------------------------------------------------

#packages = c("stringr", "ggrepel","ggplot2","qdapRegex",
#             "lda","LDAvis","wordcloud", "tidyverse","tidytext","rtweet",
#             "scales","leaflet","tm","widyr","igraph", "ggraph", "imager")  
#new <- packages[!(packages %in% installed.packages()[,"Package"])]
#if(length(new)) install.packages(new)
#a=lapply(packages, require, character.only=TRUE)

{
  library(stringr)  # acciones sobre cadenas de texto
  library(ggrepel)  # repele entre labels
  library(ggplot2)  # graficos
  library(qdapRegex)  # borrar/sustituir/extraer URL Twitter corta de una cadena
  library(lda)      # LDA para LDAvis:   utiliza pej:  lda.collapsed.gibbs.sampler
  library(LDAvis) # visualizacion LDA
  library(wordcloud) # nubes de palabras
  library(tidyverse) # carga tibble, tidyr, readr, purrr, dplyr, forcats
  library(tidytext)  # ambito texto
  library(rtweet)    # request API twitter
  library(scales)    # formatos numericos
  library(leaflet)   # mapas
  library(tm)  # función stripWhitespace en pln y stopwords
  library(widyr) # pairwise_count y pairwise_corr
  library(igraph) # grafos
  library(ggraph) # grafos
  library(imager) # cargas de imagenes
  library(pdftools) # lectura de pdf
  library(DBI)  # acceso a BD
  library(RMySQL) # acceso a BD Mysql
}
rm(a,new,packages)



# limpiamos el workspace
#rm(list = ls())
#cat("\014")

# Conectamos con BD:
mydb = dbConnect(MySQL(), user='finance', password='finance', dbname='finance_db', host='104.248.163.36')



### LECTURA DATOS ###
# Tabla Despidos LAY_OFF

## Carga de datos
dataset_layoff_data = dbReadTable(mydb,"LAYOFF_DATA")


# ANALISIS EXPLORATORIO
df = dataset_layoff_data

## LAYOFF_DATA- dataset_layoff_data
str(df)
head(df)
summary(df)