\name{varComprob}
\alias{varComprob}
\alias{varComprob.fit}

\title{
Fitting variance component models using robust procedures
}
\description{
\code{varComprob} and \code{varComprob.fit} fit linear mixed-effect models where the marginal variance-covariance matrix is linear in known positive semidefinite matrices. \code{varComprob} uses a formula interface, whereas \code{varComprob.fit} is the underlying working horse.
}
\usage{
varComprob(fixed, data, random, groups, varcov, weights, subset,
  family = stats::gaussian("identity"), na.action, offset,
  control = varComprob.control(...), doFit = TRUE,
  normalizeTrace = FALSE, contrasts = NULL,
  model = TRUE, X = TRUE, Y = TRUE, K = TRUE, ...)

varComprob.fit(Y, X, V, control = varComprob.control(), ...)
}

\arguments{
  \item{fixed}{A two-sided formula specifying the fixed effects of the
    model. This is the same as in \code{\link[stats:lm]{stats::lm}}.
  }
  
  \item{data}{An optional data frame, list or environment containing the variables in the model. If not found in data, the variables are taken from \code{environment(fixed)}, typically the environment from which \code{varComprob} is called. This is the same as the \code{data} argument of \code{\link[stats:lm]{stats::lm}}.
  }
  
  \item{random}{This argument is not yet used.}
  
  \item{groups}{a numeric matrix with two columns which is used to group
    appropriately the observations according to subject. See details below
    and the example.
  }

  \item{varcov}{An list of symmetric positive semidefinite matrices. The
    weighted sum of these matrices represent the contribution of random
    effects to the marginal variance of the response variable, with
    unknown weights representing variance components.
  }
  
  \item{weights}{This argument is not yet used.}
  
  \item{subset}{An optional vector specifying a subset of observations
    to be used in the fitting process.}
  
  \item{family}{The same as the \code{family} argument of
  \code{\link[stats:glm]{stats::glm}}. However, only
  \code{gaussian('identity')} is supported currently.}

  \item{na.action}{The same as in \code{\link[stats:lm]{stats::lm}}.}

  \item{offset}{The same as in
  \code{\link[stats:glm]{stats::glm}}. These offsets are assumed as
  known fixed effects.}

  \item{control}{Usually an object from calling \code{\link{varComprob.control}}.}

  \item{doFit}{This argument is not yet used.}

  \item{normalizeTrace}{A logical scalar, indicating whether the
    individual variance-covariance matrices should be normalized such
    that variance components are on the same scale.
  }
  
  \item{contrasts}{The same as in \code{\link[stats:lm]{stats::lm}}.
  }
  
  \item{model}{A logical scalar, indicating whether the model frame will
    be included in the result.
  } 

  \item{X}{For \code{varComprob}, this is a logical scalar, indicating
    whether the fixed-effect design matrix should be included in the
    result. For \code{varComprob.fit} this is the optional numeric array
    containing the fixed effect design matrix for the model, see details
    below. If \code{X}  is missing or an array with zero dimension, it
    is assumed that \code{Y} has zero mean.
  }
  \item{Y}{For \code{varComprob}, this is a logical scalar, indicating
    whether the response variable should be included in the result. For
    \code{varComprob.fit}, this is a numeric matrix of response
    variables. See details below.
  }
  \item{K}{This is a logical scalar, indicating
    whether the list of variance-covariance matrices should be included
    in the result. These matrices are those specified by
    \code{varcov}. See details below.
  }
  \item{V}{This is a numeric array containing the variance-covariance
    matrices. See details below.
  }
  \item{\dots}{When \code{control} is given, this is ignored. Otherwise,
    these arguments are passed to \code{\link{varComprob.control}} and the
    result will be used as the \code{control} argument.
  }
}

