# This tutorial is part of Computerworld's How to Make a Map with R in 10 (fairly) Easy Steps
# by Sharon Machlis


#
#R에서 단계 구분도 만들기
#• 1단계: 선거 결과 데이터 가져오기
#• 2단계: 지도로 제작할 데이터 결정
#• 3단계: 지리 데이터 가져오기
#• 4단계: 공간 데이터와 결과 데이터 병합
#• 5단계: 정적 지도 만들기
#• 6단계: 인터랙티브 지도를 위한 팔레트 및 팝업 만들기
#• 7단계: 인터랙티브 지도 생성
#• 8단계: 다중 레이어 지도를 위한 팔레트 추가
#• 9단계: 지도 레이어와 컨트롤 추가
#• 10단계: 인터랙티브 지도 저장
#• 마커를 사용해 Leaflet 지도 만들기

# Sys.setlocale("LC_ALL", "korean")
## 기본환경 설정
getwd()
setwd("C:/500_Lab/Lab190522/Lab")
getwd()

# Set various values needed, including names of files and FIPS codes for New Hampshire and South Carolina
nhdatafile <- "data/NHD2016.xlsx"
nhdatafilecsv <- "data/NHD2016.csv"
usshapefile <- "data/cb_2014_us_county_5m/cb_2014_us_county_5m.shp"
nhfipscode <- "33"
scdatafile <- "data/SCGOP2016.csv"
scfipscode <- "45"


# Run any of the install.packages() commands below for packages that are not yet on your system
 install.packages("shiny") 
 install.packages("urltools")
 install.packages("tmap")
 install.packages("leaflet")
 install.packages("rio")
 install.packages("scales")
 install.packages("htmlwidgets")

 install.packages("tmaptools")
 installed.packages()
 
# Load the tmap and leaflet packages into your working session: 
library("tmap")
library("tmaptools")
library("sf")
library("leaflet")
 
# Read in the NH election results file:
nhdata <- rio::import(nhdatafile)

# Eliminate columns for minor candidates and just use County, Clinton and Sanders columns:
nhdata <- nhdata[,c("County", "Clinton", "Sanders")]

# Add columns for percents and margins:
nhdata$SandersMarginVotes <- nhdata$Sanders - nhdata$Clinton
nhdata$SandersPct <- (nhdata$Sanders) / (nhdata$Sanders + nhdata$Clinton) # Will use formatting later to multiply by a hundred
nhdata$ClintonPct <- (nhdata$Clinton) / (nhdata$Sanders + nhdata$Clinton)
nhdata$SandersMarginPctgPoints <- nhdata$SandersPct - nhdata$ClintonPct


library("tmaptools")

# Read in the shapefile for US states and counties:
usgeo <- read_shape(file=usshapefile)
#usgeo <- read_shape(file=usshapefile, as.sf=TRUE)

# Error in ogrInfo(dsn = dsn, layer = layer, encoding = encoding, use_iconv = use_iconv,  : 
#                    Cannot open layer
# 참고: https://stackoverflow.com/questions/42191871/in-the-tmaptools-package-read-shape-yields-layer-not-found-error
# install.packages("raster")
# library(raster)
# usgeo <- shapefile("data/cb_2014_us_county_5m/cb_2014_us_county_5m.shx")

# Do a quick plot of the shapefile and check its structure:
qtm(usgeo)
# (pause to wait for map to render, may take a few seconds)

str(usgeo)
str(usgeo@data)

#DT::datatable(usgeo)

# Subset just the NH data from the US shapefile
nhgeo <- usgeo[usgeo@data$STATEFP==nhfipscode,]

# tmap test plot of the New Hampshire data
qtm(nhgeo)

# structure of the data slot within nhgeo
str(nhgeo@data)

# Check if county names are in the same format in both files
str(nhgeo@data$NAME)
str(nhdata$County)

# They're not. Change the county names to plain characters in nhgeo:
nhgeo@data$NAME <- as.character(nhgeo@data$NAME)

