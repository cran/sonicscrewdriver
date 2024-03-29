% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/WaveFilter.R
\name{filterWave}
\alias{filterWave}
\title{Apply a WaveFilter object to a Wave object}
\usage{
filterWave(w, filt, cl = NULL)
}
\arguments{
\item{w}{A Wave object.}

\item{filt}{Wave object with the selected filter applied.}

\item{cl}{Optional. If a cluster is specified, the filter will be applied in parallel.}
}
\description{
A WaveFilter object is an object containing information necessary for the
filterw function to apply the filter to a Wave object. This is designed to
allow a pipe operator (either magrittr or base R) to be used to apply filters
to a Wave in a pipeline.
}
\details{
Supported filters include those from the seewave package.
}
