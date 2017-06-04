library(knitr)

conv_rnw <- function(x){
  x <- gsub("`", "'", x) # start quotes
  x <- gsub("<<(.*)>>=", '```{r \\1}', x)
  x <- gsub("@", '```', x)
  x <- gsub("\\\\end\\{frame\\}", " ", x)
  x <- gsub("\\\\begin\\{frame\\}(\\[t\\])*\\\\frametitle\\{(.*)\\}", "## \\2", x)
  x <- gsub("\\\\begin\\{frame\\}\\[plain\\]", "## ", x)
  x <- gsub("\\\\it[az]", " ", x)
  x <- gsub("\\\\it[e]*m", "*", x)
  x <- gsub("\\\\text[si][lt]\\{(.*?)\\}", "*\\1*", x)
  x <- gsub("\\\\textbf\\{(.*?)\\}", "**\\1**", x)
  x <- gsub("\\\\ldots", "...", x)
  x <- gsub("\\\\pause", ". . .", x)
  x[!grepl(pattern="^%.*", x)]
}

  writeLines(x, 'foo.Rmd')