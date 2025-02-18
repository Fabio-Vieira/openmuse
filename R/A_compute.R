#' @title A_compute: Compute adjacency matrix to construct a network
#' 
#' @param df a data frame containing a column ISRC codes, and a column with the registrant of each ISRC
#' @param struct a parameter that allows you to specify the name of the column should be used to create the network structure. If NULL, the structure will be based on the registrant.
#' @return returns an adjacency matrix
#' 
#' @examples
#' library(openmuse)
#' 
#' A <- A_compute(examples)
#' 
#' #Using the struct parameter
#' A <- A_compute(examples, "registrant")
#' 
#' 
#' @export 
A_compute <- function(df, struct = NULL){
  df$ident <- 1:nrow(df)
  A <- matrix(0, nrow = nrow(df), ncol = nrow(df))
  for(i in 1:nrow(A)){
    if(is.null(struct)){
      ids <- which(df$registrant == df$registrant[i])
    } else {
     ids <- which(df[,which(names(df) == struct)] == df[i,which(names(df) == struct)]) 
    }
    ids <- ids[-which(ids == i)]
    A[i,ids] <- 1
  }
  return(A)
}