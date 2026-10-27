# Expression Calculator / 表达式计算器

交互式控制台计算器解析“数字 运算符 数字”形式的表达式，支持加、减、乘、除、乘方和取余。

An interactive console calculator parses expressions in the form “number operator number” and supports addition, subtraction, multiplication, division, exponentiation, and remainder.

程序用正则表达式拆分输入，并从运算符到函数的字典中查找运算逻辑。它处理格式错误、非有限数值、除数为零及无法计算的表达式。

A regular expression parses the input, and a dictionary maps each operator to its function. The calculator handles malformed expressions, non-finite numbers, division by zero, and undefined calculations.

```sh
julia expression-calculator/expression_calculator.jl
```

输入 `q`、`quit` 或 `exit` 结束会话。也可单独调用 `calculate_expression`，便于测试和集成。

Enter `q`, `quit`, or `exit` to end the session. `calculate_expression` can also be called directly for testing and integration.
