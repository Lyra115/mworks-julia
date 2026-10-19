"""
    neighbor_average_update(matrix::AbstractMatrix{<:Real})

Return Float64 values equal to each original cell plus the mean of its
existing orthogonal neighbors. Read only from the input matrix.
A cell with no neighbors (a 1 x 1 matrix) retains its original value.
"""
function neighbor_average_update(matrix::AbstractMatrix{<:Real})
    rows, columns = size(matrix)
    result = similar(matrix, Float64)
    for i in 1:rows, j in 1:columns
        total = 0.0
        count = 0
        if i > 1; total += matrix[i-1, j]; count += 1; end
        if i < rows; total += matrix[i+1, j]; count += 1; end
        if j > 1; total += matrix[i, j-1]; count += 1; end
        if j < columns; total += matrix[i, j+1]; count += 1; end
        result[i, j] = matrix[i, j] + (count == 0 ? 0.0 : total / count)
    end
    return result
end

if abspath(PROGRAM_FILE) == @__FILE__
    matrix = [1 2; 3 4]
    println("Original matrix:")
    display(matrix)
    println("Updated matrix:")
    display(neighbor_average_update(matrix))
end
