library(tidyverse)
library(sf)
library(leaflet)
library(here)
library(readxl)

cities <- read_excel(here("data", "worldcities.xlsx"))


cities_sf <- cities |>
  st_as_sf(coords = c("lng", "lat"), crs = 4326)
cities_sf |>
  leaflet() |>
  addProviderTiles(providers$Esri.WorldImagery, group = "World Imagery") |>
  addProviderTiles(providers$Stamen.TonerLite, group = "Toner Lite") |>
  addLayersControl(baseGroups = c("World Imagery", "Toner Lite")) |>
  addMarkers(label = cities$city)