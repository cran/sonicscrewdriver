% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sDuration.R
\name{tSamples}
\alias{tSamples}
\title{Samples per time period}
\usage{
tSamples(time = 1, wave = NULL, samp.rate = NULL)
}
\arguments{
\item{time}{The duration in seconds}

\item{wave}{A Wave object containing pulses}

\item{samp.rate}{Integer sampling rate}
}
\value{
Number of samples
}
\description{
Calculates the number of samples for a given duration of a wave
}
\examples{
tSamples(10, samp.rate=44100)
\dontrun{
tSamples(10, wave=sheep)
}


}
