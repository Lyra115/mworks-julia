"""
Return a descending-sorted copy of values using selection sort.
The input collection is not modified.
"""
function selection_sort_descending(values)
    result = collect(values)
    n = length(result)
    for i in 1:(n - 1)
        largest = i
        for j in (i + 1):n
            if result[j] > result[largest]
                largest = j
            end
        end
        result[i], result[largest] = result[largest], result[i]
    end
    return result
end

function main()
    values = [64, 25, 12, 22, 11, 90, 3, 47]
    println("Input:  $values")
    println("Sorted: $(selection_sort_descending(values))")
    println("Input unchanged: $(values == [64, 25, 12, 22, 11, 90, 3, 47])")
    println("Range example: $(selection_sort_descending(1:6))")
    words = ["banana", "apple", "cherry"]
    println("Strings: $(selection_sort_descending(words))")
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
