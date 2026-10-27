# Prime Number Tool / 素数分析工具

该工具判断整数是否为素数，并列出不超过指定上限的全部素数。

This tool checks whether an integer is prime and lists all primes up to a chosen limit.

实现采用试除法：排除小于 2 的整数和偶数后，只检查不超过整数平方根的奇数因子，避免不必要的除法。

The implementation uses trial division. After handling values below 2 and even numbers, it checks only odd divisors up to the integer square root.

```sh
julia prime-number-tool/prime_number_tool.jl
```

时间复杂度为 O(√n)。`is_prime` 可独立复用，`primes_up_to` 则基于该函数构造结果。

The primality check runs in O(√n). `is_prime` is reusable, and `primes_up_to` builds on it.
