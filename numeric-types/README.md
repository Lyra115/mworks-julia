# Numeric Operations Explorer

Compare arithmetic across Julia integers, floating-point values, complex numbers, and rational values using an interactive console script.

Run `julia numeric-types/numeric_operations.jl` from the repository root. Enter two integers, two floating-point values, the real/imaginary parts of two complex numbers, and the numerator/denominator of two rationals when prompted. Pair values are separated by spaces.

The program displays addition, subtraction, multiplication, and division; it also demonstrates integer/floating-point remainders and the signed cases `-10 % 3` and `10 % -3`.

Julia's `/` performs division rather than integer truncation. `%` uses the remainder convention; for nonzero results the sign follows the dividend. Rational values use `//` and preserve exact fractions, while floating-point arithmetic can show representation error.

The script expects numeric input of the requested shape. Use nonzero divisors and rational denominators for a normal demonstration; malformed input is not handled by a retry loop. The code was extracted from the supplied numeric-computation notes and wrapped in an explicit entry point.