# Order each data set by county name
nhgeo <- nhgeo[order(nhgeo@data$NAME),]
nhdata <- nhdata[order(nhdata$County),]

# Are the two county columns identical now? They should be:
identical(nhgeo@data$NAME,nhdata$County )

# Merge data with tmap's append_data function
nhmap <- append_data(nhgeo, nhdata, key.shp = "NAME", key.data="County")

# See the new data structure with
str(nhmap@data)

# Quick and easy maps as static images with tmap's qtm() function:
qtm(nhmap, "SandersMarginVotes")
qtm(nhmap, "SandersMarginPctgPoints")



# For more control over look and feel, use the tm_shape() function:
tm_shape(nhmap) +
  tm_fill("SandersMarginVotes", title="Sanders Margin, Total Votes", palette = "PRGn") +
  tm_borders(alpha=.5) +
  tm_text("NAME", size=0.8) + 
  tm_style_classic()


# Same code as above, but store the map in a variable:
nhstaticmap <- tm_shape(nhmap) +
  tm_fill("SandersMarginVotes", title="Sanders Margin, Total Votes", palette = "PRGn") +
  tm_borders(alpha=.5) +
  tm_text("NAME", size=0.8) + 
  tm_style_classic()

# View the map
nhstaticmap

# save the map to a jpg file with tmap's save_tmap():
save_tmap(nhstaticmap, filename="nhdemprimary.jpg")

# Next up: Code for a basic interactive map, this time for Clinton percentages in NH

# Create a palette
clintonPalette <- colorNumeric(palette = "Blues", domain=nhmap$ClintonPct)

# and a pop-up window
library(scales)
nhpopup <- paste0("<b>County: ", nhmap@data$County, "</b><br />Sanders ", percent(nhmap@data$SandersPct), " - Clinton ", percent(nhmap@data$ClintonPct))

# Now the interactive map:
leaflet(nhmap) %>%
  addProviderTiles("CartoDB.Positron") %>%
  addPolygons(stroke=FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = .8, 
              popup=nhpopup, 
              color= ~clintonPalette(nhmap@data$ClintonPct)
              )
  

# South Carolina data
scdata <- rio::import(scdatafile)

# South Carolina shapefile:
scgeo <- usgeo[usgeo@data$STATEFP==scfipscode,]

# Quick plot of scgeo SC geospatial object:
qtm(scgeo)

# Add a column with percent of votes for each candidate. Candidates are in columns 2-7:
candidates <- colnames(scdata[2:7])
for(i in 2:7){
  j = i + 7
  temp <- scdata[[i]] / scdata$Total
  scdata[[j]] <- temp
  colnames(scdata)[j] <- paste0(colnames(scdata)[i], "Pct")
}  
  
# Get winner in each precinct
for(i in 1:nrow(scdata)){
  scdata$winner[i] <- names(which.max(scdata[i,2:7]))
}

# Import spreadsheet with percent of adult population holding at least a 4-yr college degree
sced <- rio::import("data/SCdegree.xlsx")


# Check if county names are in the same format in both files
str(scgeo@data$NAME)
str(scdata$County)

# Change the county names to plain characters in scgeo:
scgeo@data$NAME <- as.character(scgeo@data$NAME)

# Order each data set by county name
scgeo <- scgeo[order(scgeo@data$NAME),]
scdata <- scdata[order(scdata$County),]

# Are the two county columns identical now? They should be:
identical(scgeo@data$NAME,scdata$County )

# Add the election results 
scmap <- append_data(scgeo, scdata, key.shp = "NAME", key.data = "County")
scmap <- append_data(scmap, sced, key.shp = "NAME", key.data = "County")

# Instead of just coloring the winner, let's color by strength of win with multiple layers
# Use same intensity for all - get minimum and maximum for the top 3 combined
minpct <- min(c(scmap$`Donald J TrumpPct`, scmap$`Marco RubioPct` , scmap$`Ted CruzPct`))
maxpct <- max(c(scmap$`Donald J TrumpPct`, scmap$`Marco RubioPct` , scmap$`Ted CruzPct`))

