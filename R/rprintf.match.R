rprintf.match <- function(x,fun,...) {
  fun <- get(fun)
  fun(x,...)
}
