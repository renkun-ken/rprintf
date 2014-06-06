#' @export
rprintn <- function(x,...) {
  args <- list(...)
  x <- stringr::str_replace_all(x,"%","%%")
  xs <- unlist(stringr::str_extract_all(x,stringr::perl("(?<!\\{)\\{\\d+(:[\\s\\+\\-\\#\\.\\d]*\\w)?\\}(?!\\})")))
  xss <- as.numeric(stringr::str_replace_all(xs,stringr::perl("(?<!\\{)\\{(\\d+)(:[\\s\\+\\-\\#\\.\\d]*\\w)?\\}(?!\\})"),"\\1"))
  pass1 <- stringr::str_replace_all(x,stringr::perl("(?<!\\{)\\{(\\d+):([\\s\\+\\-\\#\\.\\d]*\\w)?\\}(?!\\})"),"%\\2")
  pass2 <- stringr::str_replace_all(pass1,stringr::perl("(?<!\\{)\\{(\\d+)\\}(?!\\})"),"%s")
  do.call(sprintf,c(list(pass2),args[xss]))
}

