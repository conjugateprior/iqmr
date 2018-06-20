

# library(knitr)
#
# convert_rnw <- function(x){
#   x <- gsub("`", "'", x) # start quotes
#   x <- gsub("<<(.*)>>=", '```{r \\1}', x)
#   x <- gsub("@", '```', x)
#   x <- gsub("\\\\end\\{frame\\}", " ", x)
#   x <- gsub("\\\\begin\\{frame\\}(\\[t\\])*\\\\frametitle\\{(.*)\\}", "## \\2", x)
#   x <- gsub("\\\\begin\\{frame\\}\\[plain\\]", "## ", x)
#   x <- gsub("\\\\it[az]", " ", x)
#   x <- gsub("\\\\it[e]*m", "*", x)
#   x <- gsub("\\\\text[si][lt]\\{(.*?)\\}", "*\\1*", x)
#   x <- gsub("\\\\textbf\\{(.*?)\\}", "**\\1**", x)
#   x <- gsub("\\\\ldots", "...", x)
#   x <- gsub("\\\\pause", ". . .", x)
#   x[!grepl(pattern="^%.*", x)]
# }

#' Show a set of slides
#'
#' @param which Which session's slides to show: Currently 1, 2, or 3
#'
#' @return None
#' @export
#'
show_lecture <- function(which = c(1, 2, 3)){
  w <- match.call(which)
  RShowDoc(paste0("slides", w), package = "iqmr")
}

#' Show a lab
#'
#' @param which Which lab to show: Currently 1, 2, or 3
#'
#' @return None
#' @export
#'
show_lab <- function(which = c(1, 2, 3)){
  w <- match.call(which)
  RShowDoc(paste0("lab", w), package = "iqmr")
}