
#'--- 
#' title: "Building tidy tools - Function interfaces"
#' author: "Nayef Ahmad"
#' date: "2020-01-28"
#' output: 
#'   html_document: 
#'     keep_md: yes
#'     code_folding: hide
#'     toc: true
#'     toc_float:
#'       collapsed: false
#'     toc_folding: false
#' ---
#' 
#' Reference: 
#' 
#' * https://github.com/rstudio-conf-2020/build-tidy-tools 
#'     * see file 5
#' * book: tidyverse design guide 
#' 
#' Interface of functions: name, args, output, side effects, etc.

#' We'll look at interfaces through the lens of regex/string manipulation
#' function: i.e. functions like sub(), gsub(), regexpr(), etc.
#'

#' # Base R vs. stringr
#' 
#' * grepl() = str_detect()
#' * grep() = str_which()
#' * grep(value = TRUE) = str_subset() 
#' * sub() = str_replace()
#' * gsub() = str_replace_all()
#' * strsplit() = str_split() 
#' * regexpr() = str_locate()
#' 









