# Numeric Operations Explorer / 数值运算演示

该交互式控制台程序对比 Julia 整数、浮点数、复数与有理数的算术行为。

This interactive console program compares arithmetic across Julia integers, floating-point values, complex numbers, and rational values.

从仓库根目录运行 `julia numeric-types/numeric_operations.jl`。按提示输入两组整数、浮点数、复数实部与虚部，以及有理数分子和分母；成对值用空格分隔。

Run `julia numeric-types/numeric_operations.jl` from the repository root. Enter two integers, floating-point values, the real and imaginary parts of two complex values, and numerators and denominators for two rational values. Separate paired values with spaces.

程序展示加、减、乘、除，并说明整数与浮点余数，以及 `-10 % 3` 和 `10 % -3` 的符号语义。Julia 的 `/` 执行除法而非整数截断；`//` 可保留有理数精确分数，浮点运算则可能显示表示误差。

The program displays addition, subtraction, multiplication, and division, along with integer and floating-point remainders and the signed cases `-10 % 3` and `10 % -3`. Julia's `/` performs division rather than integer truncation; `//` preserves exact rational fractions, while floating-point arithmetic can show representation error.

程序要求输入符合提示格式。正常演示请使用非零除数和有理数分母；格式错误不会进入重试循环。

Input must match the requested shape. Use nonzero divisors and rational denominators for a normal demonstration; malformed input is not retried.
