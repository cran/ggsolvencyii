% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{sii_z_ex6_structure}
\alias{sii_z_ex6_structure}
\title{sii_z_ex6_structure}
\format{A data frame with columns:
\describe{
          \item{description}{string: the name of the component}
          \item{level}{string with format \emph{'level(numeric)' [<point> 'sublevel(numeric)'] ['d']} i.e. 1, 2.01, 3.1d where d indicates a diversification component}
          \item{childlevel}{string, same format as level, indicating the level of which the components combine into this level }
         }}
\source{
determined based on specification of EIOPA standard formula Solvency II structure. \cr
  made from excel-file in \href{https://github.com/vanzanden/ggsolvencyii/tree/master/_data_helperfiles}{github.com/vanzanden}, from there transfered to R environment with code in \code{preparingtables.R}.
}
\usage{
sii_z_ex6_structure
}
\description{
a standard formula structure (as of 2016), with descriptions in English.
}
\examples{
installedtable <- sii_z_ex6_structure
installedtable
}
\keyword{datasets}
