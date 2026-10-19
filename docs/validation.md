# Validation Results / 验证结果

截至 2026-10-19，本地使用 MWORKS.Syslab Julia 1.10.10 完成验证。

Validation was completed locally on 2026-10-19 with MWORKS.Syslab Julia 1.10.10.

## Automated tests / 自动化测试

`julia test/runtests.jl` runs eight test sets with **54 passing assertions**. Coverage includes matrix boundaries and mutation, character aliases, word processing, input validation, numeric representations, card generation/shuffling/dealing, and rock-paper-scissors outcomes and aggregate counts.

运行 `julia test/runtests.jl` 共执行八组测试、**54 项断言全部通过**。覆盖矩阵边界与修改行为、人物别名、词频处理、输入校验、数值表示、扑克牌生成/洗牌/发牌，以及石头剪刀布胜负和统计汇总。

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
