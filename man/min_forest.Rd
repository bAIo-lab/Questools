% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/min_forest.R
\name{min_forest}
\alias{min_forest}
\title{construct and visualize a minimal forest based on Chow-Liu algorithm}
\usage{
min_forest(data, stat = "BIC", community = TRUE, betweenness = TRUE,
  plot = FALSE, levels = NULL)
}
\arguments{
\item{data}{A normalized dataframe or matrix with no missing data of continuous and (or) categorical measurements.}

\item{stat}{Measure to be minimized: LR, AIC, or BIC (the default). The default is BIC. It can also be a user-defined function with the format: FUN (model, dataset, previous, forbEdges); where the parameters are defined as in chStat. The function must return a structure as in chStat.}

\item{community}{A logical value to show if the node communities should be detected and colored in the returned graph. (default = TRUE)}

\item{betweenness}{A logical value to show if the node betweenness measurements should be computed and returned from the function. (default = TRUE)}

\item{plot}{A logical value to show if the graph should be plotted. (default = FALSE)}

\item{levels}{An integer value indicating the maximum number of levels of a categorical variable. To be used to distinguish the categorical variable.
Defaults to NULL because it is supposed that \code{data} has been preprocessed using \code{\link[muvis]{data_preproc}} and the categorical variables are specified.
If it is set, first will run \code{\link[muvis]{data_preproc}} to specify categorical and continuous variables.}
}
\value{
a list containing:
\item{significanse}{A data.frame containing edges with p-statistics and p.values.}
\item{summary}{a gRapHD object which is the fit model.}
\item{graph}{an igraph object.}
\item{betweenness}{betweenness measurements of each node.}
\item{network}{a visNetwork plot of the graph.}
\item{communities}{a named vector indicating the community of each node.}
}
\description{
Fits a minimal forest to data and visualizes it.
}
\details{
The function is a wrapper for bnlearn package implementing several algorithms including Constraint-based algorithms (i.e., Max-Min Parents and Children, Semi-Interleaved HITON-PC, and Grow-Shrink), Score-based algorithms (i.e., Hill-Climbing and Tabu Search), and Hybrid algorithms (i.e., Max-Min Hill-Climbing), and Local Discovery algorithms (i.e, Max-Min Parents and Children and ARACNE). If one uses a more than one algorithm, the function combines all of the algorithms and returns a graph based on the combination. The graph is constructed based on the strength of associations calculated by bootstrapping.
}
\examples{
data("NHANES")
## Using raw data
mf <- min_forest(data = NHANES[1:1000, ], stat = "BIC", plot = TRUE, levels = 5)

## Using preprocessed data
data <- data_preproc(NHANES, levels = 15)
mf <- min_forest(data = data[1:1000, ], stat = "BIC", plot = FALSE)

}
\references{
Chow, C.K., and Liu, C.N. (1968) Approximating discrete probability distributions with dependence trees. IEEE Transactions on Information Theory, Vol. IT-14, 3:462-7.

Edwards, D., de Abreu, G.C.G. and Labouriau, R. (2010). Selecting high- dimensional mixed graphical models using minimal AIC or BIC forests. BMC Bioinformatics, 11:18.
}
\author{
Elyas Heidari
}
