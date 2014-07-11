rprintf.match <- function(x,fun,...) {
  fun <- match.fun(fun)
  fun(x,...)
}
