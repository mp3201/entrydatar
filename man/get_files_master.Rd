% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_qcew_data.R
\name{get_files_master}
\alias{get_files_master}
\title{Master code: for selected years, download and export the data.}
\usage{
get_files_master(path_data = "~/Downloads/", year_start = 1990,
  year_end = 2013, industry = "naics")
}
\arguments{
\item{path_data:}{where do we store the data}

\item{year_start:}{start year for which we want data}

\item{year_end:}{end year for which we want data}

\item{industry:}{download naics or sic data}
}
\value{
NIL. Gets data for all years in range, splits the data, and then
  exports it into the appropriate files
}
\description{
Master code: for selected years, download and export the data.
}
