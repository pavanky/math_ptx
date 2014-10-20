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


MATH(exp)
MATH(expm1)
MATH(erf)
MATH(erfc)

MATH(log)
MATH(log10)
MATH(log1p)

MATH(sqrt)
MATH(cbrt)

#define MATH2_BASIC(fn, T)                      \
    __device__ T ___##fn(T a, T b)              \
    {                                           \
        return fn##f((float)a, (float)b);       \
    }                                           \

#define MATH2(fn)                                   \
    MATH2_BASIC(fn, float)                          \
    MATH2_BASIC(fn, int)                            \
    MATH2_BASIC(fn, uint)                           \
    MATH2_BASIC(fn, char)                           \
    MATH2_BASIC(fn, uchar)                          \
    __device__ double ___##fn(double a, double b)   \
    {                                               \
        return fn(a, b);                            \
    }                                               \

MATH2(pow)
