% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kinfitr_SIME.R
\name{SIME}
\alias{SIME}
\title{Simultaneous Estimation of Non-Displaceable Binding (SIME)}
\usage{
SIME(t_tac, tacdf, input, Vndgrid, weights = NULL, roiweights = NULL,
  inpshift = 0, vB = NULL, twotcmstart = NULL,
  frameStartEnd = NULL, k2.start = 0.1, k2.lower = 0,
  k2.upper = 0.5, k3.start = 0.1, k3.lower = 0, k3.upper = 0.5,
  k4.start = 0.1, k4.lower = 0, k4.upper = 0.5,
  success_cutoff = 0.5)
}
\arguments{
\item{t_tac}{Numeric vector of times for each frame in minutes. We use the
time halfway through the frame as well as a zero. If a time zero frame is
not included, it will be added.}

\item{tacdf}{Named dataframe of TACs in wide format, i.e. each TAC should be
a column.}

\item{input}{Data frame containing the blood, plasma, and parent fraction
concentrations over time.  This can be generated using the
\code{blood_interp} function.}

\item{Vndgrid}{The grid of Vnd values which will be tested to see which one
has the best fit.}

\item{weights}{Optional. Numeric vector of the weights assigned to each frame
in the fitting. We include zero at time zero: if not included, it is added.
If not specified, uniform weights will be used.}

\item{roiweights}{Optional. Numeric vector of the weights assigned to each
ROI in the fitting. If not specified, uniform weights will be used.}

\item{inpshift}{Optional. The number of minutes by which to shift the timing
of the input data frame forwards or backwards. If not specified, this will
be set to 0. This can be fitted using 1TCM or 2TCM.}

\item{vB}{Optional. The blood volume fraction.  If not specified, this will
be set to 0.05. This can be fitted using 1TCM or 2TCM.}

\item{twotcmstart}{Optional. The function can fit a 2TCM model to one of the
ROIs and use the estimated k2, k3 and k4 as starting parameters for the
rest of the fits. If left alone, these parameters will be specified as
below. If one wishes to run the 2TCM to start off, use a numeric value to
specify which column of \code{tacdf} to use for fitting this: best to use
the largest ROI.}

\item{frameStartEnd}{Optional: This allows one to specify the beginning and
final frame to use for modelling, e.g. c(1,20). This is to assess time
stability.}

\item{k2.start}{Optional. Starting parameter for fitting of k2. Default is
0.1.}

\item{k2.lower}{Optional. Lower bound for the fitting of k2. Default is 0.}

\item{k2.upper}{Optional. Upper bound for the fitting of k2. Default is 0.5.}

\item{k3.start}{Optional. Starting parameter for fitting of k3. Default is
0.1.}

\item{k3.lower}{Optional. Lower bound for the fitting of k3. Default is 0.}

\item{k3.upper}{Optional. Upper bound for the fitting of k3. Default is 0.5.}

\item{k4.start}{Optional. Starting parameter for fitting of k4. Default is
0.1.}

\item{k4.lower}{Optional. Lower bound for the fitting of k4. Default is 0.}

\item{k4.upper}{Optional. Upper bound for the fitting of k4. Default is 0.5.}

\item{success_cutoff}{Optional. Should values of Vnd for which a certain
proportion of ROIs failed be included? Default is 0.5, i.e. 50% should have
successfully fitted.}
}
\value{
A list with a data frame of the fitted parameter \code{out$par}, the
  dataframe containing the times and TACs \code{out$tacs}, the mean cost
  values after fitting (after ROI weighting) \code{out$fitvals}, the ROI cost
  values after fitting (before ROI weighting) \code{out$roifits}, the blood
  input data frame after time shifting \code{input}, a vector of the weights
  \code{out$weights}, a vector of the ROI weights \code{out$roiweights}, the
  inpshift value used \code{inpshift} and the vB value used \code{out$vB},
  and the success cutoff \code{success_cutoff}.
}
\description{
Function to fit the SIME Model of Ogden et al (2015) to data to estimate Vnd
for a set of TACs.
}
\examples{
\dontrun{
data(pbr28)

t_tac <- pbr28$tacs[[2]]$Times / 60
tacdf <- dplyr::select(pbr28$tacs[[2]], FC:CBL)
weights <- pbr28$tacs[[2]]$Weights

input <- blood_interp(
  pbr28$procblood[[2]]$Time / 60, pbr28$procblood[[2]]$Cbl_dispcorr,
  pbr28$procblood[[2]]$Time / 60, pbr28$procblood[[2]]$Cpl_metabcorr,
  t_parentfrac = 1, parentfrac = 1
)

Vndgrid <- seq(from = 0, to = 3, by = 0.5)
SIMEout <- SIME(t_tac, tacdf, input, Vndgrid,
  weights = weights,
  inpshift = 0.1, vB = 0.05
)
}
}
\references{
Ogden RT, Zanderigo F, Parsey RV. Estimation of in vivo
  nonspecific binding in positron emission tomography studies without
  requiring a reference region. NeuroImage. 2015 Mar 31;108:234-42.
}
\author{
Granville J Matheson, \email{mathesong@gmail.com}
}
