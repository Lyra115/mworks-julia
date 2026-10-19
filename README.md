# MWORKS Julia Projects

面向实际编程场景的 Julia 控制台应用与数值工具集合，涵盖文本分析、矩阵变换、数值计算、随机模拟和交互式游戏。项目使用 Julia Base 与标准库，可在 Julia 1.10 或兼容的 MWORKS.Syslab 环境中运行。

A portfolio of Julia console applications and numerical utilities covering text analysis, matrix transformations, numerical computing, random simulation, and interactive games. The projects use Julia Base and standard libraries and run on Julia 1.10 or a compatible MWORKS.Syslab environment.

## Projects / 项目

| Directory / 目录 | Application / 项目 | Focus / 技术重点 |
| --- | --- | --- |
| [numeric-types](numeric-types/) | Numeric operations explorer / 数值运算演示 | Integer, floating-point, complex, and rational arithmetic / 整数、浮点、复数与有理数运算 |
| [text-analysis](text-analysis/) | Character mentions and word frequency / 人物关键词与词频分析 | UTF-8 text, dictionaries, deterministic ranking, overlapping aliases / UTF-8 文本、字典、稳定排序与别名重叠处理 |
| [matrix-processing](matrix-processing/) | Matrix normalization and neighborhood updates / 矩阵归一化与邻域更新 | Views, broadcasting, in-place mutation, boundary handling / 视图、广播、原地修改与边界处理 |
| [number-guessing-game](number-guessing-game/) | Multi-difficulty guessing game / 多难度猜数游戏 | Input validation, round state, history, session statistics / 输入校验、回合状态、历史记录与统计 |
| [card-dealing-simulator](card-dealing-simulator/) | Three-player card dealing / 三人扑克牌洗牌与发牌 | Fisher–Yates shuffle, array slicing, set-based integrity checks / Fisher–Yates 洗牌、数组切片与集合完整性校验 |
| [rock-paper-scissors](rock-paper-scissors/) | Random game simulation / 石头剪刀布随机模拟 | Outcome logic, injectable random generator, aggregate statistics / 胜负判定、可注入随机数生成器与汇总统计 |
| [data](data/) | UTF-8 text corpora / UTF-8 文本语料 | Edition provenance and integrity checksums / 版本来源与完整性校验 |
| [docs](docs/) | Technical notes / 技术说明 | Runtime, implementation choices, and validation / 运行环境、实现选择与验证结果 |

## Run / 运行

在仓库根目录运行以下脚本，无需安装额外包：

Run these scripts from the repository root. No additional packages are required:

```sh
julia numeric-types/numeric_operations.jl
julia text-analysis/character_mentions.jl
julia text-analysis/word_frequency.jl
julia matrix-processing/column_normalization.jl
julia matrix-processing/neighbor_average_update.jl
julia number-guessing-game/number_guessing_game.jl
julia card-dealing-simulator/poker_dealing_simulator.jl
julia rock-paper-scissors/rock_paper_scissors_simulation.jl
```

在 Syslab 中可直接运行脚本；需要交互式入口时，也可以先 `include` 文件再调用 `main()`。不同交互程序建议分别运行，以避免同名入口互相覆盖。

Scripts can also be run in Syslab. For an include-based workflow, include a script and call `main()` for interactive applications. Run separate interactive programs in separate sessions or modules because some entry points share a name.

## Verification / 验证

```sh
julia test/runtests.jl
```

测试覆盖矩阵边界与修改语义、文本别名和词频、游戏输入校验、数值表示、扑克牌完整发牌，以及石头剪刀布胜负和模拟统计。完整结果见[验证说明](docs/validation.md)。

The suite covers matrix boundaries and mutation semantics, text aliases and word counts, game input validation, numeric representations, complete card dealing, and rock-paper-scissors outcomes and simulation totals. See the [validation notes](docs/validation.md) for details.

## Scope / 项目范围

这些脚本是小型控制台应用和数值示例。文本难度判断采用明确的启发式阈值；人物统计基于配置的关键词，不做语义指代消解；游戏记录只保存在当前会话中。随机模拟支持注入随机数生成器，便于复现测试结果。

These scripts are focused console applications and numerical examples. Text difficulty uses explicit heuristic thresholds; character counts match configured keywords without semantic coreference resolution; game records remain session-local. Random simulations accept an injected random generator for reproducible tests.
