#include "types.h"

#define LOGIC_BASIC(fn, op, T)                  \
    __device__ bool ___##fn(T a, T b)           \
    {                                           \
        return a op b;                          \
    }                                           \


#define LOGIC(fn, op)                               \
    LOGIC_BASIC(fn, op, float)                      \
    LOGIC_BASIC(fn, op, double)                     \
    LOGIC_BASIC(fn, op, int)                        \
    LOGIC_BASIC(fn, op, uint)                       \
    LOGIC_BASIC(fn, op, char)                       \
    LOGIC_BASIC(fn, op, uchar)                      \
                                                    \
    __device__ bool ___##fn(cfloat a, cfloat b)     \
    {                                               \
        return cabs2(a) op cabs2(b);                \
    }                                               \
                                                    \
    __device__ bool ___##fn(cdouble a, cdouble b)   \
    {                                               \
        return cabs2(a) op cabs2(b);                \
    }                                               \

LOGIC(lt, <)
LOGIC(gt, >)
LOGIC(le, <=)
LOGIC(ge, >=)

#define LOGIC_EQ(fn, op, op2)                       \
    LOGIC_BASIC(fn, op, float)                      \
    LOGIC_BASIC(fn, op, double)                     \
    LOGIC_BASIC(fn, op, int)                        \
    LOGIC_BASIC(fn, op, uint)                       \
    LOGIC_BASIC(fn, op, char)                       \
    LOGIC_BASIC(fn, op, uchar)                      \
                                                    \
    __device__ bool ___##fn(cfloat a, cfloat b)     \
    {                                               \
        return (a.x op b.x) op2 (a.y op b.y);       \
    }                                               \
                                                    \
    __device__ bool ___##fn(cdouble a, cdouble b)   \
    {                                               \
        return (a.x op b.x) op2 (a.y op b.y);       \
    }                                               \

LOGIC_EQ(eq, ==, &&)
LOGIC_EQ(neq, !=, ||)
