% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_cid.R
\name{get_cid_points}
\alias{get_cid_points}
\title{Get Cycling Infrastructure data on points}
\usage{
get_cid_points(type)
}
\arguments{
\item{type}{Type of infrastructure}
}
\value{
sf object
}
\description{
Get Cycling Infrastructure data on points
}
\examples{
get_cid_points(type = "signal")
get_cid_points(type = "cycle_parking")
get_cid_points(type = "restricted_point")
get_cid_points(type = "signage")
get_cid_points(type = "traffic_calming")
}
