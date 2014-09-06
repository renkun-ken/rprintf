#' Build a character vector or list with variable-based
#' string formatting
#'
#' The \code{rprintv} function applies variable-based formatter to
#' transform the given character vector to specific texts with
#' named variables replaced by a given set of values in correct
#' formats.
#'
#' @param x The character vector or list to be transformed
#' @param ... The arguments that specify the set of values to be
#'   placed
#' @export
#' @examples
#' \dontrun{
#'
#' # Format a single-entry character vector with variable mechanism
#' rprintf("Hello, $name", name="world")
#' rprintf("$name ($age years old)",name="Ken",age=24)
#' rprintf("He is $age but has a height of $height:.2fcm",age=18,height=190)
#' rprintf("$a, $b:.1f, $c:+.2f, $b, $a:.0f",a=1.56,b=2.34,c=3.78)
#' }
#'
rprintv <- function(x,...) {
  args <- makelist(...)
  x <- stringr::str_replace_all(x,"%","%%")
  xs <- unlist(stringr::str_extract_all(x,stringr::perl("(?<!\\$)\\$[\\w\\._]+(:[\\s\\+\\-\\#\\.\\d]*\\w)?")))
  xss <- stringr::str_replace_all(xs,stringr::perl("(?<!\\$)\\$([\\w\\._]+)(:[\\s\\+\\-\\#\\.\\d]*\\w)?"),"\\1")
  pass1 <- stringr::str_replace_all(x,stringr::perl("(?<!\\$)\\$([\\w\\._]+):(?!\\$)(?!:+)([\\s\\+\\-\\#\\.\\d]*\\w)?"),"%\\2")
  pass2 <- stringr::str_replace_all(pass1,stringr::perl("(?<!\\$)\\$([\\w\\._]+)"),"%s")
  pass3 <- do.call(sprintf,c(list(pass2),args[xss]))
  result <- stringr::str_replace_all(pass3,"\\$\\$","$")
  stringr::str_replace_all(result,"::",":")
}
