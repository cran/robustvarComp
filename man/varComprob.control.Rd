\name{varComprob.control}
\alias{varComprob.control}
\title{
Tuning Parameters for \code{varComprob()} and Auxiliaries
}
\description{
Tuning Parameters for \code{varComprob()} which performs S, composite S and
Tau estimators for variance component models.
}
\usage{
varComprob.control(init = NULL, lower = 0, upper = Inf, epsilon = 0.001,
  tuning.chi = NULL, bb = 0.5, tuning.psi = NULL,
  arp.chi = 0.1, arp.psi = NULL, max.it = 100,
  rel.tol.beta = 1e-06, rel.tol.gamma = 1e-05, rel.tol.scale = 1e-05,
  trace.lev = 0,
  method = c("compositeTau", "compositeS", "compositeMM",
    "Tau", "S", "MM"),
  psi = c("optimal", "bisquare", "rocke"),
  beta.univ = FALSE, gamma.univ = FALSE,
  fixed.init = c("lmrob.S", "lmRob"),
  cov.init = c("TSGS", "2SGS", "covOGK"),
  cov = TRUE, ...)
}

\arguments{
  \item{init}{A list with initial values. The only components used are
  \code{beta}, \code{gamma}, \code{eta0}, \code{scales} (in case of
  composite methods), \code{scale} (in case of classic methods) and
  \code{Sigma}. If one of the components is empty a suitable automatic
  initial values is calculated.    
  }
  \item{lower}{A numeric vector with length equals to \code{gamma}. This
  parameter is passed to the \code{optim} function.
  }
  \item{upper}{A numeric vector with length equals to \code{gamma}. This
  parameter is passed to the \code{optim} function.
  }
  \item{epsilon}{A positive numeric scalar. This value is set to the non
  negative elements of \code{gamma} (checked by \code{lower}) when the
  automatic initial values are negative. 
  }
  \item{tuning.chi}{tuning constant vector for the rho_1 function. If
  \code{NULL}, as by default, this is set, depending on "psi" (for now only
  "bisquare" and "optimal"), to a suitable value.
}
  \item{bb}{expected value under the normal model of the rho function
    with tuning constant equal to \code{tuning.chi}.
  }
  \item{tuning.psi}{tuning constant vector for the rho_2 function. If
  \code{NULL}, as by default, this is set, depending on "psi" (for now only
  "bisquare" and "optimal"), to a suitable value.
  }
  \item{arp.chi}{tuning constant vector for the rho_1 function in case
    \code{psi} is set to "rocke".
  }
  \item{arp.psi}{tuning constant vector for the rho_2 function in case
    \code{psi} is set to "rocke".
  }
  \item{max.it}{integer specifying the maximum number of IRWLS
    iterations.
  }
  \item{rel.tol.beta}{(for the RWLS iterations algorithm of the fixed
    parameters): relative convergence tolerance for the parameter vector.
  }
  \item{rel.tol.gamma}{(for the \code{optim} function used in the
    estimation procedure of the random variance parameters): relative
    convergence tolerance for the parameter vector.
  }
  \item{rel.tol.scale}{relative convergence tolerance for the scale
    vector.
  }
  \item{trace.lev}{integer indicating if the progress of the algorithm
    should be traced (increasingly); default 'trace.lev = 0' does
    no tracing.
  }
  \item{method}{string specifying the estimator-chain. For now available
          procedures are 'compositeS', 'compositeTau' and 'S'. Default
          is set to 'compositeTau'.
  }
  \item{psi}{string specifying the type psi-function used. Available
    choices for the composite methods are "bisquare" and "optimal". For
    classic methods "rocke", "bisquare" and "optimal".
    Defaut is set to "optimal".
  }
  \item{beta.univ}{logical. If \code{TRUE} a robust simple regression is
    performed for each explanatory variable in order to get starting
    values for the fixed effect parameters.
  }
  \item{gamma.univ}{logical. If \code{TRUE} a simple regression is
    performed for each explanatory variable in order to get starting
    values for the random variance parameters.
  }
  \item{fixed.init}{string with function name to be used to calculate
    initial value of the fixed effect parameters. Possible values are
    "lmrob.S" and "lmRob".    
  }
  \item{cov.init}{function or string with function name to be used to calculate
          initial covariance matrix estimate if necessary. Possible string
          value is "TSGS", "2SGS" and "covOGK". Default is
          set to "TSGS".
  }
  \item{cov}{logical. If \code{TRUE} the estimated variance-covariance
          matrix for the fixed and random parameters is reported.
  }
  \item{\dots}{further arguments.}
}

\value{returns a named 'list' with over twenty components, corresponding
  to the arguments.
}

\author{
  Claudio Agostinelli and Victor J. Yohai
}

\examples{
   ## Show the default settings:
     str(varComprob.control())
}

\keyword{robust}
\keyword{multivariate}
\keyword{regression}
