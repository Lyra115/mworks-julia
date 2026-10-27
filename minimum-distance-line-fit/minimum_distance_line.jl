using Printf

"""Return the sum of perpendicular distances to the line n⋅p = offset."""
function total_distance(points, theta::Real, offset::Real)
    nx, ny = cos(theta), sin(theta)
    return sum(abs(nx * point[1] + ny * point[2] - offset) for point in points)
end

function projection_median(points, theta)
    projections = sort([cos(theta) * point[1] + sin(theta) * point[2] for point in points])
    n = length(projections)
    if isodd(n)
        return projections[(n + 1) ÷ 2]
    end
    return (projections[n ÷ 2] + projections[n ÷ 2 + 1]) / 2
end

function orientation_breakpoints(points)
    breaks = Float64[0.0, Float64(π)]
    n = length(points)
    for i in 1:(n - 1), j in (i + 1):n
        dx = points[i][1] - points[j][1]
        dy = points[i][2] - points[j][2]
        (iszero(dx) && iszero(dy)) && continue
        theta = mod(atan(dy, dx) + π / 2, π)
        theta > 1e-12 && theta < π - 1e-12 && push!(breaks, theta)
    end
    sort!(breaks)

    unique_breaks = Float64[]
    for theta in breaks
        if isempty(unique_breaks) || theta - last(unique_breaks) > 1e-12
            push!(unique_breaks, theta)
        end
    end
    return unique_breaks
end

"""
Find a line minimizing the total perpendicular distance to the points.

The line is represented as cos(theta)*x + sin(theta)*y = offset. Projection
order changes only at pairwise tie angles. Between ties the objective is
A*cos(theta) + B*sin(theta), so interval boundaries and stationary points
form a complete candidate set for the global minimum.
"""
function best_fit_line(points)
    n = length(points)
    n > 0 || throw(ArgumentError("At least one point is required."))
    all(point -> length(point) == 2 && all(isfinite, point), points) ||
        throw(ArgumentError("Points must contain two finite coordinates."))

    breaks = orientation_breakpoints(points)
    candidates = copy(@view breaks[1:end-1])

    for interval in 1:(length(breaks) - 1)
        left, right = breaks[interval], breaks[interval + 1]
        right - left > 1e-12 || continue
        midpoint = (left + right) / 2
        order = sort(collect(1:n), by=i -> (cos(midpoint) * points[i][1] + sin(midpoint) * points[i][2], i))
        ax, by = 0.0, 0.0

        if isodd(n)
            median_index = (n + 1) ÷ 2
            for rank in 1:n
                rank == median_index && continue
                sign = rank < median_index ? -1.0 : 1.0
                ax += sign * points[order[rank]][1]
                by += sign * points[order[rank]][2]
            end
        else
            half = n ÷ 2
            for rank in 1:n
                sign = rank <= half ? -1.0 : 1.0
                ax += sign * points[order[rank]][1]
                by += sign * points[order[rank]][2]
            end
        end

        stationary = atan(by, ax)
        for theta in (stationary - π, stationary, stationary + π)
            left + 1e-12 < theta < right - 1e-12 && push!(candidates, theta)
        end
    end

    best_theta = first(candidates)
    best_offset = projection_median(points, best_theta)
    best_sum = total_distance(points, best_theta, best_offset)
    for theta in Iterators.drop(candidates, 1)
        offset = projection_median(points, theta)
        distance = total_distance(points, theta, offset)
        if distance < best_sum
            best_theta, best_offset, best_sum = theta, offset, distance
        end
    end

    normal = (cos(best_theta), sin(best_theta))
    slope = abs(normal[2]) < 1e-10 ? nothing : -normal[1] / normal[2]
    intercept = slope === nothing ? nothing : best_offset / normal[2]
    return (theta=best_theta, normal=normal, offset=best_offset,
            total_distance=best_sum, slope=slope, intercept=intercept)
end

function equation_string(fit)
    if fit.slope === nothing
        return @sprintf("x = %.4f", fit.offset / fit.normal[1])
    end
    sign = fit.intercept >= 0 ? "+" : "-"
    return @sprintf("y = %.4f x %s %.4f", fit.slope, sign, abs(fit.intercept))
end

"""Return ordinary least-squares slope and intercept for nonvertical data."""
function least_squares_line(points)
    n = length(points)
    n >= 2 || throw(ArgumentError("At least two points are required."))
    sx = sum(point[1] for point in points)
    sy = sum(point[2] for point in points)
    sxx = sum(point[1]^2 for point in points)
    sxy = sum(point[1] * point[2] for point in points)
    denominator = n * sxx - sx^2
    iszero(denominator) && throw(ArgumentError("A vertical dataset has no finite least-squares slope."))
    slope = (n * sxy - sx * sy) / denominator
    intercept = (sy - slope * sx) / n
    return slope, intercept
end

function main()
    points = [(Float64(i), 2.0 * i + 1) for i in 0:9]
    push!(points, (10.0, 40.0))
    fit = best_fit_line(points)
    println("Minimum-distance fit: ", equation_string(fit))
    println(@sprintf("Sum of perpendicular distances: %.4f", fit.total_distance))

    slope, intercept = least_squares_line(points)
    theta = atan(1.0, -slope)
    offset = intercept / sqrt(1 + slope^2)
    println(@sprintf("Least-squares line: y = %.4f x %+.4f", slope, intercept))
    println(@sprintf("Least-squares perpendicular-distance sum: %.4f",
                     total_distance(points, theta, offset)))
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
