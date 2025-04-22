#Make sure that ggplot2 and ggmap packages are installed before calling their libraries.

library(ggplot2)
library(ggmap)

#Add a random value to simulate a choropleth map coloring
tanzania_coordinates$rand_score <- runif(nrow(tanzania_coordinates), min = 1, max = 100)  

#Get the bounding box of the coordinates
bbox <- make_bbox(lon = tanzania_coordinates$Longitude, 
                  lat = tanzania_coordinates$Latitude, 
                  f = 0.1)

#Use Stamen map (free tile source)
tanzania_map <- get_stadiamap(bbox = bbox, zoom = 6, maptype = "stamen_terrain")

#Plot the map
ggmap(tanzania_map) +
  geom_point(data = tanzania_coordinates, 
             aes(x = Longitude, 
                 y = Latitude, 
                 color = rand_score), 
             size = 2) + 
  scale_color_viridis_c(option = "plasma") +
  theme_classic() +
  labs(title = "Choropleth Map of Test Points in Tanzania",
       color = "Test Score (Random Value)")