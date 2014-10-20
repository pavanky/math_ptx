math_ptx
=======

Auto generated PTX files for various CUDA Math functions.

This is an alternative to using `libdeivce` when using NVVM IR. The PTX files can be converted to strings and used as required in your repository.

### Contents

- `src/arith.cu`: Basic arithmetic operations (+,-,*,/).
  - Function handles: `add`, `sub`, `div`, `mul`
  - Includes operations on complex numbers

- `src/logic.cu`: Basic logical operations (>, <, >=, <=, ==, !=).
  - Function handles: `gt`, `lt`, `ge`, `le`, `eq`, `neq`
  - Includes operations on complex numbers
  - For complex numbers, `eq` and `neq` check for both real and imaginary values.
  - For complex numbers, everything else checks for absolute values

- `src/numeric.cu`: Numerical operations on numbers
  - Functions included: `min`, `max`, `ceil`, `floor`, `round`, `remainder`, `mod`, `tgamma`, `lgamma`
  - Complex numbers supported for `min`, and `max`. Both functions compare absolute values.

- `src/exp.cu`: Exponential and logarithmic functions
  - Functions included: `exp`, `expm1`, `erf`, `erfc`, `log`, `log10`, `log1p`, `sqrt`, `cbrt`, `pow`
  - Complex numbers not supported

- `src/trig.cu`: Trigonometric functions
  - Functions included: `sin`, `cos`, `tan`, `asin`, `acos`, `atan`
  - Complex numbers not supported

- `src/hyper.cu`: Hyperbolic functions
  - Functions included: `sinh`, `cosh`, `tanh`, `asinh`, `acosh`, `atanh`
  - Complex numbers not supported

- `PTX64/sm_xx/*.ptx`: PTX files for 64 bit systems for compute `sm_xx`

- `PTX32/sm_xx/*.ptx`: PTX files for 32 bit systems for compute `sm_xx`

### Naming scheme

The native name mangling from the auto-generated PTX is changed to something friendlier for string manipulation.

The naming scheme consists of three parts.

- three underscores (common everywhere)
- function name
- a letter denoting each of the input types.
  - `float` is `s`
  - `double` is `d`
  - `cuFloatComplex` is `c` (a.k.a `float2`)
  - `cuDoubleComplex` is `z` (a.k.a `double2`)
  - `int` is `i`
  - `unsigned int` is `u` (a.k.a `uint`)
  - `char` is `j`
  - `unsigned char` is `v` (a.k.a `uchar`)

Sample names:
- `add` on two floating point complex numbers would be: `___addcc`.
- `sin` on a double precision number would be `___sind`
- `max` of two unsigned integers would be `___maxuu`
