\name{summary.varComprob}
\alias{summary.varComprob}

\title{
Summary Method for "varComprob" Objects
}
\description{
  Summary method for \R object of class \code{"varComprob"}.
}
\usage{
  \method{summary}{varComprob}(object, print.outliers = FALSE, ...)
}
\arguments{
  \item{object}{an \R object of class \code{varComprob}, typically created by
    \code{\link{varComprob}}.}
  \item{print.outliers}{logical. If \code{TRUE} three tables are also
    printed, summarizing the presence of cell, couple and row outliers
    in the data set.
  }
  \item{\dots}{potentially more arguments passed to methods.}
}

\value{
  \code{summary(object)} returns an object of S3 class
  \code{"summary.varComprob"}, basically a \code{\link{list}}.
}
\author{
Claudio Agostinelli and Victor J. Yohai
}

\examples{
  if (!require(nlme))
    stop()
  data(Orthodont)

  z1 <- rep(1, 4)
  z2 <- c(8,10,12,14)
  K <- list()
  K[[1]] <- tcrossprod(z1,z1) ## Int
  K[[2]] <- tcrossprod(z1,z2) + tcrossprod(z2,z1) ## Int:age
  K[[3]] <- tcrossprod(z2,z2) ## age
  names(K) <- c("Int", "Int:age", "age")
  p <- 4
  n <- 27
  groups <- cbind(rep(1:p, each=n), rep((1:n), p))

  ## Composite Tau
  OrthodontCompositeTau <- varComprob(distance ~ age*Sex, groups = groups,
    data = Orthodont, varcov = K,
    control=varComprob.control(lower=c(0,-Inf,0)))

  summary(OrthodontCompositeTau, print.outliers=TRUE)
}

\keyword{robust}
\keyword{multivariate}
\keyword{regression}
