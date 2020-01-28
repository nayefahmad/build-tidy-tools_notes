
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

library(stringr)

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

#' # Grouping args according to intent/frequency/...? 
#' 

?strsplit
?grepl



#' # Which args are required/optional? 
#' 

?lm  # required: formula (in general, the ones without defaults are required) 
?sample  # required: 1 of them 
?diag  # required: nrow if x not specified .... it's complicated  
?str_replace_all  # required: all of them?? 

#' Hadley: There is a `missing` fn ... THAT SHOULD ALMOST NEVER BE USED
#' 


#' # Hidden arguments 
#' 
#' These are things that change the output of the fn, but aren't specified at calling time. 

data.frame(x = "abc")$x  # returns a factor, unless options(stringsAsFactors = FALSE)
tolower("I")  # gives a diff thing if your locale is Turkey 
factor(letters)


?data.frame
?tolower


#' # Enums 
#' 
#' This is relevant when an arg can take a small number of values that can 
#' be enumerated. 
#' 

?trimws()

# Args: trimws(x, which = c("both", "left", "right"), whitespace = "[ \t\r\n]")
# Q: what's going on with the char vector passed to which as a default value? 

?str_trunc()
?rank()

#' The first element of the char vector is the default. The user can see the
#' default and all other valid arguments. If user enters an invalid value, they
#' will get an informative error message. 
#' 


#' # Using the `...`
#' 
#' Look into the {ellipsis} package - safer than using the `...`
#' 
#' 

#' # Type-stability
#' 

y <- sum(x)

#' without knowing anything about x or y, if we know the above code works, then
#' we know that:
#' 
#' * x is numeric or logical vector (or matrix), any length
#' * y is numeric of length 1. 
#' 


x <- c(TRUE, FALSE)
y <- mean(x); y; class(y)

x <- c("TRUE", "FALSE")
y <- mean(x); y; class(y)

x <- factor("TRUE", "FALSE")
y <- mean(x); y; class(y)

#' Note that mean( ) throws warnings, not errors 
#' 






