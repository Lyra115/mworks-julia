# Narcissistic Numbers / 水仙花数

该项目识别三位水仙花数：一个三位整数等于其每位数字立方之和，并以算式展示结果。

This project identifies three-digit narcissistic numbers, where the number equals the sum of the cubes of its digits, and formats each result as an equation.

```sh
julia narcissistic-numbers/narcissistic_numbers.jl
```

搜索范围为 100 到 999，结果为 153、370、371 和 407。数字分解使用 Julia 的 `digits` 函数。

The search covers 100 through 999 and returns 153, 370, 371, and 407. Digit decomposition uses Julia's `digits` function.
