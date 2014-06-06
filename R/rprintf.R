patterns <-
  c(sprintf="(?<!%)%[\\s\\+\\-\\#\\.\\d]*\\w",
    rprintv="(?<!\\$)\\$\\w+(:[\\s\\+\\-\\#\\.\\d]*\\w)?",
    rprintn="(?<!\\{)\\{\\d+(:[\\s\\+\\-\\#\\.\\d]*\\w)?\\}(?!\\})",
    sprintf=".")

#' @export
rprintf <- function(x,...,
  unlist=is.character(x),
  use.names=!is.null(names(x))) {
  matches <- do.call(cbind,
    lapply(patterns,function(pattern) {
      grepl(pattern,x,perl = TRUE)
  }))
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
