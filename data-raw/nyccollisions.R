library(dplyr)
library(jsonlite)
library(sp)

# Fetch NYPD Motor Vehicle Collisions data for July, 2015
# Source: https://data.cityofnewyork.us/Public-Safety/NYPD-Motor-Vehicle-Collisions/h9gi-nx95
collisions.src.url <- paste0("https://data.cityofnewyork.us/resource/qiz3-axqb.json?",
                          "$limit=50000&",
                          "$where=date between '2015-07-01T00:00:00' and '2015-08-01T00:00:00'")

collisions.src.url <- gsub(" ", "%20", collisions.src.url)

collisions.raw <- jsonlite::fromJSON(collisions.src.url, flatten = TRUE)

# Clean data
collisions <- collisions.raw %>%
  dplyr::rename(vehicle_type_code_1 = vehicle_type_code1,
                vehicle_type_code_2 = vehicle_type_code2) %>%
  dplyr::filter(!is.na(longitude),
                !is.na(latitude)) %>%
  dplyr::mutate(longitude = as.numeric(longitude),
                latitude = as.numeric(latitude),
                date = as.Date(date),
                datetime = as.character(strptime(paste(date, time), "%Y-%m-%d %H:%M"))) %>%
  dplyr::mutate_each(funs(as.numeric(.)), starts_with("number")) %>%
  dplyr::select(-location.coordinates,
                -location.type)

# Convert to SpatialPointsDataFrame
sp::coordinates(collisions) <- ~ longitude + latitude
sp::proj4string(collisions) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"

# Save
save(collisions, file = "data/nyccollisions.RData", compress = "xz")
