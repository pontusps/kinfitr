% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kinfitr_reflogan.R
\name{plot_refLoganfit}
\alias{plot_refLoganfit}
\title{Plot: Non-Invasive Logan Plot}
\usage{
plot_refLoganfit(refloganout, roiname = NULL)
}
\arguments{
\item{refloganout}{The output object of the refLogan fitting procedure.}

\item{roiname}{Optional. The name of the Target Region to see it on the plot.}
}
\value{
A ggplot2 object of the plot.
}
\description{
Function to visualise the fit of the refLogan model to data.
}
\examples{
data(simref)

t_tac <- simref$tacs[[2]]$Times
reftac <- simref$tacs[[2]]$Reference
roitac <- simref$tacs[[2]]$ROI1
weights <- simref$tacs[[2]]$Weights

fit <- refLogan(t_tac, reftac, roitac, k2prime = 0.1, tstarIncludedFrames = 10, weights = weights)

plot_refLoganfit(fit)
}
\author{
Granville J Matheson, \email{mathesong@gmail.com}
}
