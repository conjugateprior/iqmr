
## ----setup,include=FALSE-------------------------------------------------



## ----load-library--------------------------------------------------------
library(austin)


## ----eval=FALSE----------------------------------------------------------
## install.packages('austin', repos="http://r-forge.r-project.org", type="source")


## ----reading-------------------------------------------------------------
data <- read.csv('us-abortion-debate.csv', row.names=1)


## ----check-dimension,comment=''------------------------------------------
dim(data)


## ----small-section,comment=''--------------------------------------------
data[1:5,1:5]


## ----make-wfm------------------------------------------------------------
senate <- wfm(data, word.margin=2)


## ----estimate-wf-model---------------------------------------------------
senate.res <- wordfish(senate)


## ----summarise-model,comment=''------------------------------------------
summary(senate.res)


## ----plot-words----------------------------------------------------------
plot(senate.res)


## ----get-words,comment=''------------------------------------------------
word.coefs <- coef(senate.res, 'poisson')$words ## just take the word parameters
wds <- c("life","unborn", "choic","her","woman","health","born","babi","defenseless","gruesom","kill")
word.coefs[wds,]


## ----plot-words-again----------------------------------------------------
dotchart(word.coefs[wds, 'beta'], wds)


