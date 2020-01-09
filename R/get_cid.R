#' Get Cycling Infrastructure data on lines
#'
#' @param type Type of infrastructure
#'
#' @return sf object
#'
#' @export
#'
#' @examples
#' get_cid_line(type = "advanced_stop_line)"
get_cid_line = function(type) {
  base_url = "https://cycling.data.tfl.gov.uk/CyclingInfrastructure/data/lines/"
  cid_url = paste0(base_url, type, ".json")
  sf::read_sf(cid_url)
}