\details{The variance component model is of form \deqn{\mathbf{y} =
    \mathbf{X}\boldsymbol{\beta} + \mathbf{e}}{y=X \beta + e} where
    \eqn{\mathbf{e}}{e} is multivariate normally distributed with mean
    zero and variance-covariance matrix \eqn{\mathbf{\Sigma}}{S} being
    \deqn{\mathbf{\Sigma} = \sum_{j=1}^R \sigma_j^2 \mathbf{K}_j +
    \sigma_e^2 \mathbf{I}}{S = sum_{j=1}^R sigma_j^2 K_j + sigma_e^2 I}
in which \eqn{\mathbf{K}_j}{K_j} are known positive semidefinite
    matrices and \eqn{\mathbf{I}}{I} is the identity matrix. 

    In the \code{varComprob} formula interface, the \eqn{\mathbf{X}}{X}
    matrix and response variable are specified by the \code{fixed}
    argument. The \code{varcov} argument specifies each
    variance-covariance matrix in a list. 

    In \code{varComprob.fit}, let \eqn{p}{p} the number of observations,
    \eqn{n}{n} the number of independent replicates and \eqn{k}{k} the number of
    regressors. Then \code{Y} must be a matrix of dimension \eqn{p
    \times n}{p x n}, \code{X} must be an array of dimension \eqn{p
    \times n \times k}{p x n x k} and \code{V} must be an array of
    dimension \eqn{p \times p \times R}{p x p x R}, where \eqn{R}{R} is the number
    of variance-covariance matrices.
       
    The model fitting process is performed by a robust procedures. See
    references for more details.

    See \code{\link{varComprob.control}} for arguments controlling the
    modeling fitting.
  }
