library(leaflet)
library(rgdal)

voivod <- readOGR(file.path("data", "Województwa.shp"))

voivod@data$custom_val <- sample(1:100, 16)

leaflet(voivod) %>%
  addPolygons(
    weight = 1,
    fill = TRUE,
    fillColor = ~colorQuantile("YlOrRd", custom_val, n = 6)(custom_val),
    highlightOptions = highlightOptions(
      bringToFront = TRUE,
      fillOpacity = 1)
  )


powiaty <- readOGR(file.path("data", "Powiaty.shp"))

leaflet(powiaty) %>%
  addTiles() %>%
  addPolylines()
