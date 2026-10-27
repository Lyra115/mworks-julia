# Validation Results / 验证结果

截至 2026-10-27，本地使用 MWORKS.Syslab Julia 1.10.10 完成验证。

Validation was completed locally on 2026-10-27 with MWORKS.Syslab Julia 1.10.10.

## Automated tests / 自动化测试

`julia test/runtests.jl` runs thirteen test sets with **87 passing assertions**. Coverage includes matrix boundaries and mutation, text processing, input validation, numeric representations, card dealing, random game simulation, primality, digit-power numbers, selection sort, expression parsing, and minimum-distance line fitting.

运行 `julia test/runtests.jl` 共执行十三组测试、**87 项断言全部通过**。覆盖矩阵边界与修改行为、文本处理、输入校验、数值表示、扑克牌发牌、随机游戏模拟、素数、水仙花数、选择排序、表达式解析及最小距离直线拟合。

## Script checks / 脚本运行

矩阵示例、文本分析、数值运算、猜数游戏及新增随机模拟均在本地运行。游戏秘密值、牌序和模拟统计未固定，因此实际交互输出可能与样例不同。扑克牌校验验证牌堆和发牌集合；石头剪刀布测试使用固定种子并核对总局数。

Matrix examples, text analysis, numeric operations, the guessing game, and the new random simulations were run locally. The game secret, shuffled order, and simulation totals are not fixed, so interactive output can differ from examples. Card-deal checks validate deck and deal sets; rock-paper-scissors tests use a fixed seed and verify the total number of rounds.

## Corpus results / 语料结果

| Character / 人物 | Gutenberg corpus | Alternate corpus |
| --- | ---: | ---: |
| 唐僧 | 2399 | 2545 |
| 孙悟空 | 4759 | 4974 |
| 猪八戒 | 2173 | 2296 |
| 沙僧 | 892 | 938 |

以上为全文件范围内基于配置别名的非重叠关键词总数，不代表语义层面的人物出现次数。原始别名匹配明细可由程序查看。

These are non-overlapping keyword totals for configured aliases across each complete file, not semantic counts of character appearances. Raw per-alias matches are available from the program.

## Limits / 验证范围

验证覆盖已记录的有限数值输入、矩阵边界及指定交互路径，但不证明所有自定义数组类型、任意输入序列或其他 Julia 版本都能正常工作。文本难度阈值尚未通过标注语料校准。

Checks cover the documented finite numeric inputs, matrix boundaries, and selected interaction paths. They do not prove behavior for every custom array type, arbitrary input sequence, or other Julia version. Text difficulty thresholds have not been calibrated against labeled readability data.

## Function-focused projects / 函数应用验证

新增五个测试集覆盖素数边界、水仙花数全集、选择排序输入不变性、计算器格式与除零，以及最小距离直线拟合的共线点、竖直点集、离群点和密集方向扫描对照。Julia 1.10.10 上 13 组测试、87 项断言全部通过。

Five new test sets cover prime boundaries, the complete three-digit narcissistic-number set, selection-sort input preservation, calculator syntax and division by zero, and line-fit behavior for collinear points, vertical data, an outlier, and a dense orientation-scan comparison. All 87 assertions across 13 test sets passed on Julia 1.10.10.
