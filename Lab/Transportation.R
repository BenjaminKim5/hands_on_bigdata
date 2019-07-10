install.packages(c("sf", "spDataLarge", "stplanr", "tmap"))
# install.packages("spDataLarge", repos = "https://nowosad.github.io/drat/", type = "source")

library(sf)
library(dplyr)
library(spDataLarge)
library(stplanr)      # geographic transport data package
library(tmap)         # visualization package (see Chapter 8)

## Transport zones
## --------------------------------------------------
names(bristol_zones)
#> [1] "geo_code" "name"     "geometry"

nrow(bristol_od)
#> [1] 2910
nrow(bristol_zones)
#> [1] 102

zones_attr = bristol_od %>% 
  group_by(o) %>% 
  summarize_if(is.numeric, sum) %>% 
  dplyr::rename(geo_code = o)

summary(zones_attr$geo_code %in% bristol_zones$geo_code)
#>    Mode    TRUE 
#> logical     102

zones_joined = left_join(bristol_zones, zones_attr, by = "geo_code")
sum(zones_joined$all)
#> [1] 238805
names(zones_joined)
#> [1] "geo_code"   "name"       "all"        "bicycle"    "foot"      
#> [6] "car_driver" "train"      "geometry"


zones_od = bristol_od %>% 
  group_by(d) %>% 
  summarize_if(is.numeric, sum) %>% 
  dplyr::select(geo_code = d, all_dest = all) %>% 
  inner_join(zones_joined, ., by = "geo_code")

qtm(zones_od, c("all", "all_dest")) +
  tm_layout(panel.labels = c("Origin", "Destination"))

## Desire lines
## --------------------------------------------------
od_top5 = bristol_od %>% 
  arrange(desc(all)) %>% 
  top_n(5, wt = all)

od_top5

bristol_od$Active = (bristol_od$bicycle + bristol_od$foot) /
  bristol_od$all * 100

od_intra = filter(bristol_od, o == d)
od_inter = filter(bristol_od, o != d)

desire_lines = od2line(od_inter, zones_od)
# Creating centroids representing desire line start and end points.

qtm(desire_lines, lines.lwd = "all")


## Routes
## --------------------------------------------------
desire_lines$distance = as.numeric(st_length(desire_lines))
desire_carshort = dplyr::filter(desire_lines, car_driver > 300 & distance < 5000)

desire_carshort$geom_car = st_geometry(route_carshort)

desire_rail = top_n(desire_lines, n = 3, wt = train)

ncol(desire_rail)
#> [1] 10
desire_rail = line_via(desire_rail, bristol_stations)
ncol(desire_rail)
#> [1] 13

summary(bristol_ways)

ways_freeway = bristol_ways %>% 
  filter(maxspeed == "70 mph") 
ways_sln = SpatialLinesNetwork(ways_freeway)
slotNames(ways_sln)
#> [1] "sl"          "g"           "nb"          "weightfield"
weightfield(ways_sln)
#> [1] "length"
class(ways_sln@g)
#> [1] "igraph"

e = igraph::edge_betweenness(ways_sln@g)
plot(ways_sln@sl$geometry, lwd = e / 500)



