# Number Guessing Game / 猜数游戏

一个支持三种难度区间的交互式控制台游戏：1–50、1–100 和 1–500。每局允许七次有效猜测，并提示答案偏大或偏小。

An interactive console game with three difficulty ranges: 1–50, 1–100, and 1–500. Each round allows seven valid guesses and reports whether each guess is too high or too low.

程序会校验数字输入，错误输入不扣除机会；每局历史保存在数组中，胜场、平均尝试次数及各难度的最佳记录保存在字典中。玩家可以连续开始多局并查看本次会话汇总。

The program validates numeric input without charging invalid attempts. Each round's history is stored in an array, while wins, average attempts, and a separate best record for each difficulty are tracked in dictionaries. Players can continue across rounds and inspect a session summary.

```sh
julia number-guessing-game/number_guessing_game.jl
```

选择难度并输入范围内的猜测；程序提示后用 `y` 或 `n` 选择是否继续。记录只在内存中保存，重启后清空。

Choose a difficulty and enter guesses within its range. Use `y` or `n` when asked whether to continue. Records live in memory and reset on restart.

七次机会在所有难度中固定，因此 1–500 区间不保证即使采用最优缩小范围策略也能猜中。难度选项索引由配置表长度决定，扩展难度时无需更改输入上限。

The seven-attempt limit is fixed across difficulties, so success in the 1–500 range is not guaranteed even with optimal narrowing. Difficulty selection is derived from the table length, so adding a range does not require changing the numeric input bound.
