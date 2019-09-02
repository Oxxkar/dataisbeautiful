# Mexico Map 
# https://tapiquen-sig.jimdo.com/descargas-gratuitas/m%C3%A9xico/
# Libraries
# install.packages("sf")
# install.packages("ggplot2")
# install.packages("tmap")
# install.packages("tmaptools")
# install.packages("leaflet")
# install.packages("dplyr")
library(sf)
library(ggplot2)
library(tmap)
library(tmaptools)
library(leaflet)
library(dplyr)

# Data
# 

secuestros <- read.csv("personal/RNPED/RNPEDFC_1.csv",
                       header = TRUE,
                       na.strings = "NO ESPECIFICADO",
                       stringsAsFactors = FALSE)
