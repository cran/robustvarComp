#include <R_ext/RS.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* FIXME: 
   Check these declarations against the C/Fortran source code.
*/

/* .Fortran calls */
extern void F77_NAME(doptimch)(void *, void *, void *, void *);
extern void F77_NAME(dospw)(void *, void *, void *, void *, void *, void *, void *, void *);
extern void F77_NAME(dosstep)(void *, void *, void *, void *, void *, void *, void *);
extern void F77_NAME(dosstepr)(void *, void *, void *, void *, void *, void *, void *);
extern void F77_NAME(dotstep)(void *, void *, void *, void *, void *, void *, void *);
extern void F77_NAME(dotstepd)(void *, void *, void *, void *, void *, void *, void *, void *);
extern void F77_NAME(drockech)(void *, void *, void *, void *, void *);
extern void F77_NAME(dtukeych)(void *, void *, void *, void *);
extern void F77_NAME(optimchi)(void *, void *, void *);
extern void F77_NAME(rhospw)(void *, void *, void *, void *, void *, void *, void *);
extern void F77_NAME(rsrf)(void *, void *, void *, void *, void *, void *);
extern void F77_NAME(rsstarr)(void *, void *, void *, void *, void *, void *);
extern void F77_NAME(rvrf)(void *, void *, void *, void *, void *, void *, void *);
extern void F77_NAME(sdetf)(void *, void *, void *, void *);
extern void F77_NAME(soptimch)(void *, void *, void *);
extern void F77_NAME(srockech)(void *, void *, void *, void *);
extern void F77_NAME(stukeych)(void *, void *, void *);
extern void F77_NAME(xsstarx)(void *, void *, void *, void *, void *, void *, void *);
extern void F77_NAME(xsstary)(void *, void *, void *, void *, void *, void *, void *, void *);

static const R_FortranMethodDef FortranEntries[] = {
    {"doptimch", (DL_FUNC) &F77_NAME(doptimch), 4},
    {"dospw",    (DL_FUNC) &F77_NAME(dospw),    8},
    {"dosstep",  (DL_FUNC) &F77_NAME(dosstep),  7},
    {"dosstepr", (DL_FUNC) &F77_NAME(dosstepr), 7},
    {"dotstep",  (DL_FUNC) &F77_NAME(dotstep),  7},
    {"dotstepd", (DL_FUNC) &F77_NAME(dotstepd), 8},
    {"drockech", (DL_FUNC) &F77_NAME(drockech), 5},
    {"dtukeych", (DL_FUNC) &F77_NAME(dtukeych), 4},
    {"optimchi", (DL_FUNC) &F77_NAME(optimchi), 3},
    {"rhospw",   (DL_FUNC) &F77_NAME(rhospw),   7},
    {"rsrf",     (DL_FUNC) &F77_NAME(rsrf),     6},
    {"rsstarr",  (DL_FUNC) &F77_NAME(rsstarr),  6},
    {"rvrf",     (DL_FUNC) &F77_NAME(rvrf),     7},
    {"sdetf",    (DL_FUNC) &F77_NAME(sdetf),    4},
    {"soptimch", (DL_FUNC) &F77_NAME(soptimch), 4},
    {"srockech", (DL_FUNC) &F77_NAME(srockech), 4},
    {"stukeych", (DL_FUNC) &F77_NAME(stukeych), 4},
    {"xsstarx",  (DL_FUNC) &F77_NAME(xsstarx),  7},
    {"xsstary",  (DL_FUNC) &F77_NAME(xsstary),  8},
    {NULL, NULL, 0}
};

void R_init_robustvarComp(DllInfo *dll)
{
    R_registerRoutines(dll, NULL, NULL, FortranEntries, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
