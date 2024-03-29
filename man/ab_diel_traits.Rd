% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/audioblastProcessors.R
\name{ab_diel_traits}
\alias{ab_diel_traits}
\title{Convert text times of day in audioblast traits to numeric values}
\usage{
ab_diel_traits(traits, date, lat, lon, overwrite = FALSE)
}
\arguments{
\item{traits}{Traits dataset retrieved using audioblast().}

\item{date}{The date used for conversion for time.}

\item{lat}{Latitude of location.}

\item{lon}{Longitude of location.}

\item{overwrite}{If TRUE then the function will overwrite any existing min/max.}
}
\description{
This function takes a traits dataset retrieved from audioblast and converts
values such as "day" into a numeric time of day based on the date and location.
}
