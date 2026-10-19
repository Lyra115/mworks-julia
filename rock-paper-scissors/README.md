# Rock-Paper-Scissors Simulation / 石头剪刀布模拟

该控制台程序随机模拟 10,000 局石头剪刀布，并输出玩家胜、电脑胜和平局的数量与比例。

This console program simulates 10,000 random rounds of rock-paper-scissors and reports player wins, computer wins, draws, and their percentages.

## Implementation / 实现

`round_result`将单局判断与模拟流程分开，返回 `:player`、`:computer` 或 `:draw`。未知选项与负局数会显式报错。批量模拟函数接受随机数生成器，可使用固定种子进行可复现测试。

`round_result` separates single-round outcome logic from the simulation and returns `:player`, `:computer`, or `:draw`. Unknown choices and negative round counts raise explicit errors. The batch simulator accepts a random number generator, allowing reproducible tests with a fixed seed.

当双方从三种手势中独立等概率随机选择时，三种结果的理论概率均约为三分之一。有限局数下的观测比例会因随机波动而变化。

When both players independently choose among three gestures with equal probability, each outcome has a theoretical probability of about one third. Observed percentages vary due to random sampling.

## Run / 运行

```sh
julia rock-paper-scissors/rock_paper_scissors_simulation.jl
```

无需第三方依赖。测试覆盖三种胜负关系、非法选项处理、随机模拟总局数与非法局数处理。

No third-party dependencies are required. Tests cover the three outcome types, invalid choices, aggregate round counts, and invalid round counts.
