% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dielHistogram.R
\name{dielHistogram}
\alias{dielHistogram}
\title{Diel Histogram}
\usage{
dielHistogram(
  times,
  by = "hour",
  col = "grey",
  maxval = NA,
  presence.only = FALSE,
  limits = c(1, 2)
)
}
\arguments{
\item{times}{A vector of times that can be pocessed by dielFraction().}

\item{by}{Controls the size of histogram bins, one of "hour", "15minute", "30minute".}

\item{col}{Colour of the plot.}

\item{maxval}{By default scales histogram within limits, specifying a maximum value here allows comparison between plots.}

\item{presence.only}{Only show presence/absence not values.}

\item{limits}{Limits of the plotting (see dielPlot()).}
}
\value{
A data frame of start and end points of bins.
}
\description{
Draws a histogram on a dielPlot() using pre-defined bins related to time of day.
}
