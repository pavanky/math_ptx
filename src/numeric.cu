#include "types.h"

#define MATH_BASIC(fn, T)                       \
    __device__ T ___##fn(T a)                   \
    {                                           \
        return fn##f((float)a);                 \
    }                                           \


#define MATH(fn)                                \
    MATH_BASIC(fn, float)                       \
    MATH_BASIC(fn, int)                         \
    MATH_BASIC(fn, uint)                        \
    MATH_BASIC(fn, char)                        \
    MATH_BASIC(fn, uchar)                       \
    __device__ double ___##fn(double a)         \
    {                                           \
        return fn(a);                           \
    }                                           \

MATH(floor)
MATH(ceil)
MATH(round)

MATH(tgamma)
MATH(lgamma)


#define fremf(a, b) remainderf((a), (b))
#define frem(a, b) remainder((a), (b))

#define MATH2_BASIC(fn, T)                      \
    __device__ T ___##fn(T a, T b)              \
    {                                           \
        return f##fn##f((float)a, (float)b);    \
    }                                           \

#define MATH2(fn)                                   \
    MATH2_BASIC(fn, float)                          \
    MATH2_BASIC(fn, int)                            \
    MATH2_BASIC(fn, uint)                           \
    MATH2_BASIC(fn, char)                           \
    MATH2_BASIC(fn, uchar)                          \
    __device__ double ___##fn(double a, double b)   \
    {                                               \
        return f##fn(a, b);                         \
    }                                               \

MATH2(min)
MATH2(max)
MATH2(mod)
MATH2(rem)

#define COMPARE_CPLX(fn, op, T)                 \
    __device__ T ___##fn(T a, T b)              \
    {                                           \
        return cabs2(a) op cabs2(b) ? a : b;    \
    }                                           \

COMPARE_CPLX(min, <, cfloat)
COMPARE_CPLX(min, <, cdouble)
COMPARE_CPLX(max, >, cfloat)
COMPARE_CPLX(max, >, cdouble)
