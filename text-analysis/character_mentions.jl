"""Read an existing UTF-8 corpus without depending on the working directory."""
function load_text(path::AbstractString)
    text = read(path, String)
    isvalid(text) || throw(ArgumentError("Corpus must be UTF-8 encoded."))
    return text
end

# Include simplified and traditional variants; there is no automatic script conversion.
const CHARACTERS = [
    "唐僧" => ["唐僧", "唐三藏", "三藏", "玄奘"],
    "孙悟空" => ["孙悟空", "孫悟空", "孙行者", "孫行者", "美猴王", "悟空", "行者"],
    "猪八戒" => ["猪八戒", "豬八戒", "猪悟能", "豬悟能", "八戒", "呆子", "獃子"],
    "沙僧" => ["沙僧", "沙和尚", "沙悟净", "沙悟淨"],
]

"""
    count_character(text, aliases)

Return (nonoverlapping_total, raw_alias_counts). Raw counts may overlap across
aliases; the total uses longest-first alternatives so a longer name is not
counted again as a nested shorter alias. Aliases here are literal Chinese names.
"""
function count_character(text::AbstractString, aliases::AbstractVector{<:AbstractString})
    names = unique(aliases)
    detail = Dict(alias => count(alias, text) for alias in names)
    isempty(names) && return 0, detail
    all(alias -> !isempty(alias) && all(isletter, alias), names) ||
        throw(ArgumentError("Aliases must contain letters only."))
    ordered = sort(names; by=alias -> (-length(alias), alias))
    matches = eachmatch(Regex(join(ordered, "|")), text)
    return count(_ -> true, matches), detail
end

function main(args=ARGS)
    path = isempty(args) ? joinpath(@__DIR__, "..", "data", "journey_to_the_west_gutenberg.txt") : args[1]
    text = load_text(path)
    println("Corpus: ", basename(path))
    println("Counts are keyword matches, not semantic entity recognition.")
    for (person, aliases) in CHARACTERS
        total, detail = count_character(text, aliases)
        println("\n", person, " — non-overlapping matches: ", total)
        for alias in aliases
            println("  ", alias, ": ", detail[alias], " (raw)")
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