# Create leaflet palettes for each layer of the map:
winnerPalette <- colorFactor(palette=c("#984ea3", "#e41a1c"), domain = scmap$winner)
trumpPalette <- colorNumeric(palette = "Purples", domain=c(minpct, maxpct))
rubioPalette <- colorNumeric(palette = "Reds", domain = c(minpct, maxpct))
cruzPalette <- colorNumeric(palette = "Oranges", domain = c(minpct, maxpct))
edPalette <- colorNumeric(palette = "Blues", domain=scmap@data$PctCollegeDegree)

# Create a pop-up:
scpopup <- paste0("<b>County: ", scmap@data$County, "<br />Winner: ", scmap@data$winner, "</b><br /><br />Trump: ", percent(scmap@data$`Donald J TrumpPct`), "<br />Rubio: ", percent(scmap@data$`Marco RubioPct`), "<br />Cruz: ", percent(scmap@data$`Ted CruzPct`), "<br /><br />Pct w college ed: ", scmap@data$PctCollegeDegree, "% vs state-wide avg of 25%")

# Basic interactive map showing winner in each county:

leaflet(scmap) %>%
  addProviderTiles("CartoDB.Positron") %>%
  addPolygons(stroke=TRUE,
              weight=1,
              smoothFactor = 0.2, 
              fillOpacity = .75, 
              popup=scpopup, 
              color= ~winnerPalette(scmap@data$winner),
              group="Winners"
  ) %>%
  addLegend(position="bottomleft", colors=c("#984ea3", "#e41a1c"), labels=c("Trump", "Rubio"))



# Put top 3 candidates in their own layers and add education layer, store in scGOPmap2 variable

scGOPmap2 <- leaflet(scmap) %>%
  addProviderTiles("CartoDB.Positron") %>%
  addPolygons(stroke=TRUE,
              weight=1,
              smoothFactor = 0.2, 
              fillOpacity = .75, 
              popup=scpopup, 
              color= ~winnerPalette(scmap@data$winner),
              group="Winners"
  ) %>% 
  addLegend(position="bottomleft", colors=c("#984ea3", "#e41a1c"), labels=c("Trump", "Rubio"))   %>%
  
  addPolygons(stroke=TRUE,
              weight=1,
              smoothFactor = 0.2, 
              fillOpacity = .75, 
              popup=scpopup, 
              color= ~trumpPalette(scmap@data$`Donald J TrumpPct`),
              group="Trump"
  ) %>%
  
  addPolygons(stroke=TRUE,
              weight=1,
              smoothFactor = 0.2, 
              fillOpacity = .75, 
              popup=scpopup, 
              color= ~rubioPalette(scmap@data$`Marco RubioPct`),
              group="Rubio"
  ) %>%
  
  addPolygons(stroke=TRUE,
              weight=1,
              smoothFactor = 0.2, 
              fillOpacity = .75, 
              popup=scpopup, 
              color= ~cruzPalette(scmap@data$`Ted CruzPct`),
              group="Cruz"
  ) %>%
  
  addPolygons(stroke=TRUE,
              weight=1,
              smoothFactor = 0.2, 
              fillOpacity = .75, 
              popup=scpopup, 
              color= ~edPalette(scmap@data$PctCollegeDegree),
              group="College degs"
  ) %>%
  
  addLayersControl(
    baseGroups=c("Winners", "Trump", "Rubio", "Cruz", "College degs"),
    position = "bottomleft",
    options = layersControlOptions(collapsed = FALSE)
  ) 

# View the scGOPmap2 map:
print(scGOPmap2)

# save as a self-contained HTML file
htmlwidgets::saveWidget(scGOPmap2, file="scGOPwidget2.html")

# save as an HTML file with dependencies in another directory:
htmlwidgets::saveWidget(widget=scGOPmap2, file="scGOPprimary_withdependencies.html", selfcontained=FALSE, libdir = "js")
