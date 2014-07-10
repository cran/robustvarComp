#include <R.h>
#include <Rmath.h>

void F77_SUB(qnorm5)(double *p, double *mu, double *sigma, int *lower_tail, int *log_p, double *q) {
  *q = qnorm5(*p, *mu, *sigma, *lower_tail, *log_p);
}

void F77_SUB(dqchisq)(double *p, double *df, int *lower_tail, int *log_p, double *q) {
  *q = qchisq(*p, *df, *lower_tail, *log_p);
}
