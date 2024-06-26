#' Convert data into a Wave object
#'
#' Make a sequence of data into a normalised Wave object.
#'
#' @param left Data for mono audio channel
#' @param samp.rate Sampling rate for Wave object
#' @param bit Bit depth of Wave object
#' @param remove.offset If TRUE any DC offset is removed
#' @param normalise IF TRUE the output Wave is normalised to -1:1
#' @param unit See tuneR::normalize. If NULL this is handled automatically.
#' @return A mono Wave object.
#' @examples
#' pattern <- seq(from=-1, to=1, length.out=100)
#' data <- rep.int(pattern, 100)
#' w <- data2Wave(data)
#' @export
#'
data2Wave <- function(left, samp.rate=44100, bit=16, unit=NULL, remove.offset=TRUE, normalise=TRUE) {
  if (!is.numeric(left)) {
    stop("Data must be numeric.")
  }

  wave <- tuneR::Wave(left=left, right = numeric(0), samp.rate=samp.rate, bit=bit)
  if (normalise == TRUE) {
    wave <- normalise(wave, unit=unit, center=remove.offset)
  }
  return(wave)
}
