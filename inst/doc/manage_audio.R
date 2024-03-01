## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, message=FALSE-----------------------------------------------------
library(sonicscrewdriver)

## -----------------------------------------------------------------------------
filename <- system.file("extdata", "AUDIOMOTH.WAV", package="sonicscrewdriver")
w <- readAudio(filename)

