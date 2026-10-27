"""Return whether n is prime using trial division up to isqrt(n)."""
function is_prime(n::Integer)
    n < 2 && return false
    n == 2 && return true
    iseven(n) && return false
    for divisor in 3:2:isqrt(n)
        n % divisor == 0 && return false
    end
    return true
end

"""Return all primes less than or equal to n."""
primes_up_to(n::Integer) = [value for value in 2:n if is_prime(value)]

function main()
    primes = primes_up_to(100)
    println("Primes up to 100 ($(length(primes))): $(join(primes, ", "))")
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
