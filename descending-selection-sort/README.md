# Descending Selection Sort / 降序选择排序

该项目通过选择排序返回新的降序序列，不修改输入集合；支持数字序列及可比较的字符串序列。

This project implements selection sort to return a new sequence in descending order without modifying the input. It supports numeric sequences and comparable strings.

```sh
julia descending-selection-sort/selection_sort_descending.jl
```

每轮选择未排序部分中的最大元素并放到当前位置。时间复杂度为 O(n²)，返回副本需要 O(n) 额外空间。大规模排序可使用 Julia 内置排序函数。

Each pass selects the largest remaining value and places it at the current position. Time complexity is O(n²), with O(n) extra space for the returned copy. Julia's built-in sort is preferable for large inputs.
