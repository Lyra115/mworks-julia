# Matrix Processing

## Column normalization

`normalize_matrix!` transforms each floating-point column with `(value - minimum) / (maximum - minimum)`. Constant columns become zero. A column view refers to the original storage and broadcasting writes values in place.

The function accepts floating-point matrices because general normalized fractions cannot be written back to integer storage. Convert an integer matrix with `Float64.(matrix)` first. Empty columns are skipped. Values should be finite; NaN and infinity are not sanitized.

## Neighbor average update

`neighbor_average_update` returns each cell plus the mean of its existing up/down/left/right neighbors. Corners have two neighbors in ordinary 2-D matrices, edges have three, and interior cells have four. Single rows/columns use only neighbors that exist; a 1×1 cell is unchanged. Empty matrices return an empty result of the same shape.

The function reads only the original matrix and writes into separate Float64 storage, avoiding the order-dependent results of updating the input during traversal. It expects conventional one-based matrix indexing.

Both algorithms take O(rows × columns) time. Normalization reuses the original storage with column views; neighborhood transformation allocates O(rows × columns) output storage.

Run either file directly for a small deterministic example:

```sh
julia matrix-processing/column_normalization.jl
julia matrix-processing/neighbor_average_update.jl
```

The normalization variable-name typo was corrected, and the integer-storage contract and isolated-cell behavior are now explicit.
