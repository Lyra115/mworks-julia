"""
    normalize_matrix!(matrix::AbstractMatrix{<:AbstractFloat})

Scale each column to [0, 1] in place. Constant columns become zero.
Use floating-point storage because non-integral values cannot be stored in Int arrays.
"""
function normalize_matrix!(matrix::AbstractMatrix{T}) where {T<:AbstractFloat}
    for j in axes(matrix, 2)
        column = @view matrix[:, j]
        isempty(column) && continue
        low, high = extrema(column)
        if low == high
            column .= zero(T)
        else
            column .= (column .- low) ./ (high - low)
        end
    end
    return matrix
end

if abspath(PROGRAM_FILE) == @__FILE__
    matrix = [1.0 5.0; 2.0 5.0; 3.0 5.0]
    println("Column-normalized matrix:")
    display(normalize_matrix!(matrix))
end
