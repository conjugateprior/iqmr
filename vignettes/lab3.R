## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(quanteda)
library(readtext)

## ------------------------------------------------------------------------
data("df_pba_debate_by_speaker")
names(df_pba_debate_by_speaker)

corp <- corpus(df_pba_debate_by_speaker, text_field = "contributions", docid_field = "speaker")
docvars(corp, "speaker") <- df_pba_debate_by_speaker$speaker # add a speaker field

## ------------------------------------------------------------------------
corpdfm <- dfm(corp)

## ------------------------------------------------------------------------
wfish <- textmodel_wordfish(corpdfm, dir = c(3, 21))
summary(wfish)

## ------------------------------------------------------------------------
preds  <- predict(wfish, interval = "confidence")
preds

## ------------------------------------------------------------------------
# make a data frame from fit matrix and the document variables
pos <- data.frame(docvars(corpdfm), preds$fit)
pos <- pos[order(pos$fit),]

## ------------------------------------------------------------------------
library(ggplot2)
library(ggrepel) # for labelling
theme_set(theme_minimal())

ggplot(pos, aes(x = fit, y = 1:nrow(pos), xmin = lwr, xmax = upr, col = party)) +
  geom_point() +
  geom_errorbarh(height = 0) +
  scale_color_manual(values = c("blue", "red")) +
  scale_y_continuous(labels = pos$speaker, breaks = 1:nrow(pos)) +
  labs(x = "Position", y = "Speaker") +
  ggtitle("Estimated Positions from Senate Partial-Birth Abortion Debate",
          subtitle = "October 21st, 2003")

## ------------------------------------------------------------------------
wscores <- data.frame(word = wfish$features,
                      score = wfish$beta,
                      offset = wfish$psi)

## ------------------------------------------------------------------------
testwords <- c("life", "choice", "womb", "her", "woman", "health",
               "born", "baby", "little", "gruesome", "kill", "roe",
               "wade", "medical", "her", "his", "child", "religion",
               "catholic", "doctor", "nurse")

