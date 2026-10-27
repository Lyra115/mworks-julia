"""Return whether a nonnegative integer equals the sum of its cubed digits."""
function is_narcissistic_number(n::Integer)
    n >= 0 || return false
    return sum(digit^3 for digit in digits(n)) == n
end

"""List all three-digit narcissistic numbers."""
find_narcissistic_numbers() = [n for n in 100:999 if is_narcissistic_number(n)]

function narcissistic_equation(n::Integer)
    is_narcissistic_number(n) || throw(ArgumentError("$n is not a narcissistic number"))
    terms = join(["$(digit)^3" for digit in reverse(digits(n))], " + ")
    return "$n = $terms"
end

function main()
    numbers = find_narcissistic_numbers()
    println("Three-digit narcissistic numbers: $(join(numbers, ", "))")
    foreach(number -> println(narcissistic_equation(number)), numbers)
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
