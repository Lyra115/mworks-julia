# Matrix Processing / 矩阵处理

## Column normalization / 按列归一化

`normalize_matrix!` uses `(value - minimum) / (maximum - minimum)` to transform each floating-point column. Constant columns become zero. A column view refers to original storage, and broadcast assignment writes values in place.

`normalize_matrix!`按 `(value - minimum) / (maximum - minimum)` 变换每个浮点列。常量列设为零。列视图引用原矩阵存储，广播赋值会原地写回。

函数接收浮点矩阵，因为一般的归一化结果不能写回整数存储。整数矩阵可先通过 `Float64.(matrix)` 转换。空列跳过；NaN 与无穷值不会自动清理。

The function accepts floating-point matrices because normalized fractions cannot generally be written to integer storage. Convert an integer matrix with `Float64.(matrix)` first. Empty columns are skipped; NaN and infinity are not sanitized.

## Neighbor average update / 邻域均值更新

`neighbor_average_update` 为每个单元格加上其现存上、下、左、右邻居的均值。常规二维矩阵的角点有两个邻居、边缘有三个、内部有四个。单行或单列只使用存在的邻居；1×1 单元格保持不变；空矩阵返回相同形状的空结果。

`neighbor_average_update` adds the mean of each cell's existing up, down, left, and right neighbors. In ordinary 2-D matrices, corners have two neighbors, edges three, and interior cells four. Single rows or columns use only existing neighbors; a 1×1 cell is unchanged; empty matrices return an empty result of the same shape.

函数从原矩阵读取并写入独立的 Float64 存储，避免遍历顺序影响结果。输入使用常规的一基矩阵索引。

The function reads the original matrix and writes to separate Float64 storage, avoiding order-dependent results. It expects conventional one-based matrix indexing.

两个算法的时间复杂度均为 O(rows × columns)。列归一化通过列视图复用原存储；邻域变换额外分配 O(rows × columns) 输出空间。

Both algorithms run in O(rows × columns) time. Column normalization reuses original storage through views; the neighborhood update allocates O(rows × columns) output space.

```sh
julia matrix-processing/column_normalization.jl
julia matrix-processing/neighbor_average_update.jl
```
