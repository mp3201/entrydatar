% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_qcew_data.R
\name{get_files_cut}
\alias{get_files_cut}
\title{Group all the functions}
\usage{
get_files_cut(data_cut = 10, year_start = 1990, year_end = 2015,
  industry = "naics", frequency = "quarter",
  path_data = "~/Downloads/tmp_data/", download = "", url_wayback = "",
  write = F, verbose = F)
}
\arguments{
\item{path_data:}{where do we store the data}

\item{year_start:}{start year for which we want data}

\item{year_end:}{end year for which we want data}

\item{industry:}{download naics or sic data}

\item{frequency:}{download the quarterly files or the yearly files (default is quarterly)}

\item{download:}{if empty do download the file from the BLS website, if not use a local version}

\item{url_wayback:}{allows to specify the path in internet wayback machine that kept some of the archive}

\item{write:}{save it somewhere}

\item{verbose:}{useful for looking all the downloads link (debugging mode)}
}
\value{
data.table aggregate
}
\description{
Group all the functions
}
\note{
downloads data from the Quarterly Census for Employment and Wages
  program, for desired years, splitting data by the aggregation level codes
  and exporting them into separate files sorted by year and aggregation level

: we intend to have a single file for each aggregation level, but it is
more convenient to merge the individual files using an external command line
tool like cat

Other code: loads data.table with option to write it for a given cut
}
\examples{
  dt <- get_files_cut(data_cut = 10, year_start = 1990, year_end =1993,
                      path_data = "~/Downloads/", write = T)
}
