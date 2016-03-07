#' NYC Motor Vehicle Collisions
#'
#' Spatial data on motor vehicle collisions in New York City during July 2015.
#'
#' @source New York Police Department via NYC OpenData
#' \url{https://data.cityofnewyork.us/Public-Safety/NYPD-Motor-Vehicle-Collisions/h9gi-nx95}
#' @format SpatialPointsDataFrame with columns
#' \describe{
#' \item{unique_key}{7 digit numeric collision identifier}
#' \item{time,date,datetime}{Time and date of collision.  'datetime' combines 'date' and 'time'.}
#' \item{borough}{Borough collision occurred}
#' \item{zip_code}{5 digit numeric ZIP code}
#' \item{number_of_cyclist_injured,
#'       number_of_cyclist_killed,
#'       number_of_motorist_injured,
#'       number_of_motorist_killed,
#'       number_of_pedestrians_injured,
#'       number_of_pedestrians_killed,
#'       number_of_persons_injured,
#'       number_of_persons_killed}{Numeric counts of injuries and fatalities}
#' \item{contributing_factor_vehicle_1,
#'       contributing_factor_vehicle_2,
#'       contributing_factor_vehicle_3,
#'       contributing_factor_vehicle_4,
#'       contributing_factor_vehicle_5}{}
#' \item{off_street_name,on_street_name,cross_street_name}{Collision location street address information}
#' \item{vehicle_type_code_1,
#'       vehicle_type_code_2,
#'       vehicle_type_code_3,
#'       vehicle_type_code_4,
#'       vehicle_type_code_5}{Vehicle type names}
#' }
#' Use \code{coordinates(nyccollisions)} to view the geographic coordinates of the
#' collisions (longitude, latitude).
"nyccollisions"
