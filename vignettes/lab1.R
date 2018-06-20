## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(quanteda) # for general text analysis
library(readtext) # for reading in all kinds of files

## ------------------------------------------------------------------------
txts <- readtext("data/abortion-debate-by-speaker/*.txt")
corp <- corpus(txts)

## ------------------------------------------------------------------------
vote <- c("abs", "abs", "abs", "no", "no", "no", "no",
          "no", "yes", "yes", "yes", "yes", "yes", "yes",
          "yes", "yes", "yes", "yes", "yes", "yes", "yes",
          "yes", "yes", "yes")
docvars(corp, "vote") <- vote
summary(corp)

## ------------------------------------------------------------------------
docvars(corp, "words_spoken") <- summary(corp)$Tokens

## ------------------------------------------------------------------------
dvars <- docvars(corp)

## ---- eval=FALSE---------------------------------------------------------
#  texts(corp)[5]

## ------------------------------------------------------------------------
nocorp <- corpus_subset(corp, vote == "no")
summary(nocorp)

## ----eval=FALSE----------------------------------------------------------
#  longcorp <- corpus_subset(corp, words_spoken > 50)

## ------------------------------------------------------------------------
longcorp <- corpus_trim(corp, what = "documents", min_ntoken = 50)

## ------------------------------------------------------------------------
readability <- textstat_readability(corp, "Flesch.Kincaid")
docvars(corp, "FK") <- readability$Flesch.Kincaid ## add it as a docvar
subset(docvars(corp), FK > 20) # looking at you Mr Mendelson
texts(corp)[19] # yes, I mean no, I mean, what?

## ------------------------------------------------------------------------
toks <- tokens(corp)
colls <- textstat_collocations(toks)
head(colls, 20)

## ------------------------------------------------------------------------
#toks2 <- tokens(corpus_reshape(corp, to = "sentence")) # split to sentences
toks2 <- tokens_remove(tokens(corp), stopwords(), padding = TRUE)
toks2 <- tokens_select(toks2, "[a-z]+", valuetype="regex", 
                       case_insensitive = FALSE, padding = TRUE) 
coll2 <- textstat_collocations(toks2)
coll3 <- textstat_collocations(toks2, size = 3) # three word phrases

## ---- eval=FALSE---------------------------------------------------------
#  kwic(corp, "mother*")

## ---- eval=FALSE---------------------------------------------------------
#  kwic(corp, "babi*", window = 10)

## ------------------------------------------------------------------------
babes <- kwic(corp, "babi*", window = 10)
txt <- paste(babes$pre, babes$post, collapse=" ") # make one big string

## ------------------------------------------------------------------------
corpdfm <- dfm(corp) # lowercases by default, but nothing more
dim(corpdfm)
featnames(corpdfm)[1:40] # really just colnames

## ------------------------------------------------------------------------
corpdfm <- dfm(corp, remove=stopwords(), remove_punct=TRUE,
               remove_numbers=TRUE)
dim(corpdfm) # a little smaller
featnames(corpdfm)[1:40]

## ------------------------------------------------------------------------
stemdfm <- dfm(corp, remove=stopwords(), remove_punct=TRUE,
               remove_numbers=TRUE, stem=TRUE)
dim(stemdfm) # about 1000 fewer 'word's
featnames(stemdfm)[1:40]

## ------------------------------------------------------------------------
smallcorpdfm <- dfm_trim(corpdfm, min_termfreq = 5, min_docfreq=5)
dim(smallcorpdfm)

## ------------------------------------------------------------------------
aggregate(words_spoken ~ vote, data=docvars(corp), FUN = sum)

## ------------------------------------------------------------------------
aggregate(words_spoken ~ vote, data = docvars(corp), FUN = median)

## ------------------------------------------------------------------------
dictionary(list(medics = c("doctor", "medical", "hospital"),
                mothers = c("mother", "parents")))

## ------------------------------------------------------------------------
baradic <- dictionary(file = "data/2007_abortion_dictionary.ykd")

## ------------------------------------------------------------------------
baradfm <- dfm(corp, dictionary = baradic)

## ------------------------------------------------------------------------
dim(baradfm)

## ------------------------------------------------------------------------
dictout <- as.matrix(baradfm)
dictout

## ---- results="asis"-----------------------------------------------------
tab <- data.frame(Mean = c(13.59, 7.82, 21.71, 4.61, 32.17, 20.09),
                  SD = c(2.98, 3.36, 4.73, 2.51, 6.94, 4.86),
                  row.names = c("advocacy", "legal", "medical", "moral", "procedural", "social" ),
                  stringsAsFactors = FALSE)
knitr::kable(t(tab))

## ------------------------------------------------------------------------
emph <- colSums(dictout) ## emphasis
propemph <- emph / sum(emph)*100 ## relative emphasis as a percentage
barplot(propemph)

## ------------------------------------------------------------------------
relevanttalk <- rowSums(dictout)
aggregate(relevanttalk ~ docvars(corp, "vote"), FUN=sum)

