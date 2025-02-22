% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summarise.R
\name{tango}
\alias{tango}
\alias{waltz}
\alias{polka}
\alias{charleston}
\title{Summarise one row per group}
\usage{
tango(.tbl, ..., .env = caller_env())

waltz(.tbl, ..., .env = caller_env())

polka(.tbl)

charleston(.tbl, ..., .name = "data", .env = caller_env())
}
\arguments{
\item{.tbl}{A data frame, most likely a grouped data frame}

\item{..., .env}{formulas for each column to create, and parent environment, see \code{\link[=ballet]{ballet()}}}

\item{.name}{Name of the packed column made by \code{charleston()}

The four functions play a separate role around the idea of
\code{\link[dplyr:summarise]{dplyr::summarise()}}:
\itemize{
\item \code{polka()} peels off one level of grouping from the grouping variable,
i.e. if \code{.tbl} was grouped by \code{x} and \code{y} the result of \code{polka()}
contains columns \code{x} and \code{y} and is only grouped by \code{x}
\item \code{waltz()} runs the \code{\link[=ballet]{ballet()}} defined \code{...} and makes
sure each result is of \code{\link[=vec_size]{vec_size()}} 1. The result tibble of \code{waltz()}
does not contain the grouping variables.
\item \code{tango()} is the closest to \code{\link[dplyr:summarise]{dplyr::summarise()}}, it column binds
the result of \code{polka()} and \code{waltz()} with \code{\link[vctrs:vec_cbind]{vctrs::vec_cbind()}}.
\item \code{charleston()} is similar to \code{tango()} but the results are packed
instead of being bind. The name of the created package column is
controled by the \code{.name} argument.
}}
}
\description{
Applies the \code{\link[=ballet]{ballet()}} and makes sure each results is of size 1,
according to \code{\link[vctrs:vec_size]{vctrs::vec_size()}}
}
\examples{
g <- group_by(iris, Species)

polka(g)

g \%>\%
  waltz(Sepal = ~mean(Sepal.Length * Sepal.Width))

g \%>\%
  tango(Sepal = ~mean(Sepal.Length * Sepal.Width))

g \%>\%
  charleston(Sepal = ~mean(Sepal.Length * Sepal.Width))

}
