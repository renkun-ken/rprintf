rprintf.match <- function(x,fun,...) {
  fun <- get(paste0("rprintf.",fun))
  fun(x,...)
}
