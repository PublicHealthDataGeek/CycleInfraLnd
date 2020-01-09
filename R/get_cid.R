#' Get Cycling Infrastructure data on lines
#'
#' @param type Type of infrastructure
#'
#' @return sf object
#'
#' @export
#'
#' @examples
#' # get_cid_lines(type = "advanced_stop_line")
get_cid_lines = function(type) {
  base_url = "https://cycling.data.tfl.gov.uk/CyclingInfrastructure/data/lines/"
  cid_url = paste0(base_url, type, ".json")
  sf::read_sf(cid_url)
}

#' Get Cycling Infrastructure data on points
#'
#' @param type Type of infrastructure
#'
#' @return sf object
#'
#' @export
#'
#' @examples
#' # get_cid_points(type = "signal")
get_cid_points = function(type) {
  base_url = "https://cycling.data.tfl.gov.uk/CyclingInfrastructure/data/points/"
  cid_url = paste0(base_url, type, ".json")
  sf::read_sf(cid_url)
}
