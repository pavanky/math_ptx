#include "types.h"

#define CAST_BASIC(FN, To, Ti) __device__ To FN(Ti in) { return (To) in; }

#define CAST(T, X)                              \
    CAST_BASIC(___mk##X, T, float)              \
    CAST_BASIC(___mk##X, T, double)             \
    CAST_BASIC(___mk##X, T, int)                \
    CAST_BASIC(___mk##X, T, uint)               \
    CAST_BASIC(___mk##X, T, char)               \
    CAST_BASIC(___mk##X, T, uchar)              \

CAST(float, S)
CAST(double, D)
CAST(int, I)
CAST(uint, U)
CAST(char, J)
CAST(uchar, V)

#define CPLX_BASIC(FN, To, Tr, Ti)              \
    __device__ To FN(Ti in)                     \
    {                                           \
        To out = {(Tr)in, 0};                   \
        return out;                             \
    }                                           \

#define CPLX_CAST(T, Tr, X)                     \
    CPLX_BASIC(___mk##X, T, Tr, float)          \
    CPLX_BASIC(___mk##X, T, Tr, double)         \
    CPLX_BASIC(___mk##X, T, Tr, int)            \
    CPLX_BASIC(___mk##X, T, Tr, uint)           \
    CPLX_BASIC(___mk##X, T, Tr, char)           \
    CPLX_BASIC(___mk##X, T, Tr, uchar)          \

CPLX_CAST(cfloat, float, C)
CPLX_CAST(cdouble, double, Z)


__device__ float ___realC(cfloat in) { return in.x; }
__device__ double ___realZ(cdouble in) { return in.x; }


__device__ float ___imagC(cfloat in) { return 0; }
__device__ double ___imagZ(cdouble in) { return 0; }

__device__ cfloat ___cplxC(float l, float r) { cfloat out = {l, r}; return out; }
__device__ cdouble ___cplxZ(double l, double r) { cdouble out = {l, r}; return out; }
