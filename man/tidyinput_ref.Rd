% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kinfitr_miscfuncs.R
\name{tidyinput_ref}
\alias{tidyinput_ref}
\title{Tidy Up for Reference Region Methods}
\usage{
tidyinput_ref(t_tac, reftac, roitac, weights, frameStartEnd)
}
\arguments{
\item{t_tac}{Numeric vector of times for each frame in minutes.}

\item{reftac}{Numeric vector of radioactivity concentrations in the reference tissue for each frame.}

\item{roitac}{Numeric vector of radioactivity concentrations in the target tissue for each frame.}

\item{weights}{Optional. Numeric vector of the weights assigned to each frame in the fitting.}

\item{frameStartEnd}{Optional. This allows one to specify the beginning and final frame to use for modelling, e.g. c(1,20).}
}
\value{
A dataframe containing the tidied up t_tac, reftac, roitac and weights ready for modelling.
}
\description{
Function to tidy up the input argument vectors for reference region models.
}
\details{
This function i) adds uniform weights if weights are not specified, ii) checks that the
lengths of t_tac, reftac, roitac and weights are of the same length, iii) shortens the vectors
if a frameStartEnd is specified, iv) adds a zero frame if there is not one, and v) checks that
times are in minutes and not in seconds.
}
\examples{

#' # Note: Reference region models, and irreversible binding models, should not
# be used for PBR28 - this is just to demonstrate function

data(pbr28)

t_tac <- pbr28$tacs[[2]]$Times / 60
reftac <- pbr28$tacs[[2]]$CBL
roitac <- pbr28$tacs[[2]]$STR
weights <- pbr28$tacs[[2]]$Weights

tidyinput_ref(t_tac, reftac, roitac, weights, frameStartEnd = c(1, 10))
}
\author{
Granville J Matheson, \email{mathesong@gmail.com}
}
