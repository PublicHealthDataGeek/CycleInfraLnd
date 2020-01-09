devtools::install_github("publichealthdatageek/CycleInfraLnd")

library(dplyr)
library(sf)
library(tmap) #thematic mapping package
library(mapview)
library(tidyverse)
library(CycleInfraLnd)

CID_cycle_lanes = get_cid_lines(type = "cycle_lane_track")

# create new object that selects all cycle lanes and tracks that allow contraflow cycling
contraflow_cl = CID_cycle_lanes %>%
  filter(CLT_CONTRA == TRUE)

# Looking at Sutton one way streets to check their list
sutton_contra = contraflow_cl %>%
  filter(BOROUGH == "Sutton")

mapview(sutton_contra, legend = FALSE, map.types = "OpenStreetMap", color = 'red')
sutton_OSM = mapview(sutton_contra, legend = FALSE, map.types = "OpenStreetMap", color = 'red')
mapshot(sutton_OSM)

mapview(sutton_contra)
suttonBW = mapview(sutton_contra, legend = FALSE, color = 'red')

# Adding feature id to map
mapview(sutton_contra, legend = FALSE, map.types = "OpenStreetMap", color = 'red')
l1 = addStaticLabels(sutton_OSM, label = sutton_contra$FEATURE_ID)
l1 # show L1

# Examining the Sutton data of 26 observations that only cover 11 roads
Sutton_camdenroad = sutton_contra %>%
  filter(str_detect(FEATURE_ID, "RWG12411"))
