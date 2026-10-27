# Minimum-Distance Line Fit / 最小垂直距离直线拟合

该项目寻找一条直线，使给定点到直线的垂直距离总和达到全局最小。直线以单位法向量与偏移量表示，因此也能表达竖直线；非竖直结果可转换为 y = ax + b。

This project finds a line minimizing the sum of perpendicular distances to a set of points. It represents the line with a unit normal and offset, so vertical lines are supported; nonvertical results can be expressed as y = ax + b.

算法按点对确定投影顺序可能改变的方向区间。在每个区间内，目标函数化为 A cos(θ) + B sin(θ)，因此比较区间边界与区间内驻点即可得到全局最小值。

The algorithm partitions orientations at pairwise projection ties. Within each interval, the objective reduces to A cos(θ) + B sin(θ), so comparing interval endpoints and any interior stationary point gives a global minimum.

```sh
julia minimum-distance-line-fit/minimum_distance_line.jl
```

该目标不同于最小二乘的垂直残差平方和。程序计算最小二乘直线作对照；其距离和并非最小二乘所优化的量。方向区间有 O(n²) 个，每个区间对投影排序，时间复杂度为 O(n³ log n)，空间复杂度为 O(n²)。

This objective differs from least squares, which minimizes squared vertical residuals. The program computes a least-squares line for comparison; its distance sum is not what least squares optimizes. There are O(n²) orientation intervals, and each sorts the projections, yielding O(n³ log n) time and O(n²) space.
