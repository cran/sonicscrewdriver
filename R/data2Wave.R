#' Convert data into a Wave object
#'
#' Make a sequence of data into a normalised Wave object.
#'
#' @param left Data for  audio channel
#' @param samp.rate Sampling rate for Wave object
#' @param bit Bit depth of Wave object
#' @return A mono Wave object.
#' @examples
#' pattern <- seq(from=-1, to=1, length.out=100)
#' data <- rep.int(pattern, 100)
#' w <- data2Wave(data)
#' @export
#'
data2Wave <- function(left, samp.rate=44100, bit=16) {
  if (!is.numeric(left)) {
    stop("Data must be numeric.")
  }
  a <- mean(left)
  left <- left-a
  wave <- tuneR::Wave(left=left, right = numeric(0), samp.rate=samp.rate, bit=bit)
  wave <- tuneR::normalize(wave)
  return(wave)
}