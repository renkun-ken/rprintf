patterns <-
  c(sprintf="(?<!\\%)\\%[\\s\\+\\-\\#\\.\\d]*[dioxXfeEgGaAs]",
    rprintv="(?<!\\$)\\$\\w+(:[\\s\\+\\-\\#\\.\\d]*[dioxXfeEgGaAs])?",
    rprintn="(?<!\\{)\\{\\d+(:[\\s\\+\\-\\#\\.\\d]*[dioxXfeEgGaAs])?\\}(?!\\})")

#' @export
rprintf <- function(x,...,
  unlist=is.character(x),
  use.names=!is.null(names(x))) {
  matches <- do.call(cbind,
    lapply(patterns,function(pattern) {
      grepl(pattern,x,perl = TRUE)
  }))
  counter <- apply(matches,1,sum)
  if(!all(counter <= 1)) {
    many <- which(counter>1)
    stop(paste("Ambiguous formatting:\n",
      paste("[",many,"] ",x[many],sep = "",collapse = "\n"),sep="",collapse="\n"))
  }
  funs.id <- apply(matches,1,function(row) head(which(row),1))
  funs <- names(patterns)[funs.id]
  result <- Map(rprintf.match,x,funs,...)
  if(unlist) {
    unlist(result,use.names = use.names)
  } else {
    if(!use.names) names(result) <- NULL
    result
  }
}
