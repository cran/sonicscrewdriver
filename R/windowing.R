#' Windowing Function for Wave Objects
#'
#' Separates a Wave object into windows of a defined length and runs a function
#' on the window section. Windows may overlap, and the function can make use of
#' 'parallel' package for multi-core processing. It will also show a progress bar
#' if the 'pbapply' package is installed.
#'
#' @param wave A Wave object or filename. Using filenames may save loading an
#'   entire large file into memory.
#' @param window.length The length of the analysis window (in samples).
#' @param window.overlap The overlap between successive windows (in samples), a
#'   negative value will result in a gap between windows.
#' @param bind.wave If TRUE and FUN returns wave objects, then these are
#'   combined into a single object
#' @param FUN FUN to be applied to windows.
#' @param ... Additional parameters to FUN
#' @param complete.windows If TRUE (default) the final window will not be
#'   processed unless it has a length equal to window.length.
#' @param cluster A cluster form the 'parallel' package for multi-core computation.
#' @keywords wave
#' @export
#' @examples
#' \dontrun{
#' windowing(wave, window.length=1000, FUN=duration, window.overlap=0, bind.wave=TRUE)
#' }
windowing <- function(
  wave,
  window.length,
  FUN,
  window.overlap=0,
  bind.wave=TRUE,
  complete.windows=TRUE,
  cluster=NULL,
  ...){
  if (typeof(wave) == "character") {
    FUN2 <- function(start, wave, window.length, ...){
      wave <- readAudio(wave, from=start,to=start+window.length,units="samples")
      return(FUN(wave, start, window.length, ...))
    }
    info <- av::av_media_info(wave)
    n.samples <- info$duration * info$audio[,"sample_rate"]
  } else {
    validateIsWave(wave)
    n.samples <- length(wave)
    FUN2 <- function(start, wave, window.length, ...){
      section <- cutws(wave, from=start, to=start+window.length)
      return(FUN(section, start, window.length, ...))
    }
  }
  n.windows <- ceiling(n.samples / (window.length - window.overlap))

  starts <- c(
    1,
    1:(n.windows-1) * (window.length - window.overlap) +1
  )
  if (complete.windows) {
    starts <- starts[which(starts <= n.samples - window.length + 1)]
  }

  if (is.null(cluster)){
    if (package.installed("pbapply", askInstall = FALSE)) {
      l <- pbapply::pblapply(starts, FUN2, wave=wave, window.length=window.length, ...)
    } else {
      l <- lapply(starts, FUN2, wave=wave, window.length=window.length, ...)
    }
  } else {
    if (package.installed("pbapply", askInstall = FALSE)) {
      l <- pbapply::pblapply(starts, FUN2, cl=cluster, wave=wave, window.length=window.length, ...)
    } else {
      l <- parallel::parLapply(cluster, starts, FUN2, wave=wave, window.length=window.length, ...)
    }
  }

  if (bind.wave & typeof(l[[1]]) == "S4" & class(l[[1]])[[1]] == "Wave") {
    w <- l[[1]]
    for (i in 2:length(l)) {
      w <- tuneR::bind(w, l[[i]])
    }
    l <- w
  }
  return(l)
}

