include("../aoc.jl")

import .AOC

data = split(AOC.get_input() |> strip, "\n")

# Part 1
function part1(dt::Array)
    colors = []
    vals = ["shiny gold"]
    r = r"(\w+\s\w+).+"

    while !isempty(vals)
        m = match.(r * Regex(join(vals, '|')), dt)
        vals = [i.captures |> only for i = m if i !== nothing]
        push!(colors, vals...)
    end
    colors |> Set |> length
end

data |> part1 |> println

# Part 2
r = r"(\d+)\s(\w+\s\w+)\sbags?"

process_line(x) = first(x), Dict(
    i.captures[end] => parse(Int, i.captures[1])
    for i = eachmatch(r, x |> last) if i !== nothing
)

function part2(dt::Dict, color="shiny gold")
    start = dt[color]
    isempty(start) ? 0 : sum(b * part2(dt, a) + b for (a, b) = start)
end

split.(data, " bags contain ") .|> process_line |> Dict |> part2 |> println
