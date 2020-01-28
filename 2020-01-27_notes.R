
#'--- 
#' title: "Building tidy tools - notes"
#' author: "Nayef Ahmad"
#' date: "2020-01-27"
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
#' Reference: https://github.com/rstudio-conf-2020/build-tidy-tools 


#' # Motivation
#' 
#' Why the diff between output of sd(x) and my_sd(x)? 
#' 


sd
x <- 1:10
sd(x)
var <- function(x) 100
sd(x)
my_sd <- function(x) sqrt(var(x))
my_sd(x)
    
    
#' Note that it calls the vsar( ) fn. What if we redefine var( ) in our project
#' env? Ans. Won't affect 
#'
#' Lexical scoping: if a var can't be found in current env, look in next level
#' up
#' 


    
#' ## Environments 
#' 
#' * Hierarchical collection of named objects.  
#' * Mapping from names to objects 
#' * Diff between envs and lists: 
#'     * envs can't really have classes. 
#'     
#' 
#' Most programming langs don't expose environments to users.  
#' 
 

#' # Create an environment: 
#' 

library(rlang)
e <- env()
e$a <- 1  # create an object a in the env e, and assign value 1 to it
e$a

# e[[1]]  # works for lists but not envs 

e$e <- e
e$e$e$a # works for envs, but a list would create a copy and then re-bind 

# ?lobstr::obj_addrs
lobstr::obj_addr(e)

# inspecting environments:
str(e)
ls(e)
names(e)

env_print(e)  # also gives parent environment 



#' # Scoping 
#' 

# This is a recursive function: 
find_var <- function(name, env){
    if (identical(env, emptyenv())){
        stop("object '", name, "' not found", call. = FALSE)
    } else if (env_has(env, name)){
        env_get(env, name)
    } else {
        find_var(name, env_parent(env))
    }
    
}


e1 <- env()

e1$a <- 1111  # create an object a in the env e, and assign value 1111 to it
# find_var("1111", e1)  #  Error: object '1111' not found 
find_var("a", e1)

# this is the list of environments that R searches through: 
search()


#' # Getting environments of functions
#' 

find_var("var", environment(sd))

get_env(ggplot2::geom_point)
get_env(dplyr::mutate)
get_env(MASS::select)

#' Note that all have "namespace" in output. This is the same for all packages. 
#' All fns of a package live in the "namespace" env. 
#' 
#' Every that e.g. ggplot2 uses from another package is saved in a special env 
#' within ggplot2.   
#' 

# ?env_print
# ?env_parent
# ?env_parents

env_print(ggplot2::geom_point)
env_print(dplyr::mutate)
env_print(MASS::select)

env_parent(ggplot2::geom_point)

env_parents(ggplot2::geom_point)
env_parents(dplyr::mutate)
env_parents(MASS::select)



#' # How this works in a package 
#' 


