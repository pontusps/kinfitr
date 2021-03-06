% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kinfitr_pfmodels.R
\name{metab_power_model}
\alias{metab_power_model}
\title{Power Model for Parent Fraction}
\usage{
metab_power_model(time, a, b, c, ppf0 = 1, delay = 0)
}
\arguments{
\item{time}{Time in seconds.}

\item{a}{Parameter A.}

\item{b}{Parameter B.}

\item{c}{Parameter C.}

\item{ppf0}{The starting point of the parent fraction curve.}

\item{delay}{The delay of the metabolism curve.}
}
\value{
Predicted values
}
\description{
This is the model function for fitting of the classic power function.
}
\examples{
metab_power_model(seq(0, 60 * 60, by = 120), 0.004, 4.5, 0.27, 1, 0)
}
