## pba debate

library(rvest)
library(stringr) # for preprocessing
library(tidyr)
library(dplyr)

process_debate_text <- function(txt) {
  # split into paragraphs
  para_start <- regex("^[ ]{2}", multiline = TRUE)
  paras <- unlist(str_split(txt, para_start))

  # replace page break markers w space
  paras <- str_replace(paras, "[ \\n]*\\[{2}Page [A-Z\\d]+\\]{2}[ \\n]*", " ")
  paras <- paras[grep("[a-zA-Z]", paras)] # there must be a letter at least

  # normalize quirky punctuation
  paras <- str_replace(paras, "``", "\"") # Compact exploded left quote marks
  paras <- str_replace(paras, "''", "\"") # Compact exploded right quote marks
  paras <- str_replace(paras, "`", "'") # Compact exploded right scare quote
  paras <- str_replace(paras, "([a-zA-Z0-9])--([a-zA-Z0-9])", "\\1 -- \\2") # explode hyphens

  # In this complex pattern group 1 is the complete match and group 7 is the name
  speaker_label <- regex("((^The )|(^Mrs. )|(^Mr. )|(^Ms. ))([eA-Z ]{2,}). ")
  speakers <- str_match(paras, speaker_label)[,7]

  # and remove this metadata from the transcript
  paras <- str_replace(paras, speaker_label, "")

  quotation <- regex("^[ ]{2}") # indented 2 more spaces in
  is_quote <- !is.na(str_match(paras, quotation)[,1]) # TRUE if a part of a quotation

  debate <- data.frame(speaker = speakers, text = paras, quote = is_quote,
                       stringsAsFactors = FALSE)
  debate <- fill(debate, speaker) # tidyr::fill in speakers for all paragraphs

  debate[!is.na(debate$speaker), ] # the entries for which we have a speaker
}

# Process each half of the debate
pt1 <- "https://www.congress.gov/crec/2003/10/21/modified/CREC-2003-10-21-pt1-PgS12914-2.htm"
txt1 <- read_html(pt1) %>%
  html_node("pre") %>%
  html_text
deb1 <- process_debate_text(txt1)

pt2 <- "https://www.congress.gov/crec/2003/10/21/modified/CREC-2003-10-21-pt1-PgS12927-2.htm"
txt2 <- read_html(pt2) %>%
  html_node("pre") %>%
  html_text
deb2 <- process_debate_text(txt2)

# Construct the two data frames, removing the presiding officer's contributions
df_pba_debate <- bind_rows(deb1, deb2)
df_pba_debate_by_speaker <- df_pba_debate %>%
  group_by(speaker) %>%
  summarise(contributions = paste(text, collapse = "\n")) %>%
  filter(!grepl("PRESID", speaker)) # remove the presiding officer

party <- c("R", "R", "D", "R", "R", "D", "R", "R", "D", "R", "D",
           "D", "R", "D", "R", "D", "D", "D", "R", "D", "R", "R", "R")
# fold in party
affiliation <- data.frame(speaker = df_pba_debate_by_speaker$speaker, party,
                          stringsAsFactors = FALSE)

# add party as new columns
df_pba_debate_by_speaker <- left_join(df_pba_debate_by_speaker, affiliation)
df_pba_debate <- left_join(df_pba_debate, affiliation)





# Will Lowe June 2018

