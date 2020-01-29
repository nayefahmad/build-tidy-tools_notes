
#'--- 
#' title: "Building tidy tools - Object-oriented programming"
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
#' * https://github.com/rstudio-conf-2020/build-tidy-tools/blob/master/notes/7-oop.Rmd
#'     

library(sloop)

# help(package = "sloop")

#' # `otype()` and `typeof()`
# 1) ------------------------------------- 

df <- data.frame()
f <- factor()
mod <- lm(mpg ~ cyl, data = mtcars)

sloop::otype(df)
sloop::otype(f)
sloop::otype(mod)

#' You've already been using S3 objects a lot. 
#' 

sloop::otype(1:10)
sloop::otype(tibble::tibble())
sloop::otype(function(x){x})
sloop::otype(ggplot2::ggplot(mtcars, aes(mpg, wt)))

#' All S3 objects are built on base objects. To find what base obj it is built
#' on, use `typeof()`. S3 objects are just base objects with attributes. 
#' 
#' Most importantly, they have $class attributes. 
#' 

typeof(f)


attributes(df)



#' Generic functions (e.g. `print()`) can work with objects of several classes (?) 
#' 
#' A method is a specific implementation of a function for a specific class. 
#' 
#' 

#' **Finding the implementation for the print function for numerics and dates**
#' 
#' That is, given a specific object, see how R found the right method to use. 
#' 

x <- factor(1:10)
sloop::s3_dispatch(print(x))  # shows that the `print.factor` method is used 
sloop::s3_get_method(print.factor)  # shows details of `print.factor` method


x <- as.Date("2020-01-28")
sloop::s3_dispatch(print(x))
sloop::s3_get_method(print.Date)



