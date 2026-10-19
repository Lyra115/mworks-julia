# Implementation Decisions / 实现说明

## Numeric representations / 数值表示

数值演示对比整数、浮点数、复数和有理数运算。显式构造与解析让输入类型保持清楚；示例用于说明运算语义，不构成精度基准。

The numeric explorer compares integer, floating-point, complex, and rational arithmetic. Explicit construction and parsing keep input types visible. Examples explain arithmetic semantics and are not accuracy benchmarks.

## Text statistics / 文本统计

英文词频分析用字典计数，并以词频降序、字母序作为稳定的并列排序规则。处理范围有意保持简单：读取一行 ASCII 英文文本，不移除停用词，难度标签采用启发式阈值。

The English word analyzer counts with a dictionary and uses descending frequency followed by alphabetical order for stable ties. Its scope is deliberately small: one line of ASCII English, no stop-word removal, and heuristic difficulty thresholds.

人物别名可能彼此包含。程序保留每个别名的原始匹配数，同时通过最长优先的正则分支计算每组别名的非重叠总数，避免同一文本片段被长短别名重复累计。它支持部分简繁体形式，但不做代词或语义指代识别。

Character aliases may contain one another. The program retains raw counts per alias and uses longest-first matching for a non-overlapping total within each alias group. This avoids counting the same text span through both a long and nested short alias. Selected traditional forms are supported, but pronouns and semantic references are not resolved.

## Matrix transformations / 矩阵变换

列归一化使用列视图和融合广播原地写回；常量列结果设为零，空列跳过。输入需为浮点矩阵，且 NaN 与无穷值不会自动清理。

Column normalization uses column views and fused broadcast assignment to mutate storage in place. Constant columns become zero and empty columns are skipped. Input must be floating point; NaN and infinity are not sanitized.

邻域更新从原矩阵读取上下左右的有效邻居，并写入单独的 Float64 矩阵，避免遍历顺序影响结果。1×1 矩阵没有邻居，因此原值保留。

The neighborhood update reads existing up, down, left, and right neighbors from the original matrix and writes to separate Float64 storage, avoiding order-dependent results. A 1×1 matrix has no neighbors, so its value is retained.

## Console and simulations / 控制台应用与模拟

猜数游戏将输入校验、难度选择、单局流程和会话统计分开处理。无效输入不消耗猜测次数，记录按难度分别保存于内存。

The guessing game separates input validation, difficulty selection, round flow, and session statistics. Invalid input does not consume an attempt, and records are kept in memory by difficulty.

扑克牌模拟使用不可变元组表示单张牌、数组存放牌堆与手牌、Fisher–Yates 原地洗牌，并用集合比较验证 54 张牌完整且无重复。石头剪刀布模拟将单局胜负规则与批量模拟分离，接受可注入随机数生成器，便于稳定测试。

The card simulator represents each card as an immutable tuple, stores decks and hands in arrays, shuffles in place with Fisher–Yates, and uses sets to verify a complete, duplicate-free 54-card deal. Rock-paper-scissors separates round outcomes from batch simulation and accepts an injected RNG for repeatable tests.

文件名描述功能而非编号。交互入口通过 `abspath(PROGRAM_FILE) == @__FILE__` 保护，因此包含脚本用于测试不会自动启动输入循环。

Filenames describe behavior rather than sequence numbers. Interactive entry points use an `abspath(PROGRAM_FILE) == @__FILE__` guard, so including a script for tests does not start an input loop.