\value{The value of any of the two functions is a list with class
  \code{varComprob} or \code{varComprob.fit} respectively.
  The following elements are present in both
  \itemize{
    \item{\code{call}}: the actual call.
    \item{\code{beta}}: a named numeric vector of parameter
    estimates. These are the estimated of the fixed effect parameters. 
    \item{\code{vcov.beta}}: estimated variance-covariance matrix of the
    estimated fixed effects parameters.
    \item{\code{eta}}: a named numeric vector of parameter
    estimates. These are the estimated variance components.
    \item{\code{vcov.eta}}: estimated variance-covariance matrix of the
    estimated random effects variance parameters.
    \item{\code{gamma}}: a named numeric vector of parameter estimates. These are the estimated ratio of each variance component relative to the error variance.
    \item{\code{vcov.gamma}}: estimated variance-covariance matrix of the
    estimated ratio of random effects variance parameters with respect
    the estimated error variance.
    \item{\code{eta0}}: the estimated error variance.
    \item{\code{resid}}: residuals in matrix form \eqn{p \times n}{p x n}.
    \item{\code{weights}}: final weights of the iterative fixed point equations.
    \item{\code{dotweights}}: another type of weight. See references for details.
    \item{\code{Sigma}}: an estimates of the variance-covariance
    marginal matrix.
    \item{\code{scales}}: the scales in case of composite robust
    procedures otherwise \code{NULL}.    
    \item{\code{scale}}: the scale in case of classical robust
    procedures otherwise \code{NULL}.
    \item{\code{min}}: the minimum attains by the goal function.
    \item{\code{scale0}}:
    \item{\code{initial.values}}: a list with the following components:
      \code{beta}: initial value for the fixed parameters;
      \code{gamma}: initial value for the ratio of each variance
      component relative to the error variance;
      \code{eta0}: initial value for the errot variance;
      \code{scales}: initial value for the scales in case of composite
    robust methods otherwise is not available;
      \code{scale}: initial value for the scale in case of classic
     robust methods otherwise is not available.
    \item{\code{iterations}}: number of iterations.   
    \item{\code{control}}: the \code{control} argument. 
    \item{\code{method}}: the robust method used to perform the estimation.  
  }

  The function \code{varComprob} returns also   
  \itemize{
    \item \code{fixed}: the same as \code{beta}.
    \item \code{parms}: the same as \code{gamma}.
    \item \code{sigma2}: the same as \code{eta0}.
    \item \code{nobs}: the number of observations.
    \item \code{na.action}: the \code{na.action} used in the model frame. 
    \item \code{offset}: the same as input. 
    \item \code{contrasts}: the contrast used in the fixed-effect design matrix.
    \item \code{random.labels}: the labels used to differentiate random
  effects. Note that the error variance is not included here. It is safe
  to check the number of variance components specified by the model by
  checking the length of \code{random.labels}.
  }
}
\references{
  C. Agostinelli and V.J. Yohai (2014) Composite Robust Estimators for
  Linear Mixed Models. arXiv:1407.2176.

  M.P. Victoria-Feser and Copt (2006) High Breakdown Inference in the
  Mixed Linear Model. Journal of American Statistical Association, 101,
  292-300.
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

  \dontrun{

  ## Composite S
  OrthodontCompositeS <- varComprob(distance ~ age*Sex, groups = groups,
      data = Orthodont, varcov = K,
      control=varComprob.control(method="compositeS", lower=c(0,-Inf,0)))
  }

  ## Composite Tau
  OrthodontCompositeTau <- varComprob(distance ~ age*Sex, groups = groups,
      data = Orthodont, varcov = K,
      control=varComprob.control(lower=c(0,-Inf,0)))

  \dontrun{

  summary(OrthodontCompositeTau)

  ## Classic S
  OrthodontS <- varComprob(distance ~ age*Sex, groups = groups,
      data = Orthodont, varcov = K,
      control=varComprob.control(lower=c(0,-Inf,0),
      method="S", psi="rocke"))

  summary(OrthodontS)
  }
  \dontrun{

  if (!require(WWGbook))
    stop()
  if (!require(nlme))
    stop()
  data(autism)
  autism <- autism[complete.cases(autism),]
  completi <- table(autism$childid)==5
  completi <- names(completi[completi])
  indici <- as.vector(unlist(sapply(completi,
              function(x) which(autism$childid==x))))
  ind <- rep(FALSE, nrow(autism))
  ind[indici] <- TRUE
  autism <- subset(autism, subset=ind) ## complete cases 41
  attach(autism)
  sicdegp.f <- factor(sicdegp)
  age.f <- factor(age)
  age.2 <- age - 2
  sicdegp2 <- sicdegp
  sicdegp2[sicdegp == 3] <- 0
  sicdegp2[sicdegp == 2] <- 2 
  sicdegp2[sicdegp == 1] <- 1
  sicdegp2.f <- factor(sicdegp2)
  autism.updated <- subset(data.frame(autism, 
                    sicdegp2.f, age.2), !is.na(vsae))
  autism.grouped <- groupedData(vsae ~ age.2 | childid, 
                    data=autism.updated, order.groups = FALSE)
  p <- 5
  n <- 41
  z1 <- rep(1, p)
  z2 <- c(0, 1, 3, 7, 11)
  z3 <- z2^2
  K <- list()
  K[[1]] <- tcrossprod(z1,z1)
  K[[2]] <- tcrossprod(z2,z2)
  K[[3]] <- tcrossprod(z3,z3)
  K[[4]] <- tcrossprod(z1,z2) + tcrossprod(z2,z1)
  K[[5]] <- tcrossprod(z1,z3) + tcrossprod(z3,z1)
  K[[6]] <- tcrossprod(z3,z2) + tcrossprod(z2,z3)
  names(K) <- c("Int", "age", "age2", "Int:age", "Int:age2", "age:age2")

  groups <- cbind(rep(1:p, each=n), rep((1:n), p))

  ## Composite Tau
  AutismCompositeTau <- varComprob(vsae ~ age.2 + I(age.2^2)
    + sicdegp2.f + age.2:sicdegp2.f + I(age.2^2):sicdegp2.f, 
    groups = groups,
    data = autism.grouped, varcov = K,
    control=varComprob.control(
    lower=c(0.01,0.01,0.01,-Inf,-Inf,-Inf)))

  summary(AutismCompositeTau)

  ## Classic S
  AutismS <- varComprob(vsae ~ age.2 + I(age.2^2)
    + sicdegp2.f + age.2:sicdegp2.f + I(age.2^2):sicdegp2.f, 
    groups = groups,
    data = autism.grouped, varcov = K,
    control=varComprob.control(
    method="S", psi="rocke", cov.init="covOGK",
    lower=c(0.01,0.01,0.01,-Inf,-Inf,-Inf)))
  summary(AutismS)
  }
}

\keyword{robust}
\keyword{multivariate}
\keyword{regression}

  %% ## Composite S
  %% AutismCompositeS <- varComprob(vsae ~ age.2 + I(age.2^2)
  %%   + sicdegp2.f + age.2:sicdegp2.f + I(age.2^2):sicdegp2.f, 
  %%   groups = groups,
  %%   data = autism.grouped, varcov = K,
  %%   control=varComprob.control(
  %%     method="compositeS",
  %%     lower=c(0.01,0.01,0.01,-Inf,-Inf,-Inf)))

