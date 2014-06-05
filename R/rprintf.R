patterns <-
  c(default="(?<!\\%)\\%[\\s\\+\\-\\#\\.\\d]*[dioxXfeEgGaAs]",
    name="(?<!\\$)\\$\\w+(:[\\s\\+\\-\\#\\.\\d]*[dioxXfeEgGaAs])?",
    number="(?<!\\{)\\{\\d+(:[\\s\\+\\-\\#\\.\\d]*[dioxXfeEgGaAs])?\\}(?!\\})")
rprintf <- function(x,...,unlist=is.character(x)) {
  matches <- vapply(patterns,function(pattern) {
    grepl(pattern,x,perl = TRUE)
  },logical(length(x)))
  # print(matches)
  counter <- apply(matches,1,sum)
  # print(counter)
  if(!all(counter <= 1)) {
    many <- which(counter>1)
    if(length(many)>0) {
      message(sprintf("ambiguous:"))
      message(paste("[",many,"] ",x[many],sep = "",collapse = "\n"))
    }
    stop("Error in x")
  }
  funs.id <- apply(m1,1,function(row) head(which(row),1))
  funs <- names(patterns)[funs.id]
  result <- Map(rprintf.match,x,funs,...)
  if(unlist) {
    unlist(result)
  } else {
    result
  }
}
