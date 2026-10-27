const OPERATIONS = Dict{String,Function}(
    "+" => (+), "-" => (-), "*" => (*),
    "/" => (/), "^" => (^), "%" => (%),
)
const EXPRESSION_PATTERN = r"^\s*(-?\d+(?:\.\d+)?)\s*([-+*/^%])\s*(-?\d+(?:\.\d+)?)\s*$"

function format_result(value::Real)
    isfinite(value) || return string(value)
    if isinteger(value) && abs(value) < 1e15
        return string(Int(value))
    end
    return string(round(value; digits=6))
end

"""Evaluate a binary arithmetic expression and return a readable result."""
function calculate_expression(expression::AbstractString)
    matched = match(EXPRESSION_PATTERN, expression)
    matched === nothing && return "Error: enter an expression such as 112 + 3."

    left = parse(Float64, matched.captures[1])
    operator = String(matched.captures[2])
    right = parse(Float64, matched.captures[3])
    (isfinite(left) && isfinite(right)) || return "Error: numbers must be finite."
    (operator in ("/", "%") && iszero(right)) && return "Error: divisor cannot be zero."

    try
        return format_result(OPERATIONS[operator](left, right))
    catch
        return "Error: expression cannot be evaluated."
    end
end

function calculator_loop(input::IO=stdin, output::IO=stdout)
    println(output, "Expression calculator (+ - * / ^ %; enter q to quit)")
    while true
        print(output, "Expression: ")
        flush(output)
        eof(input) && break
        expression = strip(readline(input))
        lowercase(expression) in ("q", "quit", "exit") && break
        println(output, "Result: ", calculate_expression(expression))
    end
end

main() = calculator_loop()

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
