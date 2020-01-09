devtools::install_github("publichealthdatageek/CycleInfraLnd")

library(dplyr)
library(sf)
library(tmap) #thematic mapping package
library(mapview)
library(tidyverse)
library(CycleInfraLnd)

CID_cycle_lanes = get_cid_lines(type = "cycle_lane_track")
summary(CID_cycle_lanes$SVDATE)
summary(CID_cycle_lanes$PHOTO1_URL)

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

mapview(Sutton_camdenroad)
photo_camden_road = Sutton_camdenroad$PHOTO1_URL
browseURL(Sutton_camdenroad$PHOTO1_URL[1])

# get stats19 data nearby -------------------------------------------------

sf::st_crs(Sutton_camdenroad)
buffer_size = 30
Sutton_camdenroad_buffer = stplanr::geo_projected(Sutton_camdenroad, st_buffer, dist = buffer_size)
mapview(Sutton_camdenroad_buffer)
buffer_union = st_union(Sutton_camdenroad_buffer)
mapview(buffer_union)

y = 2013:2018
a = purrr::map_dfr(y, stats19::get_stats19, type = "accidents")
casualties = purrr::map_dfr(y, stats19::get_stats19, type = "cas")
cas_cycling = casualties %>% filter(casualty_type == "Cyclist")
a_cyclist = a %>% filter(accident_index %in% cas_cycling$accident_index)
a = left_join(a_cyclist, cas_cycling)
a_sf = stats19::format_sf(a, lonlat = TRUE)
a_buffer = a_sf[buffer_union, ]
mapview(a_buffer) + mapview(buffer_union)

Sutton_buffer = stplanr::geo_projected(sutton_contra, st_buffer, dist = buffer_size)
buffer_union = st_union(Sutton_buffer)
a_buffer = a_sf[buffer_union, ]
mapview(a_buffer) + mapview(buffer_union)


# join on cid data to crashes ---------------------------------------------

a_buffer

nearest_features = st_nearest_feature(x = a_buffer, y = sutton_contra)
a_buffer$segregated = sutton_contra$CLT_SEGREG[nearest_features]

tmap_mode("view")
tm_shape(a_buffer) + tm_dots("segregated")
mapview(sutton_contra[23, ])
browseURL(sutton_contra$PHOTO1_URL[23])

