# MWORKS Julia Projects

面向实际编程场景的 Julia 控制台应用与数值工具，涵盖文本分析、矩阵处理、数值计算、交互式游戏和算法模拟。项目说明提供中英文双版，代码使用 Julia Base 与标准库。

A portfolio of Julia console applications and numerical utilities for text analysis, matrix processing, numerical computing, interactive games, and algorithmic simulations. Project guides are bilingual and the code uses Julia Base and standard libraries.

## Projects / 项目

| Directory / 目录 | Application / 项目 | Focus / 技术重点 |
| --- | --- | --- |
| [numeric-types](numeric-types/) | Numeric operations / 数值运算 | Integer, floating-point, complex, and rational arithmetic / 整数、浮点、复数与有理数 |
| [text-analysis](text-analysis/) | Text analysis / 文本分析 | UTF-8 corpora, aliases, tokenization, and frequency counts / UTF-8 语料、别名、分词与词频 |
| [matrix-processing](matrix-processing/) | Matrix transformations / 矩阵变换 | Views, broadcasting, boundaries, and mutation / 视图、广播、边界与原地修改 |
| [number-guessing-game](number-guessing-game/) | Guessing game / 猜数游戏 | Input validation and session state / 输入校验与会话状态 |
| [card-dealing-simulator](card-dealing-simulator/) | Card dealing / 扑克牌发牌 | Fisher–Yates shuffle and set-based validation / Fisher–Yates 洗牌与集合校验 |
| [rock-paper-scissors](rock-paper-scissors/) | Random game simulation / 随机游戏模拟 | Outcome logic and reproducible simulations / 胜负判定与可复现模拟 |
| [prime-number-tool](prime-number-tool/) | Prime analysis / 素数分析 | Trial division bounded by √n / 截止至 √n 的试除法 |
| [narcissistic-numbers](narcissistic-numbers/) | Narcissistic numbers / 水仙花数 | Digit decomposition and aggregation / 数位分解与求和 |
| [descending-selection-sort](descending-selection-sort/) | Descending selection sort / 降序选择排序 | Selection sort and copy semantics / 选择排序与复制语义 |
| [expression-calculator](expression-calculator/) | Expression calculator / 表达式计算器 | Regex parsing and function dispatch / 正则解析与函数分派 |
| [minimum-distance-line-fit](minimum-distance-line-fit/) | Minimum-distance line fit / 最小垂直距离直线拟合 | Piecewise orientation search / 分段方向搜索 |
| [data](data/) | Text corpora / 文本语料 | Edition provenance and checksums / 版本来源与校验和 |
| [docs](docs/) | Technical notes / 技术说明 | Environment, algorithms, and validation / 环境、算法与验证 |

## Run / 运行

在仓库根目录运行各项目 README 中的命令。使用 Julia 1.10 或兼容的 MWORKS.Syslab 运行时，无需安装额外依赖。

Run the commands listed in each project README from the repository root. Use Julia 1.10 or a compatible MWORKS.Syslab runtime; no additional dependencies are required.

## Verification / 验证

```sh
julia test/runtests.jl
```

测试覆盖数值处理、文本分析、矩阵边界、交互输入、牌堆与随机模拟，以及五个函数应用的边界和结果。

The suite covers numeric processing, text analysis, matrix boundaries, interactive input, card and random simulations, and the edge cases and results of the five function-focused projects.
