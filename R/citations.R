#' @name natdb_citations
#' @title Citations for all datasets within NATDB
#' @description Citations for all datasets within NATDB. These *MUST* be
#'     cited when publishing anything that makes use of this package:
#'     cite the data in preference to this package, if needs be. You
#'     will rarely use this data directly; instead, use the
#'     \code{\link{citations}} function.
#' @docType data
#' @keywords datasets
#' @usage natdb_citations
#' @format \code{natdb_citations} contains a \code{data.frame} of
#'     citations and paper information.
#' @seealso citations
NULL

#' Returns citations for the datasets in NATDB
#'
#' This will generate citations (in BibTeX format) for a given NATDB
#' dataset.
#' 
#' @param x The NATDB database object for which you want citations
#' @return Character vector of citations in BibTeX format
#' @author Will Pearse; Sylia Kinosian
#' #@examples
#' # Limit the scope of these as they have to work online on servers!...
#' # Also give an example (notrun) of how to use the cache
#' #@seealso 
#' @export
citations <- function(x){
    if(!inherits(x, "natdb"))
        stop("'", deparse(substitute(x)), "' must be of type 'natdb'")
    
    data("natdb_citations", envir=environment())
    datasets <- Filter(Negate(is.function), ls(pattern="^\\.[a-z]*\\.[0-9]+[a-d]?", name="package:natdb", all.names=TRUE))
    citations <- with(natdb_citations, BibTeX.citation[match(datasets, author_year)])
    return(unique(citations[!is.na(citations)]))
}

