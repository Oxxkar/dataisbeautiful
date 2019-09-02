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

# Mapa Mexico
mex <- st_read("personal/RNPED/mexMap/México_Estados.shp", stringsAsFactors = FALSE)
# plot(mex$geometry)
mex$ESTADO <- tolower(mex$ESTADO) 
mex$ESTADO

#
mex <-   mex %>% arrange(data = mex$ESTADO)

# Deleting cols not important for now
# secuestros$Pais.en.que.se.le.vio.por.ultima.vez <- NULL
# secuestros[c(2,7,8,14)] <- NULL
# secuestros$Descripcion.de.senas.particulares <- NULL
# secuestros$Etnia <- NULL

# Renaming
names(secuestros) [1] <- "Fecha.Desaparicion"
names(secuestros) [2] <- "Entidad"
names(secuestros) [3] <- "Municipio"
names(secuestros) [4] <- "Localidad"



# rm NA in dates 
secuestros <- secuestros[!is.na(secuestros$Fecha.Desaparicion),]




tm_shape(mex) + 
  tm_fill(col= "secuestros") +
  tm_borders("black", lwd = .5) +
  tm_layout("Secuestros en Mexico 2000-2019", inner.margins=c(0,0,.1,0), title.size=.8)

