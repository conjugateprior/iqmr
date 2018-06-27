#' iqmr: Materials for the IQMR summer school
#'
#' The iqmr package provides materials for the IQMR summer school at the
#' Maxwell School at the University of Syracuse.  It is mostly a
#' repository of data but also stores labs and slides as vignettes.
#' To access lecture materials by name, use \code{\link{show_lecture}}.
#' To access lab instructions by name, use \code{\link{show_lab}}.
#'
#' @section Naming convention:
#' Data frames are prefixed \code{df_}, quanteda corpus objects are prefixed
#' \code{corpus_}, and quanteda dictionaries are prefixed \code{dict_}.
#'
#' @docType package
#' @name iqmr
NULL

#' UK Abortion Debate in Paragraph Form
#'
#' Second reading of David Steele's 1966 bill to relax UK Abortion law in 1966,
#' scraped from Hansard and divided into paragraphs.
#'
#' @format A quanteda corpus object with docvars
#' \describe{
#'   \item{speaker}{Speaker of each paragraph}
#'   \item{vote}{Which way this speaker voted after the debate:
#'               "yes", "no", or "abs" (abstained)}
#' }
#' @source \url{https://api.parliament.uk/historic-hansard/commons/1966/jul/22/medical-termination-of-pregnancy-bill}
"corpus_bara_para"

#' UK Abortion Debate in Speaker Contribution Form
#'
#' Second reading of David Steele's 1966 bill to relax UK Abortion law in 1966,
#' scraped from Hansard and aggregated by speaker.
#'
#' @format A quanteda corpus object with docvars
#' \describe{
#'   \item{speaker}{Speaker of each paragraph}
#'   \item{vote}{Which way this speaker voted after the debate:
#'               "yes", "no", or "abs" (abstained)}
#' }
#' @source \url{https://api.parliament.uk/historic-hansard/commons/1966/jul/22/medical-termination-of-pregnancy-bill}
"corpus_bara_speaker"

#' UK Abortion Debate in Speaker Contribution Form
#'
#' Second reading of David Steele's 1966 bill to relax UK Abortion law in 1966,
#' scraped from Hansard and aggregated by speaker 'turn'.
#'
#' @format A quanteda corpus object with docvars
#' \describe{
#'   \item{speaker}{Speaker of each paragraph}
#'   \item{vote}{Which way this speaker voted after the debate:
#'               "yes", "no", or "abs" (abstained)}
#' }
#' @source \url{https://api.parliament.uk/historic-hansard/commons/1966/jul/22/medical-termination-of-pregnancy-bill}
"corpus_bara_turn"

#' Post War UK Party Platforms
#'
#' UK Party platforms for general election from 1945 to 2015.
#' From 1997 includes minor and regional parties.  Main parties are
#' "Con" (Conservatives), "Lab" (Labour), and "Lib" (Liberals),
#' "LibSDP" (Liberals / SDP Alliance),
#' "LD" (Liberal Democrats).  "Coalition" denotes the Conservative-Liberal
#' Democrat coalition government.
#'
#' @format A quanteda corpus object with docvars
#' \describe{
#'   \item{country}{Always 'UK'}
#'   \item{scope}{Always 'natl' (national)}
#'   \item{year}{Year of election}
#'   \item{lang}{Always 'en' (English)}
#'   \item{party}{Party name abbreviation. See Details for the main parties}
#' }
#' @source Ken Benoit and the original 'quantedaData' package
"corpus_uk_manif"


#' Bara et al. Dictionary
#'
#' The content analysis dictionary used in J. Bara, A. Weale, and A. Bicquelet
#' (2007) 'Analysing Parliamentary Debate with Computer Assistance'
#' Swiss Political Science Review 13:4
#' \url{https://doi.org/10.1002/j.1662-6370.2007.tb00090.x}.
#'
#' This dictionary can be used to analyse \code{\link{corpus_bara_speaker}}
#'
#' @format A quanteda dictionary
#'
#' @source Judith Bara
"dict_baraetal"

#' Laver and Garry Dictionary
#'
#' The content analysis dictionary used in M. Laver and J. Garry (2000)
#' 'Estimating Policy Poisitions from Political Text'
#' American Journal of Political Science 44:3
#' \url{https://doi.org/10.2307/2669268}.
#'
#' This dictionary was constructed from the platforms of the three main
#' parties contesting the 1992 UK election.  These manifestos can be found
#' in \code{\link{corpus_uk_manif}}.
#'
#' @format A quanteda dictionary
#'
#' @source Michael Laver
"dict_lavergarry"

#' Partial-Birth Abortion Act Senate Debate in Speaker Contribution Form
#'
#' The final US Senate debate for the 2003 Act banning 'partial-birth' abortion,
#' scraped from the Congressional Record and organized by paragraph (or
#' a near approximation).
#'
#' This is the kind of data frame you might make a quanteda corpus out of.
#' It was constructed by filtering and aggregating \code{\link{df_pba_debate}}.
#' Contributions from the sequence of 'presiding officers' has been removed.
#'
#' @format A data frame object with variables
#' \describe{
#'   \item{speaker}{Speaker's family name, capitalized except for DeWine}
#'   \item{contributions}{All this speaker said in the course of debate}
#'   \item{party}{Party membership of the speaker. "D" (Democrat) or
#'                "R" (Republican).}
#' }
#' @source Congressional Record:
#'         \url{https://www.congress.gov/crec/2003/10/21/modified/CREC-2003-10-21-pt1-PgS12914-2.htm},
#'         \url{https://www.congress.gov/crec/2003/10/21/modified/CREC-2003-10-21-pt1-PgS12927-2.htm}
"df_pba_debate_by_speaker"

#' Partial-Birth Abortion Act Senate Debate in Paragraph Form
#'
#' The final US Senate debate for the 2003 Act banning 'partial-birth' abortion,
#' scraped from the congressional record and organized by paragraph (or
#' a near approximation).
#'
#' This is the kind of data frame you might make a quanteda corpus out of.
#'
#' @format A data frame object with variables
#' \describe{
#'   \item{speaker}{Speaker's family name, capitalized except for DeWine}
#'   \item{text}{What was spoken}
#'   \item{quote}{Whether this part of the record is the speaker's own words
#'                or a quote, either of the bill itself or a letter from
#'                another person or organization}
#'   \item{party}{Party membership of the speaker. "D" (Democrat) or
#'                "R" (Republican).  For the 'presiding officer', no party
#'                is recorded although they will have one.}
#' }
#' @source Congressional Record:
#'         \url{https://www.congress.gov/crec/2003/10/21/modified/CREC-2003-10-21-pt1-PgS12914-2.htm},
#'         \url{https://www.congress.gov/crec/2003/10/21/modified/CREC-2003-10-21-pt1-PgS12927-2.htm}
"df_pba_debate"

#' Show a set of slides
#'
#' @param which Which session's lecture slides to show: Currently 1, 2, or 3
#'
#' @return None
#' @export
#'
show_lecture <- function(which){
  slidesname <- paste0("slides", which, ".pdf")
  utils::browseURL(paste0("http://dl.conjugateprior.org/iqmr/", slidesname))

  # utils::RShowDoc(paste0("slides", which), package = "iqmr")
}

#' Show a lab
#'
#' @param which Which lab to show: Currently 1, 2, or 3
#'
#' @return None
#' @export
#'
show_lab <- function(which){
  utils::RShowDoc(paste0("lab", which), package = "iqmr")
}
